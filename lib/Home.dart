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
import 'package:horizontal_list_view/horizontal_list_view.dart';
import 'package:url_launcher/url_launcher.dart';

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
            top: 50.0,
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
            top: 35,
            left: 280,
              child: Container(
                height: 100,
                width: 105,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                  ),
                  shape: BoxShape.circle,
                ),
              ),
          ),
            Positioned(
                top: 60,
                left: 100,
                child: Container(
                  child: Text(
                    "VIGILANCE",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
            )
            ),

          Positioned(
            top: 145,
            left: 0,
            right: 0,
            child: Container(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Open link for the first image
                      launch('https://youtu.be/SojbIFftzuY?si=nojkFttAj29oyyMF');
                    },
                    child: Container(
                      width: 360,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      margin: EdgeInsets.all(8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset('assets/images/night saftey.jpg', fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Open link for the first image
                      launch('https://youtube.com/shorts/M21oKzmbDkU?si=gtKIuB5Bk_6_wd9q');
                    },
                    child: Container(
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      margin: EdgeInsets.all(8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset('assets/images/selfdefence.jpg', fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Open link for the first image
                      launch('https://youtu.be/x91tRBU_H9Q?si=_-7Eysra4ecTU_aT');
                    },
                    child: Container(
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      margin: EdgeInsets.all(8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset('assets/images/10d05a07e7a2d93351a1e18a6b65e756.jpg', fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ],
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

