// import 'package:basic/NavBar.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:introduction_screen/introduction_screen.dart';
//
// void main() {
//   runApp(onBoarding());
// }
//
// class onBoarding extends StatefulWidget {
//   const onBoarding({super.key});
//
//   @override
//   State<onBoarding> createState() => _onBoardingState();
// }
//
// class _onBoardingState extends State<onBoarding> {
//   final introKey = GlobalKey<IntroductionScreenState>();
//
//   void _onIntroEnd(context) {
//     Navigator.of(context).pushReplacement(
//       MaterialPageRoute(builder: (_) => const NavBar()),
//     );
// }
//
//   @override
//   Widget build(BuildContext context) {
//     const bodyStyle = TextStyle(fontSize: 19.0);
//     Widget _buildImage(String assetName, [double width = 350]) {
//       return Image.asset('assets/images/$assetName', width: width);
//     }


//     const pageDecoration = PageDecoration(
//       titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
//       bodyTextStyle: bodyStyle,
//       bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
//       pageColor: Colors.white,
//       imagePadding: EdgeInsets.zero,
//     );
//     return IntroductionScreen(
//       key: introKey,
//       //globalBackgroundColor: Colors.white,
//       allowImplicitScrolling: true,
//       autoScrollDuration: 10000,
//       infiniteAutoScroll: false,
//       // globalHeader: Align(
//       //   alignment: Alignment.center,
//       //   child: SafeArea(
//       //     child: Padding(
//       //       padding: const EdgeInsets.only(top: 16,right: 16),
//       //       child: _buildImage("logo.png", 200)
//       //     ),
//       //   ),
//       // ),
//       // globalFooter: SizedBox(
//       //   height: 60,
//       //   width: double.infinity,
//       //   child: ElevatedButton(
//       //     child: Text("Lets Go Right Away",
//       //         style: TextStyle(fontSize:16.0, fontWeight: FontWeight.bold ),
//       //     ),
//       //     onPressed: ()=> _onIntroEnd(context),
//       //   ),
//       // ),
//       pages: [
//         PageViewModel(
//           title: "Maps: Navigate with Confidence",
//         body: "Navigate through your surroundings with ease and confidence ",
//         image : _buildImage("maps.png",100),
//         decoration: pageDecoration,
//         ),
//         PageViewModel(title: "Emergency Alert Button",
//           body: "With our dedicated emergency alert button, you can instantly send distress signals to pre-configured contacts and emergency services",
//           image : _buildImage("alert.png",100),
//           decoration: pageDecoration,
//         ),
//         PageViewModel(title: "Instant Contact with Emergency Services",
//           body: "Reach out for assistance, provide crucial information, and receive immediate guidance to help you through any distressing situation.",
//           image : _buildImage("chatbot.png",100),
//           decoration: pageDecoration,
//         ),
//         PageViewModel(title: "A Collaborative Approach to Safety",
//           body: "The community watch feature allows you to contribute to the safety of others by rating and assessing the safety of different locations",
//           image : _buildImage("community.png",100),
//           decoration: pageDecoration,
//         )
//
//       ],
//       onDone: () => _onIntroEnd(context),
//       onSkip: () => _onIntroEnd(context), // You can override onSkip callback
//       showSkipButton: true,
//       skipOrBackFlex: 0,
//       nextFlex: 0,
//       showBackButton: false,
//       showDoneButton: true,
//       back: const Icon(Icons.arrow_back,color: Color(0xff30949D)),
//       skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600,color: Color(0xff30949D))),
//       next: const Icon(Icons.arrow_forward,color: Color(0xff30949D)),
//       done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600,color: Color(0xff30949D))),
//       curve: Curves.fastLinearToSlowEaseIn,
//       controlsMargin: const EdgeInsets.all(16),
//       controlsPadding: kIsWeb
//           ? const EdgeInsets.all(12.0)
//           : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
//       dotsDecorator: const DotsDecorator(
//         size: Size(10.0, 10.0),
//         color: Color(0xFFBDBDBD),
//         activeSize: Size(22.0, 10.0),
//         activeColor: Color(0xff30949D),
//         activeShape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(25.0)),
//         ),
//       ),
//       dotsContainerDecorator: const ShapeDecoration(
//         color: Colors.transparent,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(25.0)),
//         ),
//       ),
//     );
//   }
// }
//
