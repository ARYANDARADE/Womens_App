import 'package:flutter/material.dart';

class PharmacyCard extends StatelessWidget {
  final Function? onMapFunction;

  const PharmacyCard({Key? key, this.onMapFunction}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              onMapFunction!('pharmacies near me');
            },
            child: InkWell(
              onTap: () {
                onMapFunction!('https://www.google.co.in/maps/search/pharmacy+stores+near+me');
              },
              child: Card(
                elevation: 3,
                color: Color(0xffff6b81),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  height: 60,
                  width: 60,
                  child: Center(
                    child: Image.asset(
                      'assets/images/medical store.png',
                      height: 40,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text('Pharmacy')
        ],
      ),
    );
  }
}
