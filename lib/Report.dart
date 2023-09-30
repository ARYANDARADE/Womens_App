import 'package:basic/BusStationCard.dart';
import 'package:basic/HospitalCard.dart';
import 'package:basic/policeemergency.dart';
import 'package:flutter/material.dart';

import 'PharmacyCard.dart';
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
                child: Column(
                  children: [

                    Container(
                        child: PoliceEmergency()
                    ),
                    Container(
                      child: HospitalCard() ,
                    ),
                    Container(
                      child: BusStationCard(),
                    ),
              Container(
                child: PharmacyCard(),
              ),
                  ],
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}