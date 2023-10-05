
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import "Police/PoliceMain.dart";
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
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'assets/images/8459ad298c58aa2d544ecbef33d4c5c5.jpg', // Replace with your image path
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            SingleChildScrollView(

              child: Container(
                padding: const EdgeInsets.all(DefaultSize),
                child: Column(
                  children: [
                    Container(
                      height: screenWidth*0.1,
                    ),
                    Positioned(
                      top: 40,
                      child: Container(
                        child: Text("C R E A T E ",
                          style: TextStyle(
                            color: Color(0XFF795548),
                            fontSize: 50.0, // Adjust font size
                            fontWeight: FontWeight.bold,
                          ),),
                      ),
                    ),
                    Positioned(
                      top: 60,
                      child: Container(
                        child: Text("A C C O U N T ",
                          style: TextStyle(
                            color: Color(0XFF795548),
                            fontSize: 50.0, // Adjust font size
                            fontWeight: FontWeight.bold,
                          ),),
                      ),
                    ),
                    /* FormHeaderWidget(
                    image: 'assets/images/luffy.png',
                    title: "Get on Board!",
                    subTitle: "Create your profile to start your journey with us..",
                    imageHeight: 0.4,
                  ),*/
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
          ],
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
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(vertical: FormHeight - 10),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical:5,horizontal: 10),
              width: screenWidth*0.80,
              decoration: BoxDecoration(
                  color: Color(0xFFC9D9C3),//blueGrey,
                  border: Border.all(
                    color: Color(0xFF383330), // Border color
                    width: 2.0, // Border width
                  ),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: TextFormField(
                controller: widget.fullNameController,
                decoration: InputDecoration(
                  label: Text("FullName",
                    style: TextStyle(
                      color: Color(0xFF383330),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),),
                  prefixIcon: Icon(Icons.person_outline_rounded,
                    color: Color(0xFF383330),
                    size: 35,),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: FormHeight - 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical:5,horizontal: 10),
              width: screenWidth*0.80,
              decoration: BoxDecoration(
                  color: Color(0xFFC9D9C3),//blueGrey,
                  border: Border.all(
                    color: Color(0xFF383330), // Border color
                    width: 2.0, // Border width
                  ),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: TextFormField(
                controller: widget.emailController,
                decoration: InputDecoration(
                  label: Text("Email",
                    style: TextStyle(
                      color: Color(0xFF383330),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),),
                  prefixIcon: Icon(Icons.email_outlined,
                    color: Color(0xFF383330),
                    size: 35,),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: FormHeight - 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical:5,horizontal: 10),
              width: screenWidth*0.80,
              decoration: BoxDecoration(
                  color: Color(0xFFC9D9C3),//blueGrey,
                  border: Border.all(
                    color: Color(0xFF383330), // Border color
                    width: 2.0, // Border width
                  ),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: TextFormField(
                controller: widget.phoneNumberController,
                decoration: InputDecoration(
                  label: Text("PhoneNo",
                    style: TextStyle(
                      color: Color(0xFF383330),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),),
                  prefixIcon: Icon(Icons.numbers,
                    color: Color(0xFF383330),
                    size: 35,),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: FormHeight - 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical:5,horizontal: 10),
              width: screenWidth*0.80,
              decoration: BoxDecoration(
                  color: Color(0xFFC9D9C3),//blueGrey,
                  border: Border.all(
                    color: Color(0xFF383330), // Border color
                    width: 2.0, // Border width
                  ),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: TextFormField(
                controller: widget.passwordController,
                obscureText: _isPasswordHidden, // Use this to control the password visibility
                decoration: InputDecoration(
                  label: Text("Password",
                    style: TextStyle(
                      color: Color(0xFF383330),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),),
                  prefixIcon: Icon(Icons.fingerprint,
                    color: Color(0xFF383330),
                    size: 35,),
                  suffixIcon: IconButton(
                    icon: Icon(_isPasswordHidden ? Icons.visibility_off : Icons.visibility,
                      color: Color(0xFF383330),
                      size: 35,),
                    onPressed: () {
                      setState(() {
                        _isPasswordHidden = !_isPasswordHidden; // Toggle password visibility
                      });
                    },
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: FormHeight - 20),
            Container(
              //padding: const EdgeInsets.symmetric(vertical:5,horizontal: 30),
              width: screenWidth*0.34,
              decoration: BoxDecoration(
                color: Color(0xFFC9D9C3),
                border: Border.all(
                  color: Color(0xFF383330), // Border color
                  width: 2.0, // Border width
                ),
                borderRadius: BorderRadius.circular(15.0), // Border radius
              ),
              child:Align(
                child: DropdownButton(
                  items: const [
                    DropdownMenuItem(child: Text("SELECT",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Color(0xFF383330),),), value: "SELECT"),
                    DropdownMenuItem(child: Text("User",style: TextStyle(color: Color(0xFFFEFAE0), fontStyle: FontStyle.italic,fontSize: 20),), value: "user"),
                    DropdownMenuItem(child: Text("Agent",style: TextStyle(color: Color(0xFFFEFAE0), fontStyle: FontStyle.italic,fontSize: 20),), value: "agent"),
                  ],
                  icon: Icon(Icons.arrow_downward_rounded,
                    size: 30,
                    color: Color(0xFF455947),),
                  dropdownColor: Color(0xFFD4BDA1),
                  value: Choice1, // Set the value here
                  onChanged: dropdownCallback,
                ),
              ),
            ),
            const SizedBox(height: FormHeight - 10),
            SizedBox(
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
                              context) =>  MyHomePage()),
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
                              context) =>  PoliceMain()),
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
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 90.0, vertical: 18.0), // Adjust padding for consistency
                  primary: Color(0XFF795548),
                  onPrimary: Color(0xFFFEFAE0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17.0),
                    side: BorderSide(color: Colors.black),
                  ),
                ),
                child: Text(SignupText(Choice1),
                  style: TextStyle(
                    fontSize: 15,
                  ),),
              ),
            ),
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
              text: "Already have an account? ",
              style:TextStyle(
                color: Color(0xFFFEFAE0),
              ),// Use the variable here
            ),
            TextSpan(text: "login".toUpperCase(),style: TextStyle(color: Color(0xFFD4BDA1),)), // Use the variable here
          ])),
        ),
      ],
    );
  }
}
