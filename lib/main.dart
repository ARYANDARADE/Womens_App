import 'package:basic/onboarding.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'NavBar.dart';
import 'sidebar.dart';
import 'Login.dart';
import 'welcome.dart';
import 'Signup.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: '/Welcome', // Set the initial route
      // routes: {
      //   '/Welcome': (context) =>
      //       WelcomeScreen(), // Welcome screen as the initial route
      //   '/Login': (context) => LoginPage(), // Define your login page
      //   '/Signup': (context) => SignupScreen(), // Define your signup page
      // },
    );
  }
}

void main() {
  runApp(SidebarApp());
}

class SidebarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       initialRoute: '/Welcome', // Set the initial route
       routes: {
         '/Welcome': (context) => WelcomeScreen(), // Welcome screen as the initial route
         '/Login': (context) => LoginPage(), // Define your login page
         '/Signup': (context) => SignupScreen(), // Define your signup page
       },
      debugShowCheckedModeBanner: false,
      home:
        onBoarding(),


    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  String locationMessage = 'Current Location of the user';
  late String lat;
  late String long;

  //Getting Current Location
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled){
     return Future.error('Location services are disabled.');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied);
       {
        return Future.error(
          'Location permissions are permanently denied, we cannot request permission');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently');
    }
    return await Geolocator.getCurrentPosition();
  }

  //Listen to location updates
  void _liveLocation() {
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10,
    );

    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
          lat = position.latitude.toString();
          long = position.longitude.toString();

          setState(() {
            locationMessage = 'Latitiude: $lat , Longitude: $long';
          });
    });
  }
   //Open the current location in GoogleMap
  Future<void>_openMap(String long, String lat) async {
    String googleURL =
        'https://www.google.com/maps/search/?api=1&query=$lat,$long';
    await canLaunchUrlString(googleURL)
        ? await launchUrlString(googleURL)
        : throw 'Could not launch $googleURL';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Stack(
      children: [
        Center(
          child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
           Text(locationMessage, textAlign: TextAlign.center),
           const SizedBox(height: 20),
           ElevatedButton(
               onPressed: () {
                 getCurrentLocation().then((value) {
                   lat ='${value.latitude}';
                   long = '${value.longitude}';
                   setState(() {
                     locationMessage = 'Latitude: $lat, Longitude: $long';
                   });
                   _liveLocation();
                 });
               },
               child: const Text('Get Current Location '),
           ),
             const SizedBox(height: 20),
             ElevatedButton(
                 onPressed: (){
                   _openMap(lat,long);
                 }, child:Text('Open Google Map'),
             ),
            ],
          ),
        ),
      ],
    ),
  );
}




