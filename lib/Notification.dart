import 'package:basic/addForumButton.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<String> notifications = [];

  void addNotification(String message) {
    setState(() {
      notifications.insert(0, message); // Add the latest notification at the beginning of the list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey, // Set the background color here
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SafeArea(
          child: Column(
            children: [
              AddForumBtn(),
              Container(
                height: 100,
                child: ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width - 40, // Screen width minus 20 on both sides
                      color: Colors.white, // Set the white color for the "notification pad"
                      margin: EdgeInsets.only(bottom: 10.0), // Add margin between notifications
                      child: Center(
                        child: Text(notifications[index]),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}

void main() {
  runApp(MaterialApp(
    home: NotificationPage(),
    debugShowCheckedModeBanner: false, // Remove the debug banner
  ));
}
