import 'dart:convert';
import 'dart:core';

import 'package:blood_boon/screeens/account.dart';
import 'package:blood_boon/screeens/home_screen.dart';
import 'package:blood_boon/screeens/register.dart';
import 'package:blood_boon/screeens/request.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const String id = 'Main-Screen';
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Map<String, dynamic> data = <String, dynamic>{};
  Widget currentScreen = const HomeScreen();
  final screens = [
    const HomeScreen(),
    const Register(),
    const Request(),
    const AccountScreen(),
  ];
  int currentIndex = 0;
  final int _index = 0;
  final PageStorageBucket _bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageStorage(
          bucket: _bucket,
          child: screens[currentIndex],
        ),
        bottomNavigationBar: ConvexAppBar(
          onTap: (index) => setState(() {
            currentIndex = index;
          }),
          // currentIndex: currentIndex,
          // type: BottomNavigationBarType.fixed,
          // selectedItemColor: Color(0xFFFF6633),
          // unselectedItemColor: Color(0xFF495B63),
          // showUnselectedLabels: true,
          // backgroundColor: Color(0x00000000),
          style: TabStyle.reactCircle,
          activeColor: Colors.red,
          height: 55,
          color: Colors.black,
          backgroundColor: Colors.white,
          items: const [
            TabItem(
              isIconBlend: true,
              title: "Home",
              icon: Icon(
                Icons.home,
              ),
            ),
            TabItem(
              isIconBlend: true,
              title: "Register",
              icon: Icon(
                Icons.app_registration,
              ),
            ),
            TabItem(
              isIconBlend: true,
              title: "Request",
              icon: Icon(
                Icons.bloodtype_outlined,
              ),
            ),
            TabItem(
              title: "Profile",
              isIconBlend: true,
              icon: Icon(
                Icons.account_circle_sharp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
