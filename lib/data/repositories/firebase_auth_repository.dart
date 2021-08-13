import 'package:seller/ui/common/helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:seller/data/providers/firebase_provider.dart';

import 'package:diiket_models/all.dart' as models;

// biar nggak bingung sama model User
typedef FirebaseUser = User;

final firebaseAuthRepositoryProvider = Provider<FirebaseAuthRepository>((ref) {
  return FirebaseAuthRepository(ref.read(firebaseAuthProvider));
});

abstract class BaseFirebaseAuthRepository {
  Stream<FirebaseUser?> get authStateChanges;
  Future<void> signInWithPhoneCredential(PhoneAuthCredential credential);
  FirebaseUser? getCurrentFirebaseUser();
  Future<void> signOut();
}

class FirebaseAuthRepository extends BaseFirebaseAuthRepository {
  FirebaseAuth _auth;

  FirebaseAuthRepository(this._auth);

  @override
  Stream<FirebaseUser?> get authStateChanges => _auth.authStateChanges();

  @override
  FirebaseUser? getCurrentFirebaseUser() {
    return _auth.currentUser;
  }

  @override
  Future<void> signInWithPhoneCredential(PhoneAuthCredential credential) async {
    try {
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (error) {
      throw models.CustomException(
        message: Helper.getFirebaseAuthExceptionMessage('auth/${error.code}'),
        stackTrace: error.stackTrace,
        reason: 'auth/${error.code}',
      );
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (error) {
      throw models.CustomException(message: error.message);
    }
  }
}
