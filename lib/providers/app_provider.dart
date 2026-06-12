import 'package:flutter/foundation.dart';

import 'dart:io' show Platform;

import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_analytics/firebase_analytics.dart';

import 'package:google_sign_in/google_sign_in.dart';

import 'package:flutter_appauth/flutter_appauth.dart';

import '../models/personal_deadline.dart';

import '../data/majors_data.dart';

// Add this constant — replace with your actual Desktop client ID from Step 2:

const _googleDesktopClientId =
    '76869443049-g4kjalna8kbptr9aosb94caqv70grsg2.apps.googleusercontent.com';

class AppProvider extends ChangeNotifier {
  // ── Firebase & Auth Instances ────────────────────────────────────────────

  final _auth = FirebaseAuth.instance;

  final _db = FirebaseFirestore.instance;

  final _analytics = FirebaseAnalytics.instance;

  final _appAuth = const FlutterAppAuth();

  // ── Auth State ───────────────────────────────────────────────────────────

  bool _isGuest = false;

  // admin priv

  bool get isAdmin {
    return userEmail == 'alyssa.pannn@gmail.com';
  }

  User? get firebaseUser => _auth.currentUser;

  bool get isGuest => _isGuest;

  bool get isAuthenticated => firebaseUser != null || _isGuest;

  bool get isLoggedIn => firebaseUser != null && !_isGuest;

  String? get userEmail => firebaseUser?.email;

  String get displayName =>
      firebaseUser?.displayName ??
      firebaseUser?.email?.split('@').first ??
      'Guest';

  // Helper for desktop platform checking

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

  // ── Personal Deadlines & Majors ──────────────────────────────────────────

  final List<PersonalDeadline> _personalDeadlines = [];

  List<PersonalDeadline> get personalDeadlines =>
      List.unmodifiable(_personalDeadlines);

  final Set<String> _checkedMajors = {};

  Set<String> get checkedMajors => Set.unmodifiable(_checkedMajors);

  bool isMajorChecked(String id) => _checkedMajors.contains(id);

  // ── Navigation State ─────────────────────────────────────────────────────

  String _currentView = 'home';

  String? _detailResourceId;

  String? _currentMajorGroup;

  String? _currentSubMajor;

  String get currentView => _currentView;

  String? get detailResourceId => _detailResourceId;

  String? get currentMajorGroup => _currentMajorGroup;

  String? get currentSubMajor => _currentSubMajor;

  // ── Init ─────────────────────────────────────────────────────────────────

  Future<void> init() async {
    if (firebaseUser != null) {
      await _loadFromFirestore();
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
      } else if (!kIsWeb && _isDesktop) {
        // Windows/Linux: use flutter_appauth to open system browser

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
        // macOS / Android / iOS: google_sign_in works here

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

  Future<String?> signInWithMicrosoft() async {
    try {
      if (kIsWeb) {
        // Web: Firebase popup works natively

        final provider = MicrosoftAuthProvider();

        await _auth.signInWithPopup(provider);
      } else if (_isDesktop) {
        // Windows: use flutter_appauth with Microsoft OAuth endpoint

        final result = await _appAuth.authorizeAndExchangeCode(
          AuthorizationTokenRequest(
            'YOUR_AZURE_CLIENT_ID', // from your Azure app registration

            'http://localhost',

            discoveryUrl:
                'https://login.microsoftonline.com/common/v2.0/.well-known/openid-configuration',

            scopes: ['openid', 'email', 'profile'],

            preferEphemeralSession: false,
          ),
        );

        final oauthCredential = OAuthProvider(
          'microsoft.com',
        ).credential(idToken: result.idToken, accessToken: result.accessToken);

        await _auth.signInWithCredential(oauthCredential);
      } else {
        // macOS / iOS: signInWithProvider works on Apple platforms

        final provider = MicrosoftAuthProvider();

        await _auth.signInWithProvider(provider);
      }

      await _postSignIn();

      return null;
    } catch (e) {
      return 'Sign-in failed: $e';
    }
  }

  Future<void> _postSignIn() async {
    _isGuest = false;

    await _loadFromFirestore();

    await _analytics.logLogin(
      loginMethod: firebaseUser?.providerData.first.providerId ?? 'unknown',
    );

    notifyListeners();
  }

  void continueAsGuest() {
    _isGuest = true;

    notifyListeners();
  }

  Future<void> logout() async {
    // Only attempt Google Sign Out on supported platforms (Web, macOS, iOS, Android)

    if (kIsWeb || !_isDesktop) {
      try {
        await GoogleSignIn().signOut();
      } catch (e) {
        // Silently handle if the user wasn't signed in via Google
      }
    }

    await _auth.signOut();

    _isGuest = false;

    _saved.clear();

    _pinned.clear();

    _seen.clear();

    _linkPinned.clear();

    _linkSeen.clear();

    _checkedMajors.clear();

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

    final pdList = List<Map<String, dynamic>>.from(
      data['personalDeadlines'] ?? [],
    );

    _personalDeadlines.addAll(
      pdList.map((data) => PersonalDeadline.fromJson(data)),
    );

    // NEW: Clean up expired deadlines after loading from Firestore

    await removeExpiredDeadlines();
  }

  Future<void> _save(String field, dynamic value) async {
    final uid = firebaseUser?.uid;

    if (uid == null) return;

    await _db.collection('users').doc(uid).set({
      field: value,
    }, SetOptions(merge: true));
  }

  // ── Toggles & State Updates (Persisted to Firestore) ─────────────────────

  Future<void> toggleSaved(String id) async {
    if (!isLoggedIn) return;

    if (_saved.contains(id)) {
      _saved.remove(id);
    } else {
      _saved.add(id);

      await _analytics.logEvent(
        name: 'resource_flagged',

        parameters: {'resource_id': id},
      );
    }

    await _save('saved', _saved.toList());

    notifyListeners();
  }

  Future<void> togglePinned(String id) async {
    if (!isLoggedIn) return;

    if (_pinned.contains(id)) {
      _pinned.remove(id);
    } else {
      _pinned.add(id);

      await _analytics.logEvent(
        name: 'resource_pinned',

        parameters: {'resource_id': id},
      );
    }

    await _save('pinned', _pinned.toList());

    notifyListeners();
  }

  Future<void> toggleSeen(String id) async {
    if (!isLoggedIn) return;

    if (_seen.contains(id)) {
      _seen.remove(id);
    } else {
      _seen.add(id);
    }

    await _save('seen', _seen.toList());

    notifyListeners();
  }

  Future<void> toggleLinkPinned(String resourceId, String label) async {
    if (!isLoggedIn) return;

    final key = '$resourceId:$label';

    if (_linkPinned.contains(key)) {
      _linkPinned.remove(key);
    } else {
      _linkPinned.add(key);
    }

    await _save('linkPinned', _linkPinned.toList());

    notifyListeners();
  }

  Future<void> toggleLinkSeen(String resourceId, String label) async {
    if (!isLoggedIn) return;

    final key = '$resourceId:$label';

    if (_linkSeen.contains(key)) {
      _linkSeen.remove(key);
    } else {
      _linkSeen.add(key);
    }

    await _save('linkSeen', _linkSeen.toList());

    notifyListeners();
  }

  Future<void> addPersonalDeadline(PersonalDeadline deadline) async {
    if (!isLoggedIn) return;

    _personalDeadlines.add(deadline);

    await _analytics.logEvent(name: 'personal_deadline_added');

    await _save(
      'personalDeadlines',

      _personalDeadlines.map((d) => d.toJson()).toList(),
    );

    notifyListeners();
  }

  Future<void> removePersonalDeadline(String id) async {
    if (!isLoggedIn) return;

    _personalDeadlines.removeWhere((d) => d.id == id);

    await _save(
      'personalDeadlines',

      _personalDeadlines.map((d) => d.toJson()).toList(),
    );

    notifyListeners();
  }

  // NEW: Adjusted to use Firestore `_save()` instead of `_persistDeadlines()`

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

    bool wasAdded = false;

    if (group != null) {
      final allSubsChecked = group.subcategories.every(
        (s) => _checkedMajors.contains(s.id),
      );

      if (allSubsChecked) {
        _checkedMajors.remove(id);

        for (final sub in group.subcategories) {
          _checkedMajors.remove(sub.id);
        }
      } else {
        _checkedMajors.add(id);

        for (final sub in group.subcategories) {
          _checkedMajors.add(sub.id);
        }

        wasAdded = true;
      }
    } else {
      if (_checkedMajors.contains(id)) {
        _checkedMajors.remove(id);
      } else {
        _checkedMajors.add(id);

        wasAdded = true;
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
      }
    }

    if (wasAdded) {
      await _analytics.logEvent(
        name: 'major_checked',

        parameters: {'major_id': id},
      );
    }

    await _save('checkedMajors', _checkedMajors.toList());

    notifyListeners();
  }

  // ── Analytics & Tracking ─────────────────────────────────────────────────

  Future<void> logFeedbackOpened() async {
    await _analytics.logEvent(name: 'feedback_opened');
  }

  // NEW: Resource view tracking logic

  /// Tracks a resource view in Firestore.

  /// Records total views + unique accounts. No UI — for analytics only.

  Future<void> trackResourceView(String resourceId) async {
    if (!isLoggedIn) return; // guests are not tracked

    final uid = firebaseUser!.uid;

    final docRef = _db.collection('resourceStats').doc(resourceId);

    try {
      await _db.runTransaction((tx) async {
        final snap = await tx.get(docRef);

        if (!snap.exists) {
          tx.set(docRef, {
            'totalViews': 1,

            'uniqueViewerCount': 1,

            'viewerUids': [uid],

            'lastViewed': FieldValue.serverTimestamp(),
          });
        } else {
          final data = snap.data()!;

          final viewers = List<String>.from(data['viewerUids'] ?? []);

          final isNew = !viewers.contains(uid);

          final updates = <String, dynamic>{
            'totalViews': FieldValue.increment(1),

            'lastViewed': FieldValue.serverTimestamp(),
          };

          if (isNew) {
            updates['uniqueViewerCount'] = FieldValue.increment(1);

            updates['viewerUids'] = FieldValue.arrayUnion([uid]);
          }

          tx.update(docRef, updates);
        }
      });
    } catch (e) {
      debugPrint(
        'trackResourceView error: $e',
      ); // never crash the app for analytics
    }
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
    _currentView = view;

    _detailResourceId = detailId;

    if (detailId != null) {
      _analytics.logEvent(
        name: 'ap_course_viewed',

        parameters: {'course_id': detailId},
      );
    }

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
