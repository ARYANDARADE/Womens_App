import 'package:flutter/material.dart';
import 'Police/PoliceMain.dart';
import 'main.dart';
import 'Login.dart';
import 'Signup.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;


    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;


    return Scaffold(
      body: Container(
        // height:screenWidth*3,
        // color: Colors.white,//Color(0xE4D1F8C9),
        child: Stack(
          children:[
            ClipRRect(
              //borderRadius: BorderRadius.only(
              // bottomLeft: Radius.circular(190.0), // Adjust the radius as needed
              //  bottomRight: Radius.circular(190.0), // Adjust the radius as needed
              // ),
              child: Image.asset(
                'assets/images/88351e9fbe092101122b6c4226a27bbf.jpg',
                width: screenWidth * 1.0,
                height: screenWidth * 3,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
                top: screenWidth * 0.7,
                left: screenWidth *0.05,
                 child:Text("Y A A N T R I K A", style:TextStyle(
                   fontSize: screenWidth*0.12,
                  color: Color(0xFF3E2723),
                   fontWeight:FontWeight.bold,
                   ),
                    ),
               /* child: Image.asset(
                  'assets/images/Screenshot__181_-removebg-preview.png',
                  width: screenWidth * 0.9,
                  height: screenWidth * 0.23,
                  fit: BoxFit.fill,
                )*/
            ),
            Positioned(
              top: screenWidth*0.94,
              left: screenWidth*0.28,
              child: Text(
                "GIVING SECOND LIFE",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: screenWidth * 0.05,
                  color: Color(0xFF864622),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: screenWidth*0.21,
              left: screenWidth*0.23,
              child:Image.asset(
                'assets/images/alert.png',
                width: screenWidth * 0.5,
                height: screenWidth * 0.5,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: screenWidth * 1.70, // Adjust the top value to position the button vertically
              left: screenWidth * 0.15, // Adjust the left value to position the button horizontally
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 107.0, vertical: 12.0), // Adjust padding for consistency
                  side: BorderSide(color: Color(0XFF795548)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17.0),
                  ),
                ),
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0XFF795548),
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenWidth * 1.90, // Adjust the top value to position the button vertically
              left: screenWidth * 0.15, // Adjust the left value to position the button horizontally
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SignupScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 12.0), // Adjust padding for consistency
                  primary: Color(0XFF795548),
                  onPrimary:Color(0XFFFEFAE0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17.0),
                    side: BorderSide(color: Colors.black),
                  ),
                ),
                child: Text(
                  "SIGNUP",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),

            Positioned(
              top: screenWidth * 0.50, // Adjust the top value to position the button vertically
              left: screenWidth * 0.2, // Adjust the left value to position the button horizontally
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0), // Adjust padding to increase button size
                  primary: Color(0xFFC78853), // Set the button's background color
                  onPrimary: Colors.white, // Set the color of text and icons on the button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Adjust the border radius as needed
                    side: BorderSide(color: Colors.black), // Border color
                  ),
                ),
                child: Text(
                  "User",
                  style: TextStyle(
                    fontSize: 20.0, // Adjust font size to increase button text size
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenWidth *0.50, // Adjust the top value to position the button vertically
              left: screenWidth * 0.60, // Adjust the left value to position the button horizontally
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PoliceMain(),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0), // Adjust padding as needed
                  side: BorderSide(color: Colors.blue), // Border color
                ),
                child: Text(
                  "Agent",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white// Adjust font size to increase button text size
                  ),
                ),
              ),
            )
























            /* Container(
            padding:EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(image: const AssetImage('assets/images/135492596-battery-recycling-background-with-electronic-waste-symbols-isometric-vector-illustration.png'), height: height * 0.3),
                Column(
                  children: [
                    Text("YAANTRIKA", style: Theme.of(context).textTheme.headline3),
                    Text("GIVING SECOND LIFE",
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                          fontSize: screenWidth * 0.05,
                        ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>  LoginPage(),
                            ),
                          );
                        },
                        child: Text("Login".toUpperCase()),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SignupScreen(),
                            ),
                          );
                        },
                        child: Text("Signup".toUpperCase()),
                      ),
                    ),

                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => MyHomePage(),
                            ),
                          );
                        },
                        child: Text("RemoveTest".toUpperCase()),
                      ),
                    ),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AgentMain(),
                            ),
                          );
                        },
                        child: Text("Agent".toUpperCase()),
                      ),
                    ),
                  ],
                )

              ],
            ),
          ),*/
          ],
        ),
      ),
    );
  }
}