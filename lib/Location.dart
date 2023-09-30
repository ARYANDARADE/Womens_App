import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'package:http/http.dart' as http;


import 'dart:async';
class Safety{
  late final String line;
  Safety({
    required this.line,
  });
}
class LocationData {
  final String name;
  final double latitude;
  final double longitude;
  final double distance; // Add this property
  final double crimeRate; // Add this property
  final int cctvCameras; // Add this property

  LocationData({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.distance,
    required this.crimeRate,
    required this.cctvCameras, // Add this property
  });
}
class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  GoogleMapController? mapController;
  List<LocationData> _locations = [];
  LatLng? _currentLocation;
  Marker? marker;
  Set<Marker> _markers = {};
  int _selectedListIndex = 0;
  bool _isLocationMenuOpen = false;

  @override
  void initState() {
    super.initState();
    _loadLocations();
    _getCurrentLocation();
    Timer.periodic(Duration(seconds: 5), (timer) {
      _getCurrentLocation();
    });
  }
  void _onLocationSelected(LocationData location) {
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: MarkerId(location.name),
          position: LatLng(location.latitude, location.longitude),
          infoWindow: InfoWindow(title: location.name),
        ),
      );
    });
    mapController?.animateCamera(
      CameraUpdate.newLatLng(
        LatLng(location.latitude, location.longitude),
      ),
    );
  }
  String getColumn8Value(int selectedIndex, List<List<dynamic>> csvTable) {
    if (selectedIndex >= 0 && selectedIndex < csvTable.length) {
      return csvTable[selectedIndex][8].toString();
    } else {
      return 'Invalid index';
    }
  }

  void _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      _currentLocation = LatLng(position.latitude, position.longitude);
      _updateMarker();
    });
  }

  void _updateMarker() {
    marker = Marker(
      markerId: MarkerId('currentLocation'),
      position: _currentLocation!,
      infoWindow: InfoWindow(title: 'Current Location'),
    );
  }

  Future<void> _loadLocations() async {
    final String data = await rootBundle.loadString('assets/data.csv');
    List<List<dynamic>> csvTable = const CsvToListConverter().convert(data);
    csvTable.removeAt(0);

    _locations = csvTable.map((row) {
      return LocationData(
        name: row[1].toString(),
        latitude: double.parse(row[3].toString()),
        longitude: double.parse(row[4].toString()),
        distance: double.parse(row[5].toString()), // Assuming it's in the 6th column
        crimeRate: double.parse(row[6].toString()), // Assuming it's in the 7th column
        cctvCameras: int.parse(row[7].toString()),
      );


    }).toList();
  }
  void _toggleLocationMenu() {
    setState(() {
      _isLocationMenuOpen = !_isLocationMenuOpen;
    });
  }

  Future<void> _openPopUpWindow(int selectedIndex) async {
    // Check if the selected index is within valid range
    if (selectedIndex >= 0 && selectedIndex < _locations.length) {
      double distance = _locations[selectedIndex].distance;
      double crimeRate = _locations[selectedIndex].crimeRate;
      int cctvCameras = _locations[selectedIndex].cctvCameras;

      // Make your API call with these values
      final response = await http.post(
        Uri.parse('http:// 192.168.0.105:8000/predict'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "Distance": distance,
          "Crime_Rate": crimeRate,
          "CCTV_Cameras": cctvCameras,
        }),
      );

      // Process the response and show the dialog
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        String popupMessage = data['prediction'];
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Popup Window'),
              content: Text(popupMessage),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'),
                ),
              ],
            );
          },
        );

      } else {
        String popupMessage = 'Error: ${response.statusCode}';
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Popup Window'),
              content: Text(popupMessage),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'),
                ),
              ],
            );
          },
        );
      }
    } else {
      // Handle invalid index
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Popup Window'),
            content: const Text('Invalid index'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);

                },
                child: const Text('Close'),
              ),
            ],
          );
        },
      );
    }
  }

  showDialogFunc(context){
    return showDialog(context: context, builder: (context){
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
            color: Colors.white),
            padding: EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width*0.7,
            height: 320 ,
            child: ListView.builder(
              itemCount: _locations.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_locations[index].name),
                  onTap: () {
                    _selectedListIndex = index;
                    _onLocationSelected(_locations[index]);
                    _toggleLocationMenu();
                  },
                );
              },
            ),
          ),
        ),
      );

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (controller) {
              setState(() {
                mapController = controller;
              });
            },
            initialCameraPosition: CameraPosition(
              target: _currentLocation ?? LatLng(20.682131,77.894250), // Use a default location if _currentLocation is null
              zoom: 4,
            ),
            markers: marker != null ? Set<Marker>.from([marker!]) : {},
          ),
          Positioned(
            top: 80.0,
            left: 16.0,
            child: SizedBox(
              width: 80.0,
              height: 80.0,
              child: FloatingActionButton(
                onPressed: () {
                  _getCurrentLocation();
                  _updateMarker();
                },
                child: Transform.scale(
                  scale: 1.5,
                  child: const Icon(
                    Icons.add_alert,
                    size: 30.0,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 80.0,
            right: 16.0,
            child: SizedBox(
              width: 60.0,
              height: 60.0,
              child: FloatingActionButton(
                onPressed: () {
                  // _openPopUpWindow(_selectedListIndex);
                  showDialogFunc(context);

                  // Add your onPressed action here
                },
                child: Transform.scale(
                  scale: 1,
                  child: const Icon(
                    Icons.format_list_bulleted_rounded,
                    size: 30.0,
                  ),
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}
