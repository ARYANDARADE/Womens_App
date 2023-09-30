import 'package:basic/NavBar.dart';
import 'package:flutter/material.dart';
import 'Cart.dart';
import 'History.dart';
import 'Location.dart';
import 'sidebar.dart';
import 'Welcome.dart';
import 'Login.dart';
import 'Signup.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}
class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      drawer: Sidebar(),
      body: Stack(
        children: [
          Positioned(
            top: 39.0,
            left: 12.0,
            child: Builder(
              builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu_outlined, size: screenWidth * 0.11),
              ),
            ),
          ),
          Positioned(
            top: 45.0,
            left: screenWidth * 0.29,
            child: Text(
              "Template",
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: screenWidth * 0.10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),


          /*Positioned(
            top: 80.0, // Adjust the position as needed
            left: screenWidth * 0.65, // Adjust the position as needed
            child: Text(
              "Agent",
              style: TextStyle(
                color: Colors.red,
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}
