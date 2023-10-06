// ignore_for_file: use_build_context_synchronously

import 'package:basic/ProfilePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'ProfilePageForm.dart';
import 'signup_screen.dart';
import 'ProfilePage.dart';

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
              alignment: Alignment.center,
              child: UserAccountsDrawerHeader(
                accountName: const Text(''),
                accountEmail: Text("email"),
                currentAccountPicture: InkWell(
                  onTap: () {
                    print("ProfilePage");
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                    child: Icon(
                      Icons.person,
                      color: Colors.black,
                      size: 50,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30.0),
                  ),
                  color: Color(0xFF606C38),
                ),
              ),
            ),

            SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.settings, color: Color(0xFF383330)), // Change icon color to black
              title: const Text('Profile Form',
                style: TextStyle(
                    color: Color(0xFF606C38),
                    fontSize: 18
                ),),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProfilePageForm(),
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.settings, color: Color(0xFF383330)), // Change icon color to black
              title: const Text('Signup',
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
              leading: const Icon(Icons.logout, color: Color(0xFF383330)), // Change icon color to black
              title: const Text('Logout',
                style: TextStyle(
                    color: Color(0xFF606C38),
                    fontSize: 18
                ),),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                 // Close the drawer
              },
            ),
            SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.remove_circle_outline, color: Color(0xFF383330)), // Change icon color to black
              title: const Text('Delete Account',
                style: TextStyle(
                    color: Color(0xFF606C38),
                    fontSize: 18
                ),),
              onTap: () async {
                try {
                  await FirebaseAuth.instance.currentUser!.delete();
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'requires-recent-login') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('You must reauthenticate before this operation can be executed.'),
                      ),
                    );
                    print('The user must reauthenticate before this operation can be executed.');
                  }
                }

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