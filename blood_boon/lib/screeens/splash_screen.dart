import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:blood_boon/screeens/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:bechdo/screens/main_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_language_fonts/google_language_fonts.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String id = 'splash-screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          Navigator.pushReplacementNamed(context, LoginScreen.id);
        } else {
          Navigator.pushReplacementNamed(context, MainScreen.id);
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const colorizeColors = [];

    const colorizeTextStyle = TextStyle(
      fontSize: 70.0,
      fontFamily: 'AvantGrade LT Medium',
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        width: 150,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextLiquidFill(
                          text: 'Blood Boon',
                          waveDuration: const Duration(milliseconds: 2000),
                          waveColor: Colors.red,
                          boxBackgroundColor: Colors.white,
                          textStyle: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                          ),
                          boxHeight: 100.0,
                        ),
                      ),
                      // Center(
                      //   child: SizedBox(
                      //     width: double.infinity,
                      //     child: DefaultTextStyle(
                      //       style: const TextStyle(
                      //         fontSize: 20,
                      //         fontWeight: FontWeight.bold,
                      //         color: Colors.black,
                      //         fontFamily: "MPLUS1p-Regular",
                      //       ),
                      //       child: AnimatedTextKit(
                      //         animatedTexts: [
                      //           FadeAnimatedText(
                      //             'Sell anything online',
                      //             textAlign: TextAlign.center,
                      //           ),
                      //         ],
                      //         onTap: () {
                      //           print("Tap Event");
                      //         },
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Text(
                        'ರಕ್ತ ದಾನ ಮಹಾದಾನ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
