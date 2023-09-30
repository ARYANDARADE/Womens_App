// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';
import 'home.dart';
import 'main.dart';
import 'Signup.dart';
import 'package:rive/rive.dart';
//import 'forgot_password.dart';
//import 'package:firebase_auth/firebase_auth.dart';
// Define DefaultSize as a constant double value
const double DefaultSize = 16.0;

const String tWelcomeScreenImage = 'assets/images/luffy.png'; // Replace with your image path
const String tLoginTitle = 'Login Title'; // Replace with your login title
const String tLoginSubTitle = 'Login Subtitle'; // Replace with your login subtitle

const double tFormHeight = 60.0; // Replace with your desired form height
String tEmail = 'Email'; // Replace with your email label
String tPassword = 'Password'; // Replace with your password label
const String tForgetPassword = 'Forgot Password?'; // Replace with your forgot password label
const String tLogin = 'Login'; // Replace with your login button label
const double tDefaultSize = 16.0; // You can adjust the value as needed

const String tGoogleLogoImage = 'assets/images/q8-vPggS_400x400-removebg-preview.png'; // Replace with your Google logo image path
const String tSignInWithGoogle = 'Sign in with Google'; // Replace with your Google sign-in text
const String tDontHaveAnAccount = "Don't have an account?"; // Replace with your text
const String tSignup = 'Sign Up'; // Replace with your sign-up text





void main()  {

  runApp(const LoginPage());
}
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  /*late RiveAnimationController _controller;

  /// Is the animation currently playing?
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = OneShotAnimation(
      'bounce',
      autoplay: false,
      onStop: () => setState(() => _isPlaying = false),
      onStart: () => setState(() => _isPlaying = true),
    );
  }*/



  bool showSpinner = false;

 /* void _showForgetPasswordBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (context) => ForgetPasswordBottomSheet(), // Use the new widget here
    );
  }*/
  String Choice1 = 'SELECT';

  bool _isPasswordHidden = true;
  String LoginText (Choice1) {
    if(Choice1 == 'SELECT'){
      return 'Login';

    }
    else{
      return "Login as "+ Choice1  ;
    }
  }
  void dropdownCallback(String? selectedValue) {
    if (selectedValue != "SELECT") {
      setState(() {
        Choice1 = selectedValue!;
      });
    }else{
      const SnackBar(
        content: Text('Please fill in all required fields.'),
      );

    }
    print(Choice1);
  }

  @override
  Widget build(BuildContext context) {
    // Get the size in LoginHeaderWidget()
    final size = MediaQuery.of(context).size;


    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(DefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Positioned(
                       height: 10,
                       top: 10,
                       left: 0,
                       child: RiveAnimation.asset(
                            'assets/images/a_boy (2).riv',
                           // animations: const ['idle', 'curves'],
                            //controllers: [_controller],
                           // fit: BoxFit.fill,
                          ),
                     ),
                    Text(tLoginTitle, style: Theme.of(context).textTheme.displayLarge),
                    Text(tLoginSubTitle, style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
                Form(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.person_outline_outlined),
                              labelText: 'Email',

                              border: OutlineInputBorder()),
                          onChanged: (value) {
                            // Store the user's answer for Question 1
                            print(tEmail);
                            tEmail = value;
                          },

                        ),
                        const SizedBox(height: tFormHeight - 20),
                        TextFormField(

                          obscureText: _isPasswordHidden, // Use this to control the password visibility
                          decoration: InputDecoration(
                            label: const Text("Password"),
                            prefixIcon: const Icon(Icons.fingerprint),
                            suffixIcon: IconButton(
                              icon: Icon(_isPasswordHidden ? Icons.visibility_off : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _isPasswordHidden = !_isPasswordHidden; // Toggle password visibility
                                });
                              },
                            ),
                          ),

                          onChanged: (value) {
                            // Store the user's answer for Question 1
                            tPassword = value;
                            print(tPassword);
                          },
                        ),
                       /* DropdownButton(
                          items: const [
                            DropdownMenuItem(child: Text("SELECT"), value: "SELECT"),
                            DropdownMenuItem(child: Text("User"), value: "user"),
                            DropdownMenuItem(child: Text("Agent"), value: "agent"),
                          ],
                          value: Choice1,
                          onChanged: dropdownCallback,
                        ),*/
                      /*  const SizedBox(height: tFormHeight - 20),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              _showForgetPasswordBottomSheet(context); // Call the function to show the bottom sheet
                            },
                            child: Text("Forget password".toUpperCase()),
                          ),
                        ),*/
                      /*  SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              print(tEmail);
                              if (Choice1 == "user") {
                                try {
                                  UserCredential user = await FirebaseAuth
                                      .instance.signInWithEmailAndPassword(
                                      email:"user." + tEmail,
                                      password: tPassword);
                                  if (user != null) {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                        const HomePage(), // Replace with the name of your MyApp class
                                      ),
                                    );
                                  }
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'user-not-found') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'No user found for that email.'),
                                      ),
                                    );
                                    print('No user found for that email.');
                                  } else if (e.code == 'wrong-password') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Wrong password provided for that user.'),
                                      ),
                                    );
                                    print(
                                        'Wrong password provided for that user.');
                                  }
                                }

                                catch (e) {
                                  print(e);
                                }
                                setState(() {
                                  showSpinner = false;
                                });
                              }else if (Choice1 == "agent"){
                                try {
                                  UserCredential user = await FirebaseAuth
                                      .instance.signInWithEmailAndPassword(
                                      email: "agent."+ tEmail,
                                      password: tPassword);
                                  if (user != null) {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                        const AgentMain(), // Replace with the name of your MyApp class
                                      ),
                                    );
                                  }
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'user-not-found') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'No user found for that email.'),
                                      ),
                                    );
                                    print('No user found for that email.');
                                  } else if (e.code == 'wrong-password') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Wrong password provided for that user.'),
                                      ),
                                    );
                                    print(
                                        'Wrong password provided for that user.');
                                  }
                                }

                                catch (e) {
                                  print(e);
                                }
                                setState(() {
                                  showSpinner = false;
                                });

                              }else {
                                // Show an error message on the signup page
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please fill in all required fields.'),
                                  ),
                                );
                              }

                            },
                            child: Text(LoginText(Choice1)),
                          ),
                        ),*/
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [



                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignupScreen()), // Navigate to SignupPage
                          );
                        },
                        child: Text.rich(
                          TextSpan(
                              text: tDontHaveAnAccount,
                              style: Theme.of(context).textTheme.bodyLarge,
                              children: const [
                                TextSpan(text: tSignup, style: TextStyle(color: Colors.blue))
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),


      ),
    );
  }
}
