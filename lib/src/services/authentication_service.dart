import 'package:firebase_auth/firebase_auth.dart';
import 'package:zone/src/helpers/app_exception.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<dynamic> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential user =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return user != null;
    } catch (e) {
      throw AppException(e.toString());
    }
  }

  Future<dynamic> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential authResult =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return authResult.user != null;
    } catch (e) {
      throw AppException(e.toString());
    }
  }
}
