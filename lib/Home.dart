import 'package:basic/CustomCarouel.dart';
import 'package:basic/NavBar.dart';
import 'package:basic/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'Chat.dart';
import 'Report.dart';
import 'Location.dart';
import 'quotes.dart';
import 'sidebar.dart';
import 'Marykom.dart';
import 'self defence.dart';
import 'WomenSafety.dart';

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
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(left: 45),
              child: Row(
                children: [

                  Container(
                    height: 195,
                    width: 105,
                    decoration: BoxDecoration(
                        image :DecorationImage(image:AssetImage("assets/images/logo.png")),shape: BoxShape.circle),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7,bottom: 50),
                    child: Text("VIGILANCE",style: TextStyle(fontSize: 32
                      ,fontWeight: FontWeight.w700,),),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      height: 300,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                              child: Marykom()
                          ),
                          Container(
                              child: selfDefence()
                          ),
                          Container(
                              child: Womensafety(),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Container(
              //   height: 100,
              //   child: ListView(
              //     scrollDirection: Axis.horizontal,
              //     children: [
              //       Container(
              //         child: HospitalCard() ,
              //       ),
              //       Container(
              //         child: BusStationCard(),
              //       ),
              //       Container(
              //         child: PharmacyCard(),
              //       ),
              //       Container(
              //         child: PoliceStationCard(),
              //       ),
              //     ],
              //   ),
              // ),
            ],

          ),
      Column(
        children: [
          Center(child: Container(
              height: 100,
              child: Carousel())
          ),

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

