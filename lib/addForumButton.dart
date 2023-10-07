import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddForumBtn extends StatefulWidget {
  const AddForumBtn({super.key});



  @override
  State<AddForumBtn> createState() => _AddForumBtnState();
}

class _AddForumBtnState extends State<AddForumBtn> {

  File ? selectedImage;
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
                decoration:
                InputDecoration(hintText: "Incident Title"),
              ),
              TextField(

                controller: description,
                decoration:
                InputDecoration(hintText: "Description"),
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
                  onPressed: (){
                    pickImagefromCamera();
                  }
                  ),
              SizedBox(height: 20,),
              selectedImage != null ? Image.file(selectedImage!): Text("Select an Image")
              ],
          ),
        ),
        actions: [TextButton(onPressed: () {

          Navigator.of(context).pop();
        }, child: Text("Submit"))],
      ));
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
            icon: Icon(Icons.add,
                color: Colors.grey.shade200),
            onPressed: () {
              openDialog();
            },
          ),
        ),
      ),
    );
  }Future pickImagefromGallery() async{
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    // if(returnedImage==null)return;
    setState((){
      selectedImage = File(returnedImage!.path);
    });
  }
  Future pickImagefromCamera() async{
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    // if(returnedImage==null) return;
    setState((){
      selectedImage = File(returnedImage!.path);
    });
  }
}

