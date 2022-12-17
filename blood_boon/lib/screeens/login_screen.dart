import 'package:flutter/material.dart';

import '../widgets/auth_ui.dart';

final Uri _url = Uri.parse('https://bechdo-9e4ae.web.app/terms-and-conditions');

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String id = "login-screen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool selected = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/logo.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.lightBlue.shade50,
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: const AuthUi(),
              ),
            ),
            // Column(
            //   children: [
            //     GestureDetector(
            //       onTap: () {
            //         print('Tapped');
            //         setState(() {
            //           selected = !selected;
            //         });
            //       },
            //       child: Container(
            //         width: double.infinity,
            //         child: AnimatedAlign(
            //           alignment:
            //               selected ? Alignment.topRight : Alignment.topLeft,
            //           duration: const Duration(seconds: 1),
            //           curve: Curves.fastOutSlowIn,
            //           child: Image.asset(
            //             'assets/images/bike_2.png',
            //             width: 100,
            //           ),
            //         ),
            //       ),
            //     ),
            //     GestureDetector(
            //       onTap: () {
            //         print('Tapped');
            //         setState(() {
            //           selected = !selected;
            //         });
            //       },
            //       child: Container(
            //         width: double.infinity,
            //         child: AnimatedAlign(
            //           alignment: selected
            //               ? Alignment.centerLeft
            //               : Alignment.centerRight,
            //           duration: const Duration(seconds: 1),
            //           curve: Curves.fastOutSlowIn,
            //           child: Image.asset(
            //             'assets/images/Car_02.png',
            //             width: 100,
            //           ),
            //         ),
            //       ),
            //     ),
            //     GestureDetector(
            //       onTap: () {
            //         print('Tapped');
            //         setState(() {
            //           selected = !selected;
            //         });
            //       },
            //       child: Container(
            //         width: double.infinity,
            //         child: AnimatedAlign(
            //           alignment: selected
            //               ? Alignment.centerRight
            //               : Alignment.centerLeft,
            //           duration: const Duration(seconds: 1),
            //           curve: Curves.fastOutSlowIn,
            //           child: Image.asset(
            //             'assets/images/comm_02.png',
            //             width: 100,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),

            // Expanded(
            //   child: Container(
            //     width: MediaQuery.of(context).size.width,
            //     color: Colors.white,
            //     child: Center(
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           FittedBox(
            //             fit: BoxFit.cover,
            //             child: Image.asset(
            //               'assets/images/BechdoLoginPage.jpg',
            //               height: 380,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // const TextButton(
            //     onPressed: _launchUrl,
            //     child: Text(
            //       'If you continue, you are Accepting\nBechdo Terms and Conditions and Privacy Policy',
            //       style: TextStyle(
            //         color: Colors.black,
            //         decoration: TextDecoration.underline,
            //         fontSize: 12,
            //       ),
            //       textAlign: TextAlign.center,
            //     )),
          ],
        ),
      ),
    );
  }
}
