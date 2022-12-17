import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geocoder_buddy/geocoder_buddy.dart';
import 'package:intl/intl.dart';

class FirebaseService {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference categories =
      FirebaseFirestore.instance.collection('categories');
  CollectionReference postAdd =
      FirebaseFirestore.instance.collection('postAdd');

  User? user = FirebaseAuth.instance.currentUser;

  getImageUrl({required String directory}) {
    var date = DateTime.now();
    var formatter = DateFormat('yyyyMMddHHmmSS');
    String formattedDate = formatter.format(date);
    return "${directory}_${formattedDate}_${user?.uid ?? ''}.jpg";
  }

  Future<String> uploadFile(
      String? path, String? fileName, String? directory) async {
    final file = File(path ?? '');
    final storageRef = FirebaseStorage.instance.ref();
    await storageRef.child('$directory/$fileName').putFile(file);
    final uploadTask = storageRef.child('$directory/$fileName');
    final downloadUrl = await uploadTask.getDownloadURL();
    return downloadUrl;
  }

  downloadImage(String fileName) async {
    final storageRef = FirebaseStorage.instance.ref();
    final imageUrl = (await storageRef
            .child('postAds')
            .child('postAdd_202211102126185_RVVyWyvTCBSjCdC2JU0tp6NSVMp2.jpg')
            .getDownloadURL())
        .toString();
    print(imageUrl);
    return imageUrl;
  }

  // ignore: non_constant_identifier_names
  Future<void> UpdateUser(Map<String, dynamic> data, context) {
    print("Data $data");
    print(user?.uid);
    return users.doc(user?.uid).update(data).then(
      (value) {
        print("Updated");
        // Navigator.pushReplacementNamed(context, MainScreen.id);
      },
    ).catchError((error) {
      print('Error $error');
      const SnackBar(
        content: Text('Failed to Update Location'),
      );
    });
  }

  Future<void> addPost(Map<String, dynamic> data, context) async {
    // print(postAdd.doc().toString());
  }

  Future<String> getAddress(lat, lng) async {
    // print('lat $lat lng $lng');
    var position = GBLatLng(lat: lat, lng: lng);
    GBData data = await GeocoderBuddy.findDetails(position);
    print(data);
    return (data.displayName);
  }
}
