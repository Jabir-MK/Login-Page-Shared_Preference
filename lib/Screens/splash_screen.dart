// ignore_for_file: use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:week_2/Screens/home_page.dart';
import 'package:week_2/Screens/login_page.dart';
import 'package:week_2/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(
            'https://media0.giphy.com/media/gmdKBCklQ7ElxAN7oH/giphy.gif'),
      ),
      backgroundColor: Colors.orange.shade800,
    );
  }

  Future<void> goToLoginPage() async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) {
          return LoginScreen();
        },
      ),
    );
  }

  Future<void> checkLogin() async {
    final _sharedPreference = await SharedPreferences.getInstance();
    final userLoggedIn = _sharedPreference.getBool(saveKeyName);
    if (userLoggedIn == null || userLoggedIn == false) {
      goToLoginPage();
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: ((context) {
            return HomeScreen();
          }),
        ),
      );
    }
  }
}
