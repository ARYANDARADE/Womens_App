import 'dart:io';

import 'package:basic/addForumButton.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<String> notifications = [];
  List<String> descriptionlist = [];

  void addNotification(String message, String description) {
    setState(() {
      notifications.insert(0, message);
      descriptionlist.insert(0, description);
      // Add the latest notification at the beginning of the list
    });
  }

  File? selectedImage;
  TextEditingController incidentName = TextEditingController();
  TextEditingController description = TextEditingController();
  Future openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Enter Incident Details"),
            content: Container(
              child: Column(
                children: [
                  TextField(
                    autofocus: true,
                    controller: incidentName,
                    decoration: InputDecoration(hintText: "Incident Title"),
                  ),
                  TextField(
                    controller: description,
                    decoration: InputDecoration(hintText: "Description"),
                  ),
                  MaterialButton(
                    child: Text("Gallery"),
                    color: Colors.red,
                    onPressed: () {
                      pickImagefromGallery();
                    },
                  ),
                  MaterialButton(
                      child: Text("Camera"),
                      color: Colors.blue,
                      onPressed: () {
                        pickImagefromCamera();
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  selectedImage != null
                      ? Image.file(
                          selectedImage!,
                          height: 79,
                        )
                      : Text("Select an Image")
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    addNotification(incidentName.text, description.text);
                    Navigator.of(context).pop();
                  },
                  child: Text("Submit"))
            ],
          ));
  Future pickImagefromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    // if(returnedImage==null)return;
    setState(() {
      selectedImage = File(returnedImage!.path);
    });
  }

  Future pickImagefromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    // if(returnedImage==null) return;
    setState(() {
      selectedImage = File(returnedImage!.path);
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
              GestureDetector(
                onTap: () {
                  openDialog();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff37949d),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.add, color: Colors.grey.shade200),
                      onPressed: () {
                        openDialog();
                      },
                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                child: ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width -
                          40, // Screen width minus 20 on both sides
                      color: Colors
                          .white, // Set the white color for the "notification pad"
                      margin: EdgeInsets.only(
                          bottom: 10.0), // Add margin between notifications
                      child: Column(
                        children: [
                          Text(notifications[index],style: TextStyle(fontSize: 20),),
                          Text(descriptionlist[index],style: TextStyle(fontSize: 10))
                        ],
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
