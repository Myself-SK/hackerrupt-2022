import 'package:blood_boon/screeens/main_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhoneAuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(context, Map<String, dynamic> uid) async {
    print(uid);
    final QuerySnapshot result = await users.where('uid', isEqualTo: uid).get();

    List<DocumentSnapshot> document = result.docs;

    if (document.isNotEmpty) {
      Navigator.pushReplacementNamed(context, MainScreen.id);
    } else {
      // print(user);
      print(uid);
      // print(user?.phoneNumber);

      return users.doc(uid['uid']).set(uid).then((value) {
        Navigator.pushReplacementNamed(context, MainScreen.id);
      }).catchError((error) => print("Failed to add user: $error"));
    }
  }
}
