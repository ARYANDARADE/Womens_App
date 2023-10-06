import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back.jpg'), // Replace with your image path
            fit: BoxFit.cover, // Adjust the fit as needed
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Container(
                    child: Text(
                      "Profile",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xff042b2f),
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Username',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 23),
              // Divider(
              //   color: Color(0xffff6b81), // Adjust the color of the line
              //   thickness: 2, // Adjust the thickness of the line
              //   height: 0, // Adjust the height of the line
              // ),

              Container(
                height: 600,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9), // Adjust the opacity as needed
                  borderRadius: BorderRadius.circular(0), // Add border radius
                ), // Adjust the opacity as needed
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '             Details',
                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    SizedBox(height: 20),
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0), // Adjust the padding as needed
                      title: Row(
                        children: [
                          Text(
                            'Age:',
                            style: TextStyle(
                              color: Color(0xff37949d),
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Container(
                            width: 270,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xff37949d),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                '20',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    ListTile(
                      title: Row(
                        children: [
                          Text(
                            'Gender:',
                            style: TextStyle(
                              color: Color(0xff37949d),
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Container(
                            width: 227,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xff37949d),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Male',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    ListTile(
                      title: Row(
                        children:[
                          Text('Emergency Contact:',style: TextStyle(
                            color:Color(0xff37949d),
                            fontSize: 30,
                          ),),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 400,
                            height: 50,
                            decoration: BoxDecoration(
                              //color: Color(0xfff6b4bb),
                              border: Border.all(
                                color: Color(0xff37949d),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                '12313123',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Container(
                            width: 400,
                            height: 50,
                            decoration: BoxDecoration(
                              // color: Color(0xfff6b4bb),
                              border: Border.all(
                                color: Color(0xff37949d),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                '932424234',
                                style: TextStyle(
                                  color: Color(0xfff6b4bb),
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Container(
                            width: 400,
                            height: 50,
                            decoration: BoxDecoration(
                              // color: Color(0xfff6b4bb),
                              border: Border.all(
                                color: Color(0xff37949d),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                '634532535',
                                style: TextStyle(
                                  color: Color(0xfff6b4bb),
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    ListTile(
                      title: Row(
                        children: [
                          Text(
                            'Address:',
                            style: TextStyle(
                              color: Color(0xff37949d),
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Container(
                            width: 210,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xff37949d),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'asdadasda',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
