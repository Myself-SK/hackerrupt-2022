// ignore_for_file: use_function_type_syntax_for_parameters

import 'dart:convert';

import 'package:blood_boon/screeens/list_view.dart';
import 'package:blood_boon/screeens/main_screen.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'dart:core';
import 'package:http/http.dart' as http;

class Request extends StatefulWidget {
  const Request({super.key});

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
  String dropdownvalue = 'A-Positive';
  Map<String, dynamic> data = <String, dynamic>{};
  final _formKey = GlobalKey<FormState>();
  var items = [
    'A-Positive',
    'A-Negative',
    'B-Positive',
    'B-Negative',
    'AB-Positive',
    'AB-Negative',
    'O-Positive',
    'O-Negative',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Center(
          child: Text(
            'Send Request',
          ),
        ),
      ),
      body: SingleChildScrollView(
        key: _formKey,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 200,
              ),
              const Text(
                'ರಕ್ತ ದಾನ ಮಹಾದಾನ',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: DropdownButton(
                  // Initial Value
                  value: dropdownvalue,
                  isExpanded: true,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      print(newValue);
                      dropdownvalue = newValue!;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  child: const Text('Request'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFFFF6633)),
                  ),
                  onPressed: () async {
                    http.Response response;
                    try {
                      response = await http.get(Uri.parse(
                          'http://192.168.227.222:5000/${dropdownvalue}'));
                      setState(() {
                        data = json.decode(response.body);
                      });
                      print(data[0]);
                    } catch (e) {
                      print(e);
                    }

                    Navigator.pushReplacementNamed(context, ListViewScreen.id);
                  },
                ),
              ),

              //   child: ListView.builder(
              //     itemCount: data.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       var doc = data[index];
              //       return Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: ListTile(
              //           title: Text(
              //             doc['Donar Name'],
              //             style: const TextStyle(fontSize: 18),
              //           ),
              //           trailing: const Icon(
              //             Icons.arrow_forward_ios,
              //             size: 12,
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              // // )
            ],
          ),
        ),
      ),
    );
  }
}
