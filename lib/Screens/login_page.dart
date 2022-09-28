// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_declarations, avoid_print, unused_local_variable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:week_2/Screens/home_page.dart';
import 'package:week_2/main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _unameController = TextEditingController();
  final _passController = TextEditingController();

  final _usname = "Jabir";
  final _ps = "2762";
  // bool dataMatch = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.network(
                      "https://media1.giphy.com/media/LAJYzPzGKOBW5z1XBL/giphy.gif",
                      height: 350),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                    controller: _unameController,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontWeight: FontWeight.normal),
                      border: OutlineInputBorder(),
                      hintText: "Enter a Username",
                    ),
                    validator: (value) {
                      if (value == null || value != _usname) {
                        return "Username Doesn't Match";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    controller: _passController,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value != _ps) {
                        return "'Password Deosn't Match";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontWeight: FontWeight.normal),
                      border: OutlineInputBorder(),
                      hintText: "Enter a Password",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Forgot Password ?",
                        style: TextStyle(color: Colors.white),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            loginCheck(context);
                          } else {
                            print("Data Empty");
                          }
                        },
                        icon: Icon(Icons.check),
                        label: Text("Login"),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.orange.shade500,
    );
  }

  void loginCheck(BuildContext context) async {
    final _username = _unameController.text;
    final _password = _passController.text;
    final _errorMesage = "Username and Password Doesn't Match";

    if (_username == _usname && _ps == _password) {
      final _sharedPreference = await SharedPreferences.getInstance();
      await _sharedPreference.setBool(saveKeyName, true);

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) {
          return HomeScreen();
        }),
      );
    } else {}
  }
}
