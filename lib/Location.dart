import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  GoogleMapController? mapController;
  LatLng? _currentLocation;
  Marker? _marker;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    Timer.periodic(Duration(seconds: 5), (timer) {
      _getCurrentLocation();
    });
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
    _marker = Marker(
      markerId: MarkerId('currentLocation'),
      position: _currentLocation!,
      infoWindow: InfoWindow(title: 'Current Location'),
    );
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
            markers: _marker != null ? Set<Marker>.from([_marker!]) : {},
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
        ],
      ),
    );
  }
}
