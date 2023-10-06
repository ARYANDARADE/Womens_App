import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/teal.jpg'), // Replace with your image path
            fit: BoxFit.cover, // Adjust the fit as needed
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Username',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              // Container(
              //   height: 1,
              //   color: Colors.black,
              // ),
              Container(
                //color: Colors.grey[200],
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Text(
                      'Detail',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text('Age:'),
                subtitle: Text('Random Age Value'),
              ),
              ListTile(
                title: Text('Gender:'),
                subtitle: Text('Gender Value'),
              ),
              ListTile(
                title: Text('Emergency Contact:'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Relation 1: Value1'),
                    Text('Relation 2: Value2'),
                    Text('Relation 3: Value3'),
                  ],
                ),
              ),
              ListTile(
                title: Text('Address:'),
                subtitle: Text('Your Address'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}