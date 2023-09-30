import 'dart:ffi';
import 'home.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'Login.dart';

// Define DefaultSize as a constant double value
const double DefaultSize = 16.0;
const double FormHeight = 60.0;


class SignupScreen extends StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignupScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(DefaultSize),
            child: Column(
              children: [
                FormHeaderWidget(
                  image: 'assets/images/luffy.png',
                  title: "Get on Board!",
                  subTitle: "Create your profile to start your journey with us..",
                  imageHeight: 0.4,
                ),
                SignUpFormWidget(
                  fullNameController: fullNameController,
                  emailController: emailController,
                  phoneNumberController: phoneNumberController,
                  passwordController: passwordController,
                ),
                SignUpFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FormHeaderWidget extends StatelessWidget {
  final Color? imageColor;
  final double imageHeight;
  final double? heightBetween;
  final String image, title, subTitle;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign? textAlign;

  const FormHeaderWidget({
    Key? key,
    this.imageColor,
    this.heightBetween,
    required this.image,
    required this.title,
    required this.subTitle,
    this.imageHeight = 0.2,
    this.textAlign,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Image(image: AssetImage(image), color: imageColor, height: size.height * imageHeight),
        SizedBox(height: heightBetween),
        Text(title, style: Theme.of(context).textTheme.headline1),
        Text(subTitle, textAlign: textAlign, style: Theme.of(context).textTheme.bodyText1),
      ],
    );
  }
}

class SignUpFormWidget extends StatefulWidget {
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;
  final TextEditingController passwordController;

  SignUpFormWidget({
    Key? key,
    required this.fullNameController,
    required this.emailController,
    required this.phoneNumberController,
    required this.passwordController,
  }) : super(key: key);


  @override
  _SignUpFormWidgetState createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  bool _validateForm(BuildContext context) {
    final String fullName = widget.fullNameController.text.trim();
    final String email = widget.emailController.text.trim();
    final String password = widget.passwordController.text.trim();
    final String phoneNumber = widget.phoneNumberController.text.trim();

    if (fullName.isEmpty || email.isEmpty || password.isEmpty || phoneNumber.isEmpty || Choice1 == "SELECT") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all required fields.'),
        ),
      );
      return false;
    }

    return true;
  }
  bool _isPasswordHidden = true;

  String Choice1 = 'SELECT';


  SignupText (Choice1) {
    if(Choice1 == 'SELECT'){
      return 'Signup';

    }
    else{
      return "SignUp as "+ Choice1  ;
    }
  }


  void dropdownCallback(String? selectedValue) {
    if (selectedValue != "SELECT") {
      setState(() {
        Choice1 = selectedValue!;
      });
    }else{
      SnackBar(
        content: Text('Please fill in all required fields.'),
      );

    }
    print(Choice1);
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(vertical: FormHeight - 10),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: widget.fullNameController,
              decoration: InputDecoration(
                label: Text("FullName"),
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
            ),
            const SizedBox(height: FormHeight - 20),
            TextFormField(
              controller: widget.emailController,
              decoration: InputDecoration(
                label: Text("Email"),
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            const SizedBox(height: FormHeight - 20),
            TextFormField(
              controller: widget.phoneNumberController,
              decoration: InputDecoration(
                label: Text("PhoneNo"),
                prefixIcon: Icon(Icons.numbers),
              ),
            ),
            const SizedBox(height: FormHeight - 20),
            TextFormField(
              controller: widget.passwordController,
              obscureText: _isPasswordHidden, // Use this to control the password visibility
              decoration: InputDecoration(
                label: Text("Password"),
                prefixIcon: Icon(Icons.fingerprint),
                suffixIcon: IconButton(
                  icon: Icon(_isPasswordHidden ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      _isPasswordHidden = !_isPasswordHidden; // Toggle password visibility
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: FormHeight - 20),
           /* DropdownButton(
              items: const [
                DropdownMenuItem(child: Text("SELECT"), value: "SELECT"),
                DropdownMenuItem(child: Text("User"), value: "user"),
                DropdownMenuItem(child: Text("Agent"), value: "agent"),
              ],
              value: Choice1, // Set the value here
              onChanged: dropdownCallback,
            ),*/
            const SizedBox(height: FormHeight - 10),
           /* SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (_validateForm(context) && Choice1 == "user") {
                    try {
                      UserCredential newUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: "user." + widget.emailController.text,
                          password: widget.passwordController.text);
                      print("User Registered");
                      if (newUser != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (
                              context) =>  HomePage()),
                        );
                      }

                    }
                    on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('The password provided is too weak.'),
                          ),
                        );
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('The account already exists for that email.'),
                          ),
                        );
                        print('The account already exists for that email.');
                      }
                    }


                    catch (e) {
                      print(e);
                    } // Your user signup logic here
                  } else if (_validateForm(context) && Choice1 == "agent") {
                    try {
                      UserCredential newUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: "agent." + widget.emailController.text,
                          password: widget.passwordController.text);
                      print("Agent REgistered");
                      if (newUser != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (
                              context) =>  AgentMain()),
                        );
                      }

                    }
                    on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('The password provided is too weak.'),
                          ),
                        );
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('The account already exists for that email.'),
                          ),
                        );
                        print('The account already exists for that email.');
                      }
                    }


                    catch (e) {
                      print(e);
                    }         // Your agent signup logic here
                  } else {
                    // Show an error message on the signup page
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please fill in all required fields.'),
                      ),
                    );
                  }
                },
                child: Text(SignupText(Choice1)),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}


class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()), // Navigate to LoginPage
            );
          },
          child: Text.rich(TextSpan(children: [
            TextSpan(
              text: "Already have an account?", // Use the variable here
              style: Theme.of(context).textTheme.bodyText1,
            ),
            TextSpan(text: "login".toUpperCase()), // Use the variable here
          ])),
        ),
      ],
    );
  }
}
