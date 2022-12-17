import 'dart:convert';

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
        title: Center(
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
              Text(
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
                padding: EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  child: Text('Request'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFFFF6633)),
                  ),
                  onPressed: () async {
                    print(dropdownvalue);
                    http.Response response;
                    try {
                      print(
                          'http://10.60.218.111:5000/${dropdownvalue.toUpperCase()}');
                      response = await http.get(Uri.parse(
                          'http://10.60.218.111:5000/${dropdownvalue.toUpperCase()}'));
                      setState(() {
                        data = json.decode(response.body);
                      });

                      print(data);
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
              ),
              Text(data['data'].toString())
              // ListView.builder(
              //   itemCount: data.length,
              //   itemBuilder: (BuildContext context, int index) {
              //     return Container(
              //       height: 85,
              //       margin: const EdgeInsets.all(2),
              //       color: const Color.fromARGB(216, 252, 2, 98),
              //       child: Center(
              //           child: Text(
              //         '${data[index]["Donor Name"]}',
              //         style: const TextStyle(fontSize: 24, color: Colors.white),
              //       )),
              //     );
              //   },
              // )

              // Text(data['data'].toString())
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 16.0),
              //   child: ElevatedButton(
              // style: ButtonStyle(
              //   backgroundColor:
              //       MaterialStateProperty.all(Color(0xFFFF6633)),
              // ),
              //       child: const Text('Register'),
              //       onPressed: () {
              //         if (_formKey.currentState!.validate()) {
              //           ScaffoldMessenger.of(context).showSnackBar(
              //             const SnackBar(content: Text('Saving...')),
              //           );
              //           _formKey.currentState?.save();
              //         }
              //       },

              //     ),                      //   final response = await http.get(
              //       Uri.parse('http://10.60.218.111:5000/register');
              // }

              // ScaffoldMessenger.of(context).showSnackBar(
              //   const SnackBar(
              //       content: Text('User Registered Successfully...')),
              // );
              // Navigator.pushReplacementNamed(context, MainScreen.id);
              // ,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
