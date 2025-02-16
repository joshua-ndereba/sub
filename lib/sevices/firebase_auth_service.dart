import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> signinWithGoogle() async {
    try {
      final GoogleSignInAccount? googleuser = await _googleSignIn.signIn();
      if (googleuser ==null) return null;

      final GoogleSignInAuthentication googleAuth = await googleuser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      return userCredential.user;

    } catch (e) {
      print("Error signing in with google: $e");
      return null;
    }
  }

  //signout
  Future<void> signout() async{
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  Stream<User?> authStateChanges() {
    return _auth.authStateChanges();
  }
  //get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  
  Future<bool> isLoggedIn() async {

    
      User? user = _auth.currentUser;

      return user != null; // Simple check for a logged-in user

    }

}


