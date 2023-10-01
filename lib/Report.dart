import 'package:basic/BusStationCard.dart';
import 'package:basic/HospitalCard.dart';
import 'package:basic/live_safe.dart';
import 'package:basic/policeemergency.dart';
import 'package:flutter/material.dart';
import 'AmbulanceEmergency.dart';
import 'FirebrigadeEmergency.dart';
import 'PharmacyCard.dart';
import 'PoliceStationCard.dart';
class ReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 300,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                          child: PoliceEmergency()
                      ),
                      Container(
                          child:AmbulanceEmergency ()
                      ),
                      Container(
                          child:FirebrigadeEmergency ()
                      ),
                      Container(
                        height: 100,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [


                            Container(
                              child: HospitalCard() ,
                            ),
                            Container(
                              child: BusStationCard(),
                            ),
                            Container(
                              child: PharmacyCard(),
              ),
                            Container(
                              child: PoliceStationCard(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            child:LiveSafe(),
          )
        ],
      )
    );
  }
}