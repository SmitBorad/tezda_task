import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth auth;

  AuthRepository(this.auth);

  Stream<User?> get authStateChanges => auth.authStateChanges();

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }

  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}
