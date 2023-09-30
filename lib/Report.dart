import 'package:flutter/material.dart';
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
                  height: 50,
                  width: screenWidth,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                      color: Colors.lightGreen),
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}