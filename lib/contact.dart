import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});
  _callNumber(String number) async {
    await FlutterPhoneDirectCaller.callNumber(number);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _callNumber('9529448553'),
      child: Container(
        height: 10,
        width: 75,
        decoration: BoxDecoration(color: Colors.lightBlue,shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage("assets/images/avatar.png")),),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Container(
            decoration: BoxDecoration(

            ),
            child: Icon(Icons.call,color: Colors.green,),
          ),
        ),
      ),
    );
  }
}

