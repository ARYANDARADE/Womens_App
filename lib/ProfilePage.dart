import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back.jpg'), // Replace with your background image path
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance.collection('users').doc(user?.uid).get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData || !snapshot.data!.exists) {
              return Center(child: Text("No data available"));
            } else {
              final userData = snapshot.data!.data() as Map<String, dynamic>;

              String age = userData['age'].toString();
              String gender = userData['gender'].toString();
              String username = userData['name'].toString();
              String address = userData['address'].toString();

              return Padding(
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
                      username,
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(height: 23),
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
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
                                age,
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
                                gender,
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
                                address,
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
              );
            }
          },
        ),
      ),
    );
  }
}
