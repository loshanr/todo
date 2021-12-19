import 'package:firebase_auth/firebase_auth.dart';

class AuthResult {
  final User? user;
  final String? error;

  AuthResult({this.user, this.error});

  factory AuthResult.fromFirebase(User user) {
    return AuthResult(user: user);
  }

  factory AuthResult.fromFirebaseError(String error) {
    return AuthResult(error: error);
  }
}

class AuthRepository {
  static final AuthRepository instance = AuthRepository._();
  late final FirebaseAuth _firebaseAuth;

  factory AuthRepository() {
    return instance;
  }

  AuthRepository._() {
    _firebaseAuth = FirebaseAuth.instance;
  }

  Future<AuthResult> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      UserCredential credential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        return AuthResult.fromFirebase(credential.user!);
      }
      return AuthResult.fromFirebaseError('Unexpected error');
    } catch (e) {
      print(e.toString());
      return AuthResult.fromFirebaseError(e.toString());
    }
  }

  Future<AuthResult> signUpWithEmailAndPassword({required String email, required String password}) async {
    try {
      UserCredential credential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        return AuthResult.fromFirebase(credential.user!);
      }
      return AuthResult.fromFirebaseError('Unexpected error');
    } catch (e) {
      print(e.toString());
      return AuthResult.fromFirebaseError(e.toString());
    }
  }

  Future<AuthResult> getCurrentUser() async {
    User? user = _firebaseAuth.currentUser;
    if (user != null) {
      return AuthResult.fromFirebase(user);
    }
    return AuthResult.fromFirebaseError('User not available');
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}
