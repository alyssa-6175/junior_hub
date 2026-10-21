# Firestore rules analysis and threat model

This file documents the application paths reviewed before changing
`firestore.rules`. It is intentionally kept as a local audit artifact.

## Collections and queries

- `users/{uid}`: the signed-in user's private preferences. The administrator
  dashboard lists this collection; ordinary users only read and write their own
  document.
- `users/{uid}/resourceActivity/{resourceId}`: private per-user open counts.
  Owners create/update their own resource rows; administrators may read them.
- `dailyActivity/{day}-{uid}`: one activity summary per user and day. Clients
  create/update their own row; administrators query `day == YYYY-MM-DD`.
- `resourceStats/{resourceId}`: aggregate resource analytics. Administrators
  read the collection; signed-in users may make one narrowly validated view,
  save, pin, or seen-state change involving only their own UID.

The app uses a single-field equality query on `dailyActivity.day` and no
multi-field query requiring a composite index. Resource stats are sorted in
the client so all catalog rows, including zero-count rows, remain visible.

## Assumptions

- Firebase Authentication is the sole identity authority.
- Administrator access comes from a verified, bootstrapped email or a verified
  Eastside Prep account with the Admin SDK-issued `admin` custom claim.
- Resource IDs are stable local catalog identifiers, at most 120 characters.
- Resource-stat UID lists are current-state membership lists. `viewerUids` is
  cumulative; save, pin, and seen lists add/remove the acting user's UID.
- Only an administrator creates resource-stat documents, which prevents normal
  users from creating arbitrary catalog rows.

## Red-team checks

1. Public reads: denied for every collection.
2. Cross-user reads/writes: denied on user data and activity subcollections.
3. Update bypass/schema pollution: create and update both call their collection
   validator; unknown fields are rejected.
4. Ownership hijacking: path UID and authenticated UID must match.
5. Admin escalation: authority comes only from verified token claims or the two
   bootstrapped verified emails, never document data.
6. Counter replay: save/pin/seen counts must equal their UID-list length and a
   non-admin may add/remove only their own UID. Replaying a toggle fails because
   the list transition no longer matches. Total views may increase on each open
   by design, while unique viewers can only add the caller once.
7. Type/size abuse: strings, lists, maps, timestamps, and numeric ranges are
   bounded. The user's private preference lists remain self-corruption-only;
   Firestore Rules cannot iterate every list element, so list type and size are
   enforced while the app writes catalog strings.
8. Timestamp manipulation: all activity and stats timestamps written by clients
   must equal `request.time`.
9. Mixed-content leak: ordinary users cannot read other users' documents or the
   administrator-only stats UID lists.
10. Missing parent/orphan access: resource activity is scoped by its owner path;
    aggregate stats updates require an existing administrator-seeded document.

Expected audit score after the change: 4/5. Cross-user access, privilege, and
aggregate integrity are tightly constrained. The remaining minor limitation is
that Firestore Rules cannot iterate through every element in the user's own
preference lists; a user could corrupt only their private preferences within
strict size limits.
