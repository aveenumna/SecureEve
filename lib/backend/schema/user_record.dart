import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class UserRecord extends FirestoreRecord {
  UserRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "guardian_email" field.
  String? _guardianEmail;
  String get guardianEmail => _guardianEmail ?? '';
  bool hasGuardianEmail() => _guardianEmail != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "confirm_password" field.
  String? _confirmPassword;
  String get confirmPassword => _confirmPassword ?? '';
  bool hasConfirmPassword() => _confirmPassword != null;

  void _initializeFields() {
    _displayName = snapshotData['display_name'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _email = snapshotData['email'] as String?;
    _guardianEmail = snapshotData['guardian_email'] as String?;
    _password = snapshotData['password'] as String?;
    _confirmPassword = snapshotData['confirm_password'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('User');

  static Stream<UserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRecord.fromSnapshot(s));

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRecord.fromSnapshot(s));

  static UserRecord fromSnapshot(DocumentSnapshot snapshot) => UserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserRecordData({
  String? displayName,
  String? phoneNumber,
  String? email,
  String? guardianEmail,
  String? password,
  String? confirmPassword,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'display_name': displayName,
      'phone_number': phoneNumber,
      'email': email,
      'guardian_email': guardianEmail,
      'password': password,
      'confirm_password': confirmPassword,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserRecordDocumentEquality implements Equality<UserRecord> {
  const UserRecordDocumentEquality();

  @override
  bool equals(UserRecord? e1, UserRecord? e2) {
    return e1?.displayName == e2?.displayName &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.email == e2?.email &&
        e1?.guardianEmail == e2?.guardianEmail &&
        e1?.password == e2?.password &&
        e1?.confirmPassword == e2?.confirmPassword;
  }

  @override
  int hash(UserRecord? e) => const ListEquality().hash([
        e?.displayName,
        e?.phoneNumber,
        e?.email,
        e?.guardianEmail,
        e?.password,
        e?.confirmPassword
      ]);

  @override
  bool isValidKey(Object? o) => o is UserRecord;
}
