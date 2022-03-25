import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Signin extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  var _isLoading = false;

  bool get getIsLoading {
    return _isLoading;
  }

  Future signIn() async {
    _isLoading = true;

    try {
      final user = await googleSignIn.signIn();

      if (user == null) {
        _isLoading = false;
        return;
      } else {
        final googleAuth = await user.authentication;

        final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await FirebaseAuth.instance.signInWithCredential(credentials);

        _isLoading = false;
      }
    } catch (e) {
      print(e);
    }
  }

  void logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
