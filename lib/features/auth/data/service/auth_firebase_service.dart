import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthFirebaseService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future logout() async {
    await GoogleSignIn().signOut();
    return _auth.signOut();
  }

  Stream<User?> observeAuthState() {
    return _auth.authStateChanges();
  }

  Stream<User?> observeUserChanges() {
    return _auth.userChanges();
  }
}