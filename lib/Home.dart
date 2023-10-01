import 'package:basic/NavBar.dart';
import 'package:basic/SafeHome.dart';
import 'package:basic/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'Chat.dart';
import 'Report.dart';
import 'Location.dart';
import 'quotes.dart';
import 'sidebar.dart';
import 'package:flutter_sms/flutter_sms.dart';

import 'Signup.dart';

void main() {
  runApp(SidebarApp());

}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    List<String> sweetSayings = [
      "Your presence, lights up the whole room",
      "We admire,Your strong personality.",
      "We’ll help you In any way we can,",
      "You are Strong and courageous",
      'I say if I’m beautiful. I say if I’m strong',
      'Above all, be the heroine of your life, not the victim',
    ];

    List<String> articleTitle = [
      "We have to end Violance",
      "Be a change",
      "You are strong"
    ];
    List<String> imageSliders = [
      "https://media.istockphoto.com/photos/silhouette-of-super-strong-successful-businesswoman-picture-id1249879109?k=20&m=1249879109&s=612x612&w=0&h=I-joEMjqkq1wCJZJeLWUCd1d2HcB5WxBShdkA9YM0cg=",
      "https://media.istockphoto.com/vectors/young-woman-looks-at-the-mirror-and-sees-her-happy-reflection-vector-id1278815846?k=20&m=1278815846&s=612x612&w=0&h=JUTmV9Of-_ILOfXBfV9Cmp_41yuTliSdFIcZy5LKuss=",
      "https://media.istockphoto.com/vectors/mental-health-or-psychology-concept-with-flowering-human-head-vector-id1268669581?k=20&m=1268669581&s=612x612&w=0&h=YVLTKCZXKugEn40aqOkir4vcoFeTUAQToa1i3AFYRNU=",
      "https://media.istockphoto.com/photos/confidence-and-strength-concept-picture-id1086700012?k=20&m=1086700012&s=612x612&w=0&h=1wWVN3AB7BH7o3y2A2b-NG3HB9H6Dwkc9OLz2lxgwAY=",
    ];


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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/images/logo.png"),
                Text(
                  "Vigilance",
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: screenWidth * 0.10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
      Column(
        children: [
          Center(child: SafeHome(),),

        ],
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

