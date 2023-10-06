import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
FirebaseAuth auth = FirebaseAuth.instance;

Future <void> AnonymousSignup() async {
  try {
    UserCredential userCredential = await auth.signInAnonymously();
    User? user = userCredential.user;
    print("login succesfull");
    print(user);
    // The user is now signed in anonymously.
  } catch (e) {
    // Handle any errors that may occur during sign-up.
    print(e.toString());
    print("error");
  }
}



// Future <void> PhoneSignup(String phoneNumber) async {
//   try {
//     UserCredential userCredential = await auth.signInWithCredential();
//     User? user = userCredential.user;
//     print("login succesfull");
//     print(user);
//     // The user is now signed in anonymously.
//   } catch (e) {
//     // Handle any errors that may occur during sign-up.
//     print(e.toString());
//     print("error");
//   }
//
// }
