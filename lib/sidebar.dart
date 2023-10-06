// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'signup_screen.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});



  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFFD4BDA1),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.center, // Align content to the right
              child: UserAccountsDrawerHeader(
                accountName: const Text(''),
                accountEmail: Text("email"),
                currentAccountPicture: const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50, // Adjust the radius to change the size
                  child: Icon(
                    Icons.person,
                    color: Colors.black, // Change icon color to black
                    size: 40, // Adjust the icon size
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    // topRight: Radius.circular(20.0),
                    bottomRight: Radius.circular(30.0),
                  ),
                  color: Color(0xFF864622), // Set your desired background color here
                ),
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.settings, color: Color(0xFF383330)), // Change icon color to black
              title: const Text('Settings',
                style: TextStyle(
                    color: Color(0xFF606C38),
                    fontSize: 18
                ),),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SignupScreen(),
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.report, color: Color(0xFF383330)), // Change icon color to black
              title: const Text('Report',
                style: TextStyle(
                    color: Color(0xFF864622),
                    fontSize: 18
                ),),
              onTap: () {
              },
            ),
            SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.logout, color: Color(0xFF383330)), // Change icon color to black
              title: const Text('Login with different account',
                style: TextStyle(
                    color: Color(0xFF606C38),
                    fontSize: 16
                ),),
              onTap: ()  {
                SignupScreen();

              },
            ),
            SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.logout, color: Color(0xFF383330)), // Change icon color to black
              title: const Text('Logout',
                style: TextStyle(
                    color: Color(0xFF864622),
                    fontSize: 18
                ),),
              onTap: () {
                 // Close the drawer
              },
            ),
            SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.remove_circle_outline, color: Color(0xFF383330)), // Change icon color to black
              title: const Text('Delete Account',
                style: TextStyle(
                    color: Color(0xFF455947),
                    fontSize: 18
                ),),
              onTap: () {
                // try {
                //   await FirebaseAuth.instance.currentUser!.delete();
                // } on FirebaseAuthException catch (e) {
                //   if (e.code == 'requires-recent-login') {
                //     ScaffoldMessenger.of(context).showSnackBar(
                //       const SnackBar(
                //         content: Text('You must reauthenticate before this operation can be executed.'),
                //       ),
                //     );
                //     print('The user must reauthenticate before this operation can be executed.');
                //   }
                // }
                // Navigator.pop(context); // Close the drawer
                // Navigator.pushNamed(context, '/login'); // Navigate to the login page
              },
            ),
          ],
        ),
      ),
    );
  }
}