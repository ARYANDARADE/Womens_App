import 'sidebar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:floating_navigation_bar/floating_navigation_bar.dart';
//import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'Cart.dart';
import 'Home.dart';
import 'History.dart';
import 'Location.dart';
import 'package:icons_plus/icons_plus.dart';
class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedpage = 0;
  final _pageOptions = [ HomePage(), CartPage(), HistoryPage(),LocationPage()];
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      body: /*_pageOptions[selectedpage],
      bottomNavigationBar: CurvedNavigationBar(
        height: screenWidth * 0.15,
        buttonBackgroundColor:const Color(0xFFA22327), // bbgcolor[selectedpage],////const Color(0xFF5BEA43),
        backgroundColor:Colors.transparent,// bgcolor[selectedpage],
        color: const Color(0xFFF19393),
        animationCurve: Curves.linearToEaseOut,
        items: <Widget>[
          Icon(
            Icons.home,
            size: screenWidth * 0.09,
            color: Colors.black,
          ),
          Icon(
            Icons.shopping_cart,
            size: screenWidth * 0.09,
            color: Colors.black,
          ),
          Icon(
            Icons.history_rounded,
            size: screenWidth * 0.09,
            color: Colors.black,
          ),
          Icon(
            Icons.location_on,
            size: screenWidth * 0.09,
            color: Colors.black,
          ),
        ],
        onTap: (index) {
          setState(() {
            selectedpage = index; // changing selected page as per bar index selected by the user
          });
        },
      ),*/
      _pageOptions[selectedpage],bottomNavigationBar: FloatingNavigationBar(
      backgroundColor: Colors.green[500],
      barHeight: 80.0,
      barWidth: MediaQuery.of(context).size.width - 40.0,
      iconColor: Colors.black,
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
      ),
      iconSize: 25.0,
      indicatorColor: Colors.white,
      indicatorHeight: 5,
      indicatorWidth: 25.0,
      items: [
        NavBarItems(
          // icon: EvaIcons.homeOutline,
          icon: Icons.home_filled,
          title: "home",
        ),
        NavBarItems(
          icon: Icons.shopping_cart,
          title: "cart",
        ),
        NavBarItems(
          icon: Icons.history_rounded,
          title: "history",
        ),
        NavBarItems(
          icon: Icons.my_location,
          title: "location",
        ),
      ]
      ,
        onChanged: (value) {
          selectedpage = value;
          setState(() {});
        },
      ),
      // Add the Sidebar her
    );
  }
}