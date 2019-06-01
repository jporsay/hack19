import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hack19/src/user/user_model.dart';

class AuthenticationRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Stream<bool> isLoggedIn() {
    return _auth.onAuthStateChanged
        .map((user) => user != null && !user.isAnonymous);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Stream<User> loggedUser() {
    return _auth.onAuthStateChanged.map((firebaseUser) {
      if (firebaseUser != null && firebaseUser.isAnonymous) {
        return AnonymousUser();
      }
      return LoggedInUser.fromFirebaseUser(firebaseUser);
    });
  }

  Future<bool> googleSignIn() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return false;
      }
      final auth = await googleUser.authentication;
      final credentials = GoogleAuthProvider.getCredential(
        accessToken: auth.accessToken,
        idToken: auth.idToken,
      );
      await _auth.signInWithCredential(credentials);
      return true;
    } catch (e) {
      return false;
    }
  }
}
