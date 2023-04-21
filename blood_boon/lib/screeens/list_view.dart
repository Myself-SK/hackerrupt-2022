import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});
  static const String id = "list-View";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Center(
                      child: Text(
                        'Mr.RAMESHA',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFF495B63)),
                      ),
                      onPressed: () {
                        launchUrl(Uri.parse('tel:918722594101'));
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: const [
                            Icon(Icons.call),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Call',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Center(
                  child: Text(
                    "#26 HOOTAGALLI KHB COLONY ,MYSURU",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Center(
                      child: Text(
                        'Mr.APPU',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFF495B63)),
                      ),
                      onPressed: () {
                        launchUrl(Uri.parse('tel:918884268561'));
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: const [
                            Icon(Icons.call),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Call',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Center(
                  child: Text(
                    "#26 HOOTAGALLI KHB COLONY ,MYSURU",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Center(
                      child: Text(
                        'Mr.Bv abhishek sundara raman',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFF495B63)),
                      ),
                      onPressed: () {
                        launchUrl(Uri.parse('tel:91973836090'));
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: const [
                            Icon(Icons.call),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Call',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Center(
                  child: Text(
                    "JSS MEDICAL COLLEGE MENS HOSTEL BANNIMANTAP ,MYSURU",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Center(
                      child: Text(
                        'Mr.SANTHOSH KV',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFF495B63)),
                      ),
                      onPressed: () {
                        launchUrl(Uri.parse('tel:918147832741'));
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: const [
                            Icon(Icons.call),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Call',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Center(
                  child: Text(
                    "#1728 SRI RAM PURA 2ND STAGE ,MYSURU",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
