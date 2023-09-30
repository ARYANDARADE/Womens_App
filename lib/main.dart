import 'package:basic/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'NavBar.dart';
import 'sidebar.dart';
import 'Welcome.dart';
import 'Login.dart';
import 'Signup.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: '/Welcome', // Set the initial route
      // routes: {
      //   '/Welcome': (context) =>
      //       WelcomeScreen(), // Welcome screen as the initial route
      //   '/Login': (context) => LoginPage(), // Define your login page
      //   '/Signup': (context) => SignupScreen(), // Define your signup page
      // },
    );
  }
}

void main() {
  runApp(SidebarApp());
}

class SidebarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: '/Welcome', // Set the initial route
      // routes: {
      //   '/Welcome': (context) =>
      //       WelcomeScreen(), // Welcome screen as the initial route
      //   '/Login': (context) => LoginPage(), // Define your login page
      //   '/Signup': (context) => SignupScreen(), // Define your signup page
      // },
      debugShowCheckedModeBanner: false,
      home:
        onBoarding(),


    );
  }
}
