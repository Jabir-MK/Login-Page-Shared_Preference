// ignore_for_file: no_leading_underscores_for_local_identifiers, use_build_context_synchronously, unnecessary_import, implementation_imports, unused_import

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:week_2/Screens/login_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
          color: Colors.white,
        ),
        title: Text('Scheduled Events'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {
              confirmSignout(context);
            },
            icon: Icon(Icons.logout),
            color: Colors.white,
          )
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 25,
              ),
              tileColor: Colors.amber,
              horizontalTitleGap: 30,
              leading: CircleAvatar(
                maxRadius: 30,
                backgroundImage: NetworkImage(
                  "https://c.tenor.com/47lMJBrmfgUAAAAC/miss-minutes-loki.gif",
                ),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("${(index + 1) * 2} Sep 2022"),
                  Icon(Icons.alarm),
                ],
              ),
              title: Text("Event ${index + 1}"),
              subtitle: Text("Your Event ${index + 1}"),
            );
          },
          separatorBuilder: ((context, index) {
            return Divider(
              thickness: 2,
              height: 0,
              color: Colors.amber.shade900,
              indent: 20,
              endIndent: 20,
            );
          }),
          itemCount: 15,
        ),
      ),
    );
  }

  void signOut(BuildContext context) async {
    final _sharedPreference = await SharedPreferences.getInstance();
    await _sharedPreference.clear();

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
      return LoginScreen();
    }), (route) => false);
  }

  void confirmSignout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.amber.shade200,
          title: Text(
            "Log Out",
            style: TextStyle(color: Colors.orange),
          ),
          content: Text(
            "You will be Logged Out",
            style: TextStyle(color: Colors.orange),
          ),
          actions: [
            TextButton(
              onPressed: () {
                signOut(context);
              },
              child: Text(
                "Yes",
                style: TextStyle(color: Colors.orange),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "No",
                style: TextStyle(color: Colors.orange),
              ),
            )
          ],
        );
      },
    );
  }
}
