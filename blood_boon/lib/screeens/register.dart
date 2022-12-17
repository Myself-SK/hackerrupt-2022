import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;

import 'package:blood_boon/screeens/main_screen.dart';
import 'package:blood_boon/services/firebase_services.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  bool _isSellFast = false;
  bool isMultiImage = false;
  List<String> firebaseUrlList = [];
  FirebaseService services = FirebaseService();
  String? _name;
  String? _blood;
  String? _address;
  String? _age;
  String? _phone;
  String? _count;
  String? _weight;
  int payPrice = 1;
  int plan = 0;
  String? countryValue;
  String? stateValue;
  String? cityValue;
  String dropdownvalue = 'A-Positive';
  String genderValue = 'Male';
  String? _gender;

  // List of items in our dropdown menu
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

  var gender = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Register Here'),
        ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(fontSize: 16),
                      contentPadding: EdgeInsets.only(left: 10, right: 10),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38),
                      ),
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38),
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Name';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _name = value?.trim();
                  },
                ),
                const SizedBox(height: 10),
                DropdownButton(
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
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      print(newValue);
                      dropdownvalue = newValue!;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                DropdownButton(
                  // Initial Value
                  value: genderValue,
                  isExpanded: true,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: gender.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      print(newValue);
                      genderValue = newValue!;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Address',
                    labelStyle: TextStyle(fontSize: 16),
                    contentPadding: EdgeInsets.only(left: 10, right: 10),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Address';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _address = value?.trim();
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Age',
                    labelStyle: TextStyle(fontSize: 16),
                    contentPadding: EdgeInsets.only(left: 10, right: 10),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Age';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _age = value?.trim();
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Weight',
                    labelStyle: TextStyle(fontSize: 16),
                    contentPadding: EdgeInsets.only(left: 10, right: 10),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Weight';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _weight = value?.trim();
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Phone',
                    labelStyle: TextStyle(fontSize: 16),
                    contentPadding: EdgeInsets.only(left: 10, right: 10),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Phone';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _phone = value?.trim();
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Total Donation Count',
                    labelStyle: TextStyle(fontSize: 16),
                    contentPadding: EdgeInsets.only(left: 10, right: 10),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Count';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _count = value?.trim();
                  },
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFFFF6633)),
                      ),
                      child: const Text('Register'),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Saving...')),
                          );
                          _formKey.currentState?.save();

                          Map<String, dynamic> item = {
                            'Donor Name': [_name],
                            'Address/City': [_address],
                            'Age/G': ['$_age/${genderValue[0]}'],
                            'Wt.': [_weight],
                            'BLOOD GROUP': [dropdownvalue],
                            'Mobile': [_phone],
                            'count': [_count],
                            'S No': '',
                            'Donor No': '',
                            'Date of Bleeding': '',
                            'Wt.': '',
                            'Hb%': '',
                            'BP': '',
                            'Donor Type': '',
                            'Recepients IP': '',
                            'Remarks': '',
                            'Last	Count': '',
                            'Screening Status': ''
                          };
                          final headers = {'Content-Type': 'application/json'};
                          print(item);
                          final response = await http.post(
                              Uri.parse('http://10.60.218.111:5000/register'),
                              headers: headers,
                              body: json.encode(item));
                          Map<String, dynamic> responsePayload =
                              json.decode(response.body);
                          print(responsePayload);
                        }

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('User Registered Successfully...')),
                        );
                        Navigator.pushReplacementNamed(context, MainScreen.id);
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
