// ignore_for_file: use_build_context_synchronously

//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

 /* String GetUserEmail(){
    String EEmail='anonymous';
    EEmail =FirebaseAuth.instance.currentUser!.email!;
    if (EEmail == Null)
      EEmail= "anonymous";

    return EEmail;
  }*/

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
         /* Align(
            alignment: Alignment.centerLeft, // Align content to the right
            child: UserAccountsDrawerHeader(
              accountName: const Text(''),
              accountEmail: Text(GetUserEmail()),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 50, // Adjust the radius to change the size
                child: Icon(
                  Icons.person,
                  color: Colors.black, // Change icon color to black
                  size: 40, // Adjust the icon size
                ),
              ),
            ),
          ),*/
          SizedBox(
            height: 150,
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.black), // Change icon color to black
            title: const Text('Settings'),
            onTap: () {
              // Handle settings page navigation
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.report, color: Colors.black), // Change icon color to black
            title: const Text('Report'),
            onTap: () {
              // Handle report page navigation
              Navigator.pop(context); // Close the drawer
            },
          ),

          ListTile(
            leading: const Icon(Icons.logout, color: Colors.black), // Change icon color to black
            title: const Text('Login with different account'),
            onTap: () async {
              // Handle logout
              //await FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, '/login'); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.black), // Change icon color to black
            title: const Text('Logout'),
            onTap: () async {
              // Handle logout
             // await FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, '/welcome'); // Close the drawer
            },
          ),
         /* ListTile(
            leading: const Icon(Icons.remove_circle_outline, color: Colors.black), // Change icon color to black
            title: const Text('Delete Account'),
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
              Navigator.pop(context); // Close the drawer
              Navigator.pushNamed(context, '/login'); // Navigate to the login page
            },
          ),*/
        ],
      ),
    );
  }
}