// ignore_for_file: use_build_context_synchronously

// import 'package:bechdo/services/phoneauth_service.dart';
import 'package:blood_boon/screeens/authentication/google_auth.dart';
import 'package:blood_boon/services/phoneauth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

// import '../screens/authentication/email_auth_screen.dart';
// import '../screens/authentication/phoneauth_screen.dart';

class AuthUi extends StatelessWidget {
  const AuthUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 200,
            ),
            Text(
              'Blood Boon',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),

        SizedBox(
          width: 260,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            onPressed: () async {
              User? user =
                  await GoogleAuthentication.signinWithGoogle(context: context);
              PhoneAuthService authentication = PhoneAuthService();
              print("user ${user?.uid} $user");

              authentication.addUser(context, {
                'userID': 'UID${DateTime.now().millisecondsSinceEpoch}',
                'uid': user?.uid, // User ID
                'mobile': user?.phoneNumber, //
                'email': user?.email,
                'address': 'India',
                'createdDate': DateTime.now() // 42
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 3,
                ),
                Image.network(
                  "https://developers.google.com/static/identity/images/g-logo.png",
                  height: 25,
                  width: 25,
                ),
                SizedBox(
                  width: 10,
                ),
                const Text(
                  'Login with Google',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        // ignore: prefer_const_constructors
      ],
    );
  }
}
