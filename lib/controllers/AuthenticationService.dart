import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  String statusUsuario = "";
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String> getCurrentUID() async {
    return _firebaseAuth.currentUser.uid;
  }

  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      statusUsuario = "Signed in";
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      statusUsuario = "Signed up";
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> reset({String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return "Reset";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
