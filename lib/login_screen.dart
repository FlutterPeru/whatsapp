import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:whatsapp/main.dart';

class LoginScreen extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  _login(BuildContext context) async {
    GoogleSignInAccount gUser = await _googleSignIn.signIn();
    print(gUser);
    GoogleSignInAuthentication auth = await gUser.authentication;
    FirebaseUser fUser = await _auth.signInWithGoogle(
      idToken: auth.idToken,
      accessToken: auth.accessToken,
    );
    if (fUser != null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MaterialApp(home: MyHomePage(user:fUser))));
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: RaisedButton(
        onPressed: () => _login(context),
      )),
    );
  }
}
