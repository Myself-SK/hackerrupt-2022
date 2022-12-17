import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'dart:core';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic> data = <String, dynamic>{};

  Future<void> get getTodos async {
      http.Response response;
      try {
        response = await http.get(Uri.parse('http://10.60.218.111:5000/'));
        setState(() {
          data = json.decode(response.body);
        });
        print(data);
      } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTodos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(
          child: Text('Blood Boon'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              width: 200,
            ),
          ),
          Text(
            'ರಕ್ತ ದಾನ ಮಹಾದಾನ',
            style: TextStyle(
              fontSize: 20,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Total Donars Count',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          Text(
            ' ${data['data']['total']}',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          Text(
            'A Positive ${data['data']['A-POSITIVE']}',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            'A Negative ${data['data']['A-NEGATIVE']}',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            'B Positive ${data['data']['B-POSITIVE']}',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            'B Negative ${data['data']['B-NEGATIVE']}',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            'AB Positive ${data['data']['AB-POSITIVE']}',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            'AB Negative ${data['data']['AB-NEGATIVE']}',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            'O Positive ${data['data']['O-POSITIVE']}',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            'O Negative ${data['data']['O-NEGATIVE']}',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
