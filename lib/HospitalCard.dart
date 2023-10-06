import 'package:flutter/material.dart';

class HospitalCard extends StatelessWidget {

  final Function? onMapFunction;

  const HospitalCard({Key? key, this.onMapFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              onMapFunction!("https://www.google.co.in/maps/search/hospitals+stations+near+me");
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
                    'assets/images/hospital.png',
                    height: 40,
                  ),
                ),
              ),
            ),
          ),
          Text('Hospitals')
        ],
      ),
    );
  }
}
