
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sw_api/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  bool _isLoggedIn = false;
   GoogleSignInAccount _userObj;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Google Login'),
      //   centerTitle: true,
      // ),
      body: Container(
        child: _isLoggedIn
            ? MyHomePage()
            : Center(
              child: FloatingActionButton.extended(
                onPressed: () {
                  _googleSignIn.signIn().then((userData){
                    setState(() {
                      _isLoggedIn = true;
                      _userObj = userData;
                    });
                  }
                  );
                },
                label: const Text('Sign in with Google'),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                icon: Image.asset('assets/images/google_logo.png',height: 32,width: 32,),
              ),
            )
      )
    );
  }
}
