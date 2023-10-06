import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Home.dart';

class SMSPage extends StatefulWidget {
  const SMSPage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    ShakeDetector.autoStart(
      onPhoneShake: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Shake!'),
          ),
        );
        // Do stuff on phone shake
      },
      minimumShakeCount: 3,
      shakeSlopTimeMS: 500,
      shakeCountResetTime: 3000,
      shakeThresholdGravity: 2.7,
    );
  }
  Future<void> _sendSOSAlert() async{
    print("Sos button called");

    // Replace 'phone_number' with the recipient's phone number

  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50.0,
            left: 12.0,
            child: Builder(
              builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu_outlined, size: screenWidth * 0.11),
              ),
            ),
          ),
          Positioned(
            top: 35,
            left: 280,
            child: Container(
              height: 100,
              width: 105,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/logo.png"),
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 100,
            child: Container(
              child: Text(
                "VIGILANCE",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Positioned(
            top: 145,
            left: 0,
            right: 0,
            child: Container(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Open link for the first image
                      launch('https://youtu.be/SojbIFftzuY?si=nojkFttAj29oyyMF');
                    },
                    child: Container(
                      width: 360,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      margin: EdgeInsets.all(8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset('assets/images/night saftey.jpg', fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Open link for the first image
                      launch('https://youtube.com/shorts/M21oKzmbDkU?si=gtKIuB5Bk_6_wd9q');
                    },
                    child: Container(
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      margin: EdgeInsets.all(8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset('assets/images/selfdefence.jpg', fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Open link for the first image
                      launch('https://youtu.be/x91tRBU_H9Q?si=_-7Eysra4ecTU_aT');
                    },
                    child: Container(
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      margin: EdgeInsets.all(8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset('assets/images/10d05a07e7a2d93351a1e18a6b65e756.jpg', fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 35,
            left: 280,
            child: ElevatedButton(
              onPressed: () => _sendSOSAlert(),
              child: Text('SOS Alert'),
            ),
          ),
        ],
      ),
    );
  }
}


