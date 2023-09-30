import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() => runApp(const LocationPage());

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});


  @override
  State createState() => _LocationPageState();
}


class _LocationPageState extends State {
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
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(20.5937, 78.9629);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children:[
              GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 4.5
                  ,
                ),
              ),
              SizedBox(
                width: 80.0, // Set the width you want for the button
                height: 80.0, // Set the height you want for the button
                child: FloatingActionButton(
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
                  child: Transform.scale(
                    scale: 1.5, // Adjust the scale factor to make the icon bigger
                    child: const Icon(
                      Icons.add_alert,
                      size: 30.0, // Set the size of the icon
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                  onPressed: (){
                    _openMap(lat,long);
                  }, child: const Text('Open Google Map'),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}