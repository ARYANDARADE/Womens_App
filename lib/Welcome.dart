import 'package:basic/NavBar.dart';
import 'package:flutter/material.dart';
import 'Home.dart';
import 'main.dart';
import 'Login.dart';
import 'signup.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {


    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;


    return Scaffold(
      body: Container(
        padding:EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           // Image(image: const AssetImage('assets/images/wp8402470-removebg-preview.png'), height: height * 0.6),
            Column(
              children: [
                Text("WelcomeTitle", style: Theme.of(context).textTheme.headline3),
                Text("WelcomeSubTitle",
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center),
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
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => NavBar(),
                        ),
                      );
                    },
                    child: Text("Home".toUpperCase()),
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}