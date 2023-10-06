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
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

void main() {
  runApp(SidebarApp());

}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  final List<String> items = [
    'Yes',
    'Yup',
    'May be yes',
    'Yup',
  ];
  String? selectedValue;

  final List<String> drop = [
    'Yes',
    'Yup',
    'May be yes',
  ];
  String? dropValue;
  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      drawer: Sidebar(),
      body: SingleChildScrollView(
        child: Container(
          height: 1500,
          width: 900,
          child: Stack(
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
                top: 40,
                right: 20,
                  child: Container(
                    height: 85,
                    width: 85,
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
                    left: 90,
                    child: Container(
                      child: Text(
                        "VIGILANCE",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                )
                ),

              Positioned(
                top: 135,
                left: 5,
                right: 0,
                child: Container(
                  height: 250,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Open link for the first image
                          launch('https://www.nationalgeographic.com/travel/article/should-women-travel-solo-india-tips');
                        },
                        child: Container(
                          width: 330,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                          margin: EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset('assets/images/NYC subway.jpeg', fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Open link for the first image
                          launch('https://seniority.in/blog/post/womens-safety-self-defense-tips-and-why-is-it-important');
                        },
                        child: Container(
                          width: 330,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                          margin: EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset('assets/images/sd1.jpg', fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Open link for the first image
                          launch('https://www.realsimple.com/health/preventative-health/safety/4-essential-self-defense-moves-everyone-should-know');
                        },
                        child: Container(
                          width: 330,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2.0),
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                          margin: EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),

                            child: Image.asset('assets/images/Top 10 Health Benefits of Martial Arts.jpeg', fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  top:430,
                  left: 20,
                  right: 20,
                  child:DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: const Row(
                        children: [
                          Icon(
                            Icons.list,
                            size: 16,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Harsh Pedo??',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: items
                          .map((String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          //selectedValue = value;
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 50,
                        width: 300,
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: const Color(0xff37949d),
                        ),
                        elevation: 2,
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_downward_outlined,
                        ),
                        iconSize: 20,
                        iconEnabledColor: Colors.white,
                        iconDisabledColor: Colors.grey,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 200,
                        width: 320,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                           color: Color(0xff7eabb6),
                        ),
                        //offset: const Offset(-20, 0),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(40),
                          thickness: MaterialStateProperty.all(6),
                          thumbVisibility: MaterialStateProperty.all(true),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                        padding: EdgeInsets.only(left: 14, right: 14),
                      ),
                    ),
                  ), ),

              Positioned(
                top:500,
                left: 20,
                right: 20,
                child:DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: const Row(
                      children: [
                        Icon(
                          Icons.list,
                          size: 16,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            'Varun Gay??',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    items: drop
                        .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                        .toList(),
                    value: dropValue,
                    onChanged: (value) {
                      setState(() {
                        //dropValue = value;
                      });
                    },
                    buttonStyleData: ButtonStyleData(
                      height: 50,
                      width: 300,
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        // border: Border.all(
                        //   color: Colors.black26,
                        // ),
                        color: const Color(0xff37949d),
                      ),
                      elevation: 2,
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_downward_outlined,
                      ),
                      iconSize: 20,
                      iconEnabledColor: Colors.white,
                      iconDisabledColor: Colors.grey,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 200,
                      width: 320,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Color(0xff7eabb6),
                      ),
                      //offset: const Offset(-20, 0),
                      scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(40),
                        thickness: MaterialStateProperty.all(6),
                        thumbVisibility: MaterialStateProperty.all(true),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                      padding: EdgeInsets.only(left: 14, right: 14),
                    ),
                  ),
                ), ),
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
        ),
      ),
    );
  }
}

