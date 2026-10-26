import 'package:flutter/foundation.dart';

import 'dart:async';
import 'dart:io' show Platform;

import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:google_sign_in/google_sign_in.dart';

import 'package:flutter_appauth/flutter_appauth.dart';

import '../models/personal_deadline.dart';
import '../models/resource_stats.dart';

import '../data/majors_data.dart';
import '../data/resources_data.dart';

const _googleDesktopClientId =
    '76869443049-g4kjalna8kbptr9aosb94caqv70grsg2.apps.googleusercontent.com';

// Eastside Preparatory School's Microsoft Entra tenant. Keeping sign-in in
// this tenant prevents personal Microsoft accounts from entering the app.
const _microsoftTenantId = 'b2681e8b-dd20-46cf-b163-371a2d7c6014';
const _activityDashboardOwnerEmails = {
  'apan@eastsideprep.org',
  'alyssa.pannn@gmail.com',
};

class AppProvider extends ChangeNotifier {
  // ── Firebase & Auth Instances ────────────────────────────────────────────

  final _auth = FirebaseAuth.instance;

  final _db = FirebaseFirestore.instance;

  final _appAuth = const FlutterAppAuth();

  bool _isAdmin = false;

  // ── Auth State ───────────────────────────────────────────────────────────

  User? get firebaseUser => _auth.currentUser;

  /// Junior Hub is available to every authenticated Google or Microsoft user.
  bool get isAuthenticated => firebaseUser != null;

  bool get isLoggedIn => isAuthenticated;

  String? get userEmail => firebaseUser?.email;

  String get displayName =>
      firebaseUser?.displayName ??
      firebaseUser?.email?.split('@').first ??
      'User';

  bool get isAdmin => _isAdmin;

  bool get _isDesktop =>
      !kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS);

  // ── Search State ─────────────────────────────────────────────────────────

  String _searchQuery = '';

  String get searchQuery => _searchQuery;

  bool get isSearching => _searchQuery.trim().isNotEmpty;

  // ── Resource State ───────────────────────────────────────────────────────

  final Set<String> _saved = {};

  final Set<String> _pinned = {};

  final Set<String> _seen = {};

  final Set<String> _linkPinned = {};

  final Set<String> _linkSeen = {};

  final Map<String, Set<int>> _completedTests = {}; // NEW: Tracker state

  Set<String> get saved => Set.unmodifiable(_saved);

  Set<String> get pinned => Set.unmodifiable(_pinned);

  Set<String> get seen => Set.unmodifiable(_seen);

  bool isSaved(String id) => _saved.contains(id);

  bool isPinned(String id) => _pinned.contains(id);

  bool isSeen(String id) => _seen.contains(id);

  bool isLinkPinned(String resourceId, String label) =>
      _linkPinned.contains('$resourceId:$label');

  bool isLinkSeen(String resourceId, String label) =>
      _linkSeen.contains('$resourceId:$label');

  Set<int> completedTestsFor(String trackerId) =>
      Set.unmodifiable(_completedTests[trackerId] ?? {}); // NEW

  // ── Personal Deadlines & Majors ──────────────────────────────────────────

  final List<PersonalDeadline> _personalDeadlines = [];

  List<PersonalDeadline> get personalDeadlines =>
      List.unmodifiable(_personalDeadlines);

  final Set<String> _checkedMajors = {};

  Set<String> get checkedMajors => Set.unmodifiable(_checkedMajors);

  final List<String> _checkedMajorOrder = [];

  List<String> get checkedMajorOrder => List.unmodifiable(_checkedMajorOrder);

  final List<String> _checkedSubMajorOrder = [];

  List<String> get checkedSubMajorOrder =>
      List.unmodifiable(_checkedSubMajorOrder);

  bool isMajorChecked(String id) => _checkedMajors.contains(id);

  // ── Navigation State ─────────────────────────────────────────────────────

  String _currentView = 'home';

  String? _detailResourceId;

  String? _currentMajorGroup;

  String? _currentSubMajor;

  String _detailReturnView = 'ap';

  String _savedCategoryFilter = 'all';

  String get currentView => _currentView;

  String? get detailResourceId => _detailResourceId;

  String? get currentMajorGroup => _currentMajorGroup;

  String? get currentSubMajor => _currentSubMajor;

  String get detailReturnView => _detailReturnView;

  String get savedCategoryFilter => _savedCategoryFilter;

  String get detailReturnLabel => switch (_detailReturnView) {
    'home' => 'Saved resources',
    'my_majors' || 'major' => 'My Majors',
    _ => 'AP Courses',
  };

  // ── Init ─────────────────────────────────────────────────────────────────

  Future<void> init() async {
    if (firebaseUser != null) {
      await _refreshAdminStatus();
      await _loadFromFirestore();
      await _removeLegacyFeedbackMetadata();
      await _recordActivity('Signed in');
      if (_isAdmin) unawaited(synchronizeResourceStatsCatalog());
    }

    notifyListeners();
  }

  // ── Auth Methods ─────────────────────────────────────────────────────────

  Future<String?> signInWithGoogle() async {
    try {
      if (kIsWeb) {
        // Web: Firebase popup works natively

        final provider = GoogleAuthProvider();

        await _auth.signInWithPopup(provider);
      } else if (_isDesktop) {
        // Desktop uses the system browser, then exchanges the Google identity
        // token with Firebase. Only basic identity scopes are requested.
        final result = await _appAuth.authorizeAndExchangeCode(
          AuthorizationTokenRequest(
            _googleDesktopClientId,
            'http://localhost',
            discoveryUrl:
                'https://accounts.google.com/.well-known/openid-configuration',
            scopes: ['openid', 'email', 'profile'],
            preferEphemeralSession: false,
          ),
        );

        final credential = GoogleAuthProvider.credential(
          idToken: result.idToken,
          accessToken: result.accessToken,
        );
        await _auth.signInWithCredential(credential);
      } else {
        // Android and iOS use the Google Sign-In SDK.

        final googleUser = await GoogleSignIn().signIn();

        if (googleUser == null) return 'Sign-in cancelled.';

        final googleAuth = await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,

          idToken: googleAuth.idToken,
        );

        await _auth.signInWithCredential(credential);
      }

      await _postSignIn();

      return null;
    } catch (e) {
      return 'Sign-in failed: $e';
    }
  }

  /// Microsoft sign-in is a web flow. Its Azure application registration and
  /// Firebase provider configuration are managed outside this codebase.
  Future<String?> signInWithMicrosoft() async {
    if (!kIsWeb) {
      return 'Microsoft sign-in is available on the Junior Hub web app.';
    }

    try {
      final provider = MicrosoftAuthProvider()
        ..setCustomParameters({
          'tenant': _microsoftTenantId,
          'prompt': 'select_account',
        });
      await _auth.signInWithPopup(provider);

      await _postSignIn();
      return null;
    } catch (e) {
      return 'Microsoft sign-in failed: $e';
    }
  }

  Future<void> _postSignIn() async {
    await _refreshAdminStatus();
    await _loadFromFirestore();
    await _removeLegacyFeedbackMetadata();
    await _recordActivity('Signed in');
    if (_isAdmin) unawaited(synchronizeResourceStatsCatalog());

    notifyListeners();
  }

  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
    } catch (_) {
      // Firebase sign-out below is the authoritative session cleanup.
    }

    await _auth.signOut();

    _isAdmin = false;

    _saved.clear();

    _pinned.clear();

    _seen.clear();

    _linkPinned.clear();

    _linkSeen.clear();

    _completedTests.clear(); // NEW: Clear test trackers on logout

    _checkedMajors.clear();

    _checkedMajorOrder.clear();

    _checkedSubMajorOrder.clear();

    _personalDeadlines.clear();

    _currentView = 'home';

    _detailResourceId = null;

    notifyListeners();
  }

  // ── Firestore Load / Save Helpers ────────────────────────────────────────

  Future<void> _loadFromFirestore() async {
    final uid = firebaseUser?.uid;

    if (uid == null) return;

    final doc = await _db.collection('users').doc(uid).get();

    if (!doc.exists) return;

    final data = doc.data()!;

    _saved.addAll(List<String>.from(data['saved'] ?? []));

    _pinned.addAll(List<String>.from(data['pinned'] ?? []));

    _seen.addAll(List<String>.from(data['seen'] ?? []));

    _linkPinned.addAll(List<String>.from(data['linkPinned'] ?? []));

    _linkSeen.addAll(List<String>.from(data['linkSeen'] ?? []));

    _checkedMajors.addAll(List<String>.from(data['checkedMajors'] ?? []));

    _checkedMajorOrder.addAll(
      List<String>.from(
        data['checkedMajorOrder'] ?? [],
      ).where((id) => majorGroups.any((group) => group.id == id)),
    );

    _checkedSubMajorOrder.addAll(
      List<String>.from(
        data['checkedSubMajorOrder'] ?? [],
      ).where((id) => findSubMajor(id) != null),
    );

    // NEW: Load completed tests map from Firestore
    final ctData = data['completedTests'] as Map<String, dynamic>? ?? {};
    _completedTests.clear();
    ctData.forEach((k, v) {
      _completedTests[k] = Set<int>.from((v as List).cast<int>());
    });

    final pdList = List<Map<String, dynamic>>.from(
      data['personalDeadlines'] ?? [],
    );

    _personalDeadlines.addAll(
      pdList.map((data) => PersonalDeadline.fromJson(data)),
    );
    _sortPersonalDeadlines();

    // Clean up expired deadlines after loading from Firestore

    await removeExpiredDeadlines();
  }

  Future<void> _save(String field, dynamic value, {String? activity}) async {
    final uid = firebaseUser?.uid;

    if (uid == null) return;

    final update = <String, dynamic>{field: value};
    if (activity != null) {
      update.addAll(_activitySummary(activity));
    }

    await _db.collection('users').doc(uid).set(update, SetOptions(merge: true));

    if (activity != null) {
      await _saveDailyActivity(activity);
    }
  }

  Future<void> _refreshAdminStatus() async {
    final user = firebaseUser;
    if (user == null) {
      _isAdmin = false;
      return;
    }

    final token = await user.getIdTokenResult();
    final tokenEmail = token.claims?['email'];
    final email = (tokenEmail is String ? tokenEmail : user.email ?? '')
        .toLowerCase();
    final emailVerified = token.claims?['email_verified'] == true;
    _isAdmin =
        emailVerified &&
        (_activityDashboardOwnerEmails.contains(email) ||
            (token.claims?['admin'] == true &&
                email.endsWith('@eastsideprep.org')));
  }

  Map<String, dynamic> _activitySummary(String action) {
    final email = firebaseUser?.email?.trim();
    if (email == null || email.isEmpty) return {};

    return {
      'email': email,
      'lastActiveAt': FieldValue.serverTimestamp(),
      'lastAction': action,
      'lastActionAt': FieldValue.serverTimestamp(),
    };
  }

  String _activityDay(DateTime date) {
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '${date.year}-$month-$day';
  }

  Future<void> _recordActivity(String action) async {
    final uid = firebaseUser?.uid;
    if (uid == null) return;

    final summary = _activitySummary(action);
    if (summary.isEmpty) return;

    try {
      await _db
          .collection('users')
          .doc(uid)
          .set(summary, SetOptions(merge: true));
      await _saveDailyActivity(action);
    } catch (e) {
      debugPrint('Activity summary tracking failed: $e');
    }
  }

  Future<void> _saveDailyActivity(String action) async {
    final user = firebaseUser;
    final email = user?.email?.trim();
    if (user == null || email == null || email.isEmpty) return;

    final day = _activityDay(DateTime.now());
    try {
      await _db.collection('dailyActivity').doc('$day-${user.uid}').set({
        'uid': user.uid,
        'email': email,
        'day': day,
        'lastAction': action,
        'lastActionAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    } catch (e) {
      debugPrint('Daily activity tracking failed: $e');
    }
  }

  /// Removes identifiers written by pre-privacy-review app versions. This runs
  /// only against the signed-in user's own document.
  Future<void> _removeLegacyFeedbackMetadata() async {
    final uid = firebaseUser?.uid;
    if (uid == null) return;

    final ref = _db.collection('users').doc(uid);
    final existing = await ref.get();
    if (!existing.exists) return;

    await ref.set({
      'feedbackFormClickCount': FieldValue.delete(),
      'feedbackFormLastClickedAt': FieldValue.delete(),
      'feedbackFormLastClickedByUid': FieldValue.delete(),
      'feedbackFormLastClickedByName': FieldValue.delete(),
      'feedbackFormLastClickedByEmail': FieldValue.delete(),
    }, SetOptions(merge: true));
  }

  /// Stores a student's most recent opening of each Junior Hub resource. This
  /// supports administrator reporting on resource usage, not audit-grade logs.
  Future<void> trackResourceOpen(String resourceId) async {
    final uid = firebaseUser?.uid;
    if (uid == null || !isLoggedIn) return;

    try {
      final activityRef = _db
          .collection('users')
          .doc(uid)
          .collection('resourceActivity')
          .doc(resourceId);
      final firstOpen = await _db.runTransaction<bool>((transaction) async {
        final existing = await transaction.get(activityRef);
        final currentCount = existing.data()?['openCount'];
        final nextCount = currentCount is int ? currentCount + 1 : 1;
        transaction.set(activityRef, {
          'lastOpenedAt': FieldValue.serverTimestamp(),
          'openCount': nextCount,
        });
        return !existing.exists;
      });
      await _updateResourceStats(
        resourceId,
        ResourceStatAction.view,
        firstView: firstOpen,
      );
      await _recordActivity('Opened a resource');
    } catch (e) {
      debugPrint('Resource activity tracking failed: $e');
    }
  }

  Future<void> _updateResourceStats(
    String resourceId,
    ResourceStatAction action, {
    bool? enabled,
    bool firstView = false,
  }) async {
    final uid = firebaseUser?.uid;
    if (uid == null) return;

    final update = <String, dynamic>{'updatedAt': FieldValue.serverTimestamp()};

    switch (action) {
      case ResourceStatAction.view:
        update.addAll({
          'totalViews': FieldValue.increment(1),
          'viewerUids': FieldValue.arrayUnion([uid]),
          'lastViewedAt': FieldValue.serverTimestamp(),
          if (firstView) 'uniqueViewerCount': FieldValue.increment(1),
        });
      case ResourceStatAction.save:
        update.addAll({
          'savedCount': FieldValue.increment(enabled == true ? 1 : -1),
          'savedUids': enabled == true
              ? FieldValue.arrayUnion([uid])
              : FieldValue.arrayRemove([uid]),
        });
      case ResourceStatAction.pin:
        update.addAll({
          'pinnedCount': FieldValue.increment(enabled == true ? 1 : -1),
          'pinnedUids': enabled == true
              ? FieldValue.arrayUnion([uid])
              : FieldValue.arrayRemove([uid]),
        });
      case ResourceStatAction.seen:
        update.addAll({
          'seenCount': FieldValue.increment(enabled == true ? 1 : -1),
          'seenUids': enabled == true
              ? FieldValue.arrayUnion([uid])
              : FieldValue.arrayRemove([uid]),
        });
    }

    final statsRef = _db.collection('resourceStats').doc(resourceId);
    try {
      await statsRef.update(update);
    } catch (e) {
      // A legacy user can have private open history without appearing in the
      // old aggregate document. Retry once with the opposite unique-viewer
      // transition so the UID list and count can repair themselves.
      if (action == ResourceStatAction.view) {
        final retry = Map<String, dynamic>.from(update);
        if (firstView) {
          retry.remove('uniqueViewerCount');
        } else {
          retry['uniqueViewerCount'] = FieldValue.increment(1);
        }
        try {
          await statsRef.update(retry);
          return;
        } catch (_) {
          // Report the original failure below; analytics never blocks the UI.
        }
      }
      debugPrint('Resource stats update failed for $resourceId: $e');
    }
  }

  /// Ensures the administrator-only analytics collection has one row for
  /// every resource in the local catalog and upgrades legacy view-only rows.
  Future<void> synchronizeResourceStatsCatalog() async {
    if (!_isAdmin) return;

    try {
      final snapshot = await _db.collection('resourceStats').get();
      final existingById = {for (final doc in snapshot.docs) doc.id: doc};
      final userSnapshot = await _db.collection('users').get();
      final catalogIds = allResources.map((resource) => resource.id).toSet();
      final savedByResource = <String, Set<String>>{};
      final pinnedByResource = <String, Set<String>>{};
      final seenByResource = <String, Set<String>>{};
      final viewersByResource = <String, Set<String>>{};
      final activityViewsByResource = <String, int>{};
      final lastActivityViewByResource = <String, Timestamp>{};

      void indexUserState(
        String uid,
        dynamic value,
        Map<String, Set<String>> destination,
      ) {
        for (final resourceId in _validStringList(value)) {
          if (catalogIds.contains(resourceId)) {
            destination.putIfAbsent(resourceId, () => <String>{}).add(uid);
          }
        }
      }

      for (final user in userSnapshot.docs) {
        final data = user.data();
        indexUserState(user.id, data['saved'], savedByResource);
        indexUserState(user.id, data['pinned'], pinnedByResource);
        indexUserState(user.id, data['seen'], seenByResource);
      }

      final activitySnapshots = await Future.wait(
        userSnapshot.docs.map(
          (user) => user.reference.collection('resourceActivity').get(),
        ),
      );
      for (var index = 0; index < userSnapshot.docs.length; index++) {
        final uid = userSnapshot.docs[index].id;
        for (final activity in activitySnapshots[index].docs) {
          final resourceId = activity.id;
          if (!catalogIds.contains(resourceId)) continue;
          final data = activity.data();
          viewersByResource.putIfAbsent(resourceId, () => <String>{}).add(uid);
          final openCount = data['openCount'];
          if (openCount is int && openCount > 0) {
            activityViewsByResource.update(
              resourceId,
              (current) => current + openCount,
              ifAbsent: () => openCount,
            );
          }
          final lastOpenedAt = data['lastOpenedAt'];
          if (lastOpenedAt is Timestamp) {
            final current = lastActivityViewByResource[resourceId];
            if (current == null ||
                lastOpenedAt.toDate().isAfter(current.toDate())) {
              lastActivityViewByResource[resourceId] = lastOpenedAt;
            }
          }
        }
      }

      final writes =
          <
            MapEntry<
              DocumentReference<Map<String, dynamic>>,
              Map<String, dynamic>
            >
          >[];

      for (final resource in allResources) {
        final existing = existingById[resource.id];
        final data = existing?.data() ?? const <String, dynamic>{};
        final stats = ResourceStats.fromMap(resource.id, data);
        final viewerUids = {
          ...stats.viewerUids,
          ...?viewersByResource[resource.id],
        }.toList()..sort();
        final savedUids =
            (savedByResource[resource.id] ?? const <String>{}).toList()..sort();
        final pinnedUids =
            (pinnedByResource[resource.id] ?? const <String>{}).toList()
              ..sort();
        final seenUids =
            (seenByResource[resource.id] ?? const <String>{}).toList()..sort();
        final existingLastViewed = data['lastViewedAt'] ?? data['lastViewed'];
        final activityLastViewed = lastActivityViewByResource[resource.id];
        final lastViewedAt =
            existingLastViewed is Timestamp &&
                (activityLastViewed == null ||
                    !activityLastViewed.toDate().isAfter(
                      existingLastViewed.toDate(),
                    ))
            ? existingLastViewed
            : activityLastViewed;
        final activityViews = activityViewsByResource[resource.id] ?? 0;
        final totalViews = [
          stats.totalViews,
          activityViews,
          viewerUids.length,
        ].reduce((a, b) => a > b ? a : b);

        final normalized = <String, dynamic>{
          'resourceId': resource.id,
          'title': resource.title,
          'category': resource.category,
          'totalViews': totalViews,
          'uniqueViewerCount': viewerUids.length,
          'viewerUids': viewerUids,
          'savedCount': savedUids.length,
          'savedUids': savedUids,
          'pinnedCount': pinnedUids.length,
          'pinnedUids': pinnedUids,
          'seenCount': seenUids.length,
          'seenUids': seenUids,
          if (lastViewedAt is Timestamp) 'lastViewedAt': lastViewedAt,
          'updatedAt': FieldValue.serverTimestamp(),
        };

        if (existing == null || !_isCurrentResourceStats(data, normalized)) {
          writes.add(
            MapEntry(
              _db.collection('resourceStats').doc(resource.id),
              normalized,
            ),
          );
        }
      }

      for (var offset = 0; offset < writes.length; offset += 400) {
        final batch = _db.batch();
        final end = (offset + 400).clamp(0, writes.length);
        for (final write in writes.sublist(offset, end)) {
          batch.set(write.key, write.value);
        }
        await batch.commit();
      }
    } catch (e) {
      debugPrint('Resource stats catalog synchronization failed: $e');
    }
  }

  List<String> _validStringList(dynamic value) {
    if (value is! List) return const [];
    return value.whereType<String>().toSet().toList()..sort();
  }

  bool _isCurrentResourceStats(
    Map<String, dynamic> current,
    Map<String, dynamic> normalized,
  ) {
    const requiredFields = {
      'resourceId',
      'title',
      'category',
      'totalViews',
      'uniqueViewerCount',
      'viewerUids',
      'savedCount',
      'savedUids',
      'pinnedCount',
      'pinnedUids',
      'seenCount',
      'seenUids',
      'updatedAt',
    };
    if (!current.keys.toSet().containsAll(requiredFields) ||
        current.containsKey('viewerEmails') ||
        current.containsKey('lastViewed')) {
      return false;
    }

    for (final field in requiredFields.where((field) => field != 'updatedAt')) {
      final expected = normalized[field];
      final actual = current[field];
      if (expected is List && actual is List) {
        if (expected.length != actual.length ||
            !expected.toSet().containsAll(actual)) {
          return false;
        }
      } else if (expected != actual) {
        return false;
      }
    }
    return true;
  }

  // ── Toggles & State Updates (Persisted to Firestore) ─────────────────────

  // NEW: Test Tracker Toggle
  Future<void> toggleTest(String trackerId, int testNumber) async {
    if (!isLoggedIn) return;

    final current = Set<int>.from(_completedTests[trackerId] ?? {});
    if (current.contains(testNumber)) {
      current.remove(testNumber);
    } else {
      current.add(testNumber);
    }
    _completedTests[trackerId] = current;

    notifyListeners();
    await _saveCompletedTests();
  }

  // NEW: Save Test Tracker State
  Future<void> _saveCompletedTests() async {
    final map = _completedTests.map((k, v) => MapEntry(k, v.toList()));
    await _save(
      'completedTests',
      map,
      activity: 'Updated practice-test progress',
    );
  }

  Future<void> toggleSaved(String id) async {
    if (!isLoggedIn) return;

    if (_saved.contains(id)) {
      _saved.remove(id);
    } else {
      _saved.add(id);
    }
    final enabled = _saved.contains(id);

    notifyListeners();

    await _save('saved', _saved.toList(), activity: 'Updated saved resources');
    await _updateResourceStats(id, ResourceStatAction.save, enabled: enabled);
  }

  Future<void> togglePinned(String id) async {
    if (!isLoggedIn) return;

    if (_pinned.contains(id)) {
      _pinned.remove(id);
    } else {
      _pinned.add(id);
    }
    final enabled = _pinned.contains(id);

    notifyListeners();

    await _save(
      'pinned',
      _pinned.toList(),
      activity: 'Updated pinned resources',
    );
    await _updateResourceStats(id, ResourceStatAction.pin, enabled: enabled);
  }

  Future<void> toggleSeen(String id) async {
    if (!isLoggedIn) return;

    if (_seen.contains(id)) {
      _seen.remove(id);
    } else {
      _seen.add(id);
    }
    final enabled = _seen.contains(id);

    notifyListeners();

    await _save('seen', _seen.toList(), activity: 'Marked a resource as seen');
    await _updateResourceStats(id, ResourceStatAction.seen, enabled: enabled);
  }

  Future<void> toggleLinkPinned(String resourceId, String label) async {
    if (!isLoggedIn) return;

    final key = '$resourceId:$label';

    if (_linkPinned.contains(key)) {
      _linkPinned.remove(key);
    } else {
      _linkPinned.add(key);
    }

    notifyListeners();

    await _save(
      'linkPinned',
      _linkPinned.toList(),
      activity: 'Updated pinned links',
    );
  }

  Future<void> toggleLinkSeen(String resourceId, String label) async {
    if (!isLoggedIn) return;

    final key = '$resourceId:$label';

    if (_linkSeen.contains(key)) {
      _linkSeen.remove(key);
    } else {
      _linkSeen.add(key);
    }

    notifyListeners();

    await _save(
      'linkSeen',
      _linkSeen.toList(),
      activity: 'Marked a link as seen',
    );
  }

  Future<void> addPersonalDeadline(PersonalDeadline deadline) async {
    if (!isLoggedIn) return;

    final alreadySaved = _personalDeadlines.any(
      (saved) =>
          saved.id == deadline.id ||
          (saved.resourceId == deadline.resourceId &&
              saved.dateIso == deadline.dateIso),
    );
    if (alreadySaved) return;

    _personalDeadlines.add(deadline);
    _sortPersonalDeadlines();

    notifyListeners();

    await _save(
      'personalDeadlines',

      _personalDeadlines.map((d) => d.toJson()).toList(),
      activity: 'Added a personal deadline',
    );
  }

  bool hasPersonalDeadline(String resourceId, String dateIso) =>
      _personalDeadlines.any(
        (deadline) =>
            deadline.resourceId == resourceId && deadline.dateIso == dateIso,
      );

  Future<void> removePersonalDeadline(String id) async {
    if (!isLoggedIn) return;

    _personalDeadlines.removeWhere((d) => d.id == id);

    await _save(
      'personalDeadlines',

      _personalDeadlines.map((d) => d.toJson()).toList(),
      activity: 'Removed a personal deadline',
    );

    notifyListeners();
  }

  /// Keeps the deadline panel in soonest-first order, including after a
  /// persisted list is restored or a user adds a new personal deadline.
  void _sortPersonalDeadlines() {
    _personalDeadlines.sort((a, b) {
      final aDate = DateTime.tryParse(a.dateIso);
      final bDate = DateTime.tryParse(b.dateIso);
      if (aDate == null && bDate == null) {
        return a.title.compareTo(b.title);
      }
      if (aDate == null) return 1;
      if (bDate == null) return -1;

      final dateCompare = aDate.compareTo(bDate);
      return dateCompare != 0 ? dateCompare : a.title.compareTo(b.title);
    });
  }

  /// Removes any personal deadlines whose date has already passed.

  /// Called on app init and whenever the deadline panel opens.

  Future<void> removeExpiredDeadlines() async {
    if (!isLoggedIn) return;

    final before = _personalDeadlines.length;

    _personalDeadlines.removeWhere((d) => d.isExpired);

    if (_personalDeadlines.length != before) {
      // Save the updated list to Firestore

      await _save(
        'personalDeadlines',

        _personalDeadlines.map((d) => d.toJson()).toList(),
      );

      notifyListeners();
    }
  }

  Future<void> toggleCheckedMajor(String id) async {
    if (!isLoggedIn) return;

    final group = majorGroups.where((g) => g.id == id).firstOrNull;

    if (group != null) {
      final allSubsChecked = group.subcategories.every(
        (s) => _checkedMajors.contains(s.id),
      );

      if (allSubsChecked) {
        _checkedMajors.remove(id);

        _checkedMajorOrder.remove(id);

        for (final sub in group.subcategories) {
          _checkedMajors.remove(sub.id);

          _checkedSubMajorOrder.remove(sub.id);
        }
      } else {
        _checkedMajors.add(id);

        _checkedMajorOrder
          ..remove(id)
          ..insert(0, id);

        for (final sub in group.subcategories) {
          _checkedMajors.add(sub.id);
        }
      }
    } else {
      if (_checkedMajors.contains(id)) {
        _checkedMajors.remove(id);

        _checkedSubMajorOrder.remove(id);
      } else {
        _checkedMajors.add(id);

        _checkedSubMajorOrder
          ..remove(id)
          ..insert(0, id);
      }

      final parentGroup = groupForSubMajor(id);

      if (parentGroup != null) {
        final allChecked = parentGroup.subcategories.every(
          (s) => _checkedMajors.contains(s.id),
        );

        if (allChecked) {
          _checkedMajors.add(parentGroup.id);
        } else {
          _checkedMajors.remove(parentGroup.id);
        }

        final anyChecked = parentGroup.subcategories.any(
          (sub) => _checkedMajors.contains(sub.id),
        );
        if (!anyChecked) {
          _checkedMajorOrder.remove(parentGroup.id);
        }
      }
    }

    notifyListeners();

    await _save('checkedMajors', _checkedMajors.toList());

    await _save('checkedMajorOrder', _checkedMajorOrder);

    await _save(
      'checkedSubMajorOrder',
      _checkedSubMajorOrder,
      activity: 'Updated selected majors',
    );
  }

  // ── Navigation & Search Actions ──────────────────────────────────────────

  void setSearchQuery(String q) {
    _searchQuery = q;

    notifyListeners();
  }

  void clearSearch() {
    _searchQuery = '';

    notifyListeners();
  }

  void navigateTo(String view, {String? detailId}) {
    if (view == 'ap_detail') {
      _detailReturnView = _currentView;
    }

    _currentView = view;

    _detailResourceId = detailId;

    notifyListeners();
  }

  void returnFromResourceDetail() {
    final returnView = _detailReturnView;

    _currentView = returnView;

    _detailResourceId = null;

    _detailReturnView = 'ap';

    notifyListeners();
  }

  void setSavedCategoryFilter(String category) {
    if (_savedCategoryFilter == category) return;

    _savedCategoryFilter = category;

    notifyListeners();
  }

  void navigateToMajor(String groupId, {String? subMajorId}) {
    _currentView = 'major';

    _currentMajorGroup = groupId;

    _currentSubMajor = subMajorId;

    _detailResourceId = null;

    notifyListeners();
  }
}
