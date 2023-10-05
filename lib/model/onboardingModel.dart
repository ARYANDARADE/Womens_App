import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoardingModelPageViewModel extends StatelessWidget {
  const OnBoardingModelPageViewModel({super.key, required this.imgUrl, required this.modelTitle, required this.modelDesc});

  final String imgUrl, modelTitle, modelDesc;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width *0.05),decoration: BoxDecoration(image: DecorationImage(image: AssetImage(imgUrl),fit: BoxFit.cover,colorFilter: ColorFilter.mode(Color(0xFF7A7A7A), BlendMode.modulate),)),
      child: Container(
        padding: EdgeInsets.only(bottom: size.height * 0.2),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(modelTitle,textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 25.0,fontWeight: FontWeight.w600,),),
          SizedBox(height: size.width * 0.05,),
          Text(modelDesc,textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 18.0,),),

        ],),
      ),
    );
  }
}
