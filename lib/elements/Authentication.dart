import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_core/firebase_core.dart";
import 'package:firebase_database/firebase_database.dart';
import "package:google_sign_in/google_sign_in.dart";
import "../screens/login.dart";




class Authentification {
  static FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static Future singInWithGoogle() async {

    final googleSignin = GoogleSignIn();
    final googleUser = await googleSignin.signIn();
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      if (googleAuth.idToken != null) {
        final userCredential = await _firebaseAuth.signInWithCredential(GoogleAuthProvider.credential(idToken: googleAuth.idToken, accessToken: googleAuth.idToken));
        return userCredential.user;
      };
      
    } else {
      throw FirebaseAuthException(message: "Signin aboarded by the user", code: "ERROR_ABORDED_BY_USER");
    }

  }
}


class Database {
  static final _firebaseDatabase = FirebaseDatabase.instance.ref();

  static Future<void> login({email, password}) async {
    
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('Users').get();
    
    
  }

  static Future<void> signup({username, email, password}) async {
    
    

    

    

  }
}