import 'package:blood_boon/screeens/login_screen.dart';
import 'package:blood_boon/services/firebase_services.dart';
import 'package:blood_boon/services/firebase_services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  static const String id = 'account-screen';

  @override
  Widget build(BuildContext context) {
    FirebaseService services = FirebaseService();
    return FutureBuilder<QuerySnapshot>(
      future: services.postAdd
          .where("sellerUserId", whereIn: [services.user?.uid]).get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Container();
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF495B63),
            title: Center(
              child: Text(
                'My Profile',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Center(
                  child: CachedNetworkImage(
                    imageUrl: '',
                    placeholder: (context, url) => const CircleAvatar(
                      backgroundColor: Colors.white30,
                      radius: 50,
                    ),
                    errorWidget: (context, url, error) => Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey)),
                      child: ClipOval(
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(50),
                          // Image radius
                          child: Image.network(
                            services.user?.photoURL ??
                                'https://cdn.pixabay.com/photo/2021/07/02/04/48/user-6380868_960_720.png',
                          ),
                        ),
                      ),
                    ),
                    imageBuilder: (context, image) => CircleAvatar(
                      backgroundImage: image,
                      radius: 100,
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  services.user?.displayName ?? '',
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              Center(
                child: Text(
                  services.user?.phoneNumber ?? '',
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              Center(
                child: Text(
                  services.user?.email ?? '',
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFFFF6633)),
                    ),
                    onPressed: () {
                      FirebaseAuth.instance.signOut().then((value) {
                        Navigator.pushReplacementNamed(context, LoginScreen.id);
                      });
                    },
                    child: Row(
                      children: [
                        Icon(Icons.power_settings_new_rounded),
                        SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Logout',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
