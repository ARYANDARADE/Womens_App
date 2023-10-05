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
            top: 49.0,
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
            top: 5,
            left: 10,
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
          Positioned(
            top: 120,
            child: SizedBox(
              height: 200, // Adjust the height as needed
              child: Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 200, // Adjust the width as needed
                          margin: EdgeInsets.only(right: 10), // Add some spacing between containers
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/708003cc0c717bfa933ca2937b6153f2.jpg'), // Add your image path
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Container 1',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 200, // Adjust the width as needed
                          margin: EdgeInsets.only(right: 10), // Add some spacing between containers
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/community.png'), // Add your image path
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Container 2',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 200, // Adjust the width as needed
                          margin: EdgeInsets.only(right: 10), // Add some spacing between containers
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/WhatsApp Image 2023-10-05 at 17.09.08_bba9d103.jpg'), // Add your image path
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Container 3',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 200, // Adjust the width as needed
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/708003cc0c717bfa933ca2937b6153f2.jpg'), // Add your image path
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Container 4',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
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

