import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tflite/tflite.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final messagecontroller = TextEditingController();

  void loadModel() async {
    await Tflite.loadModel(
      model: 'assets/NEW_API/model.tflite',
    );
  }




  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:
      Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Today,${DateFormat("Hm").format(DateTime.now())}",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Flexible(child:
            ListView.builder(itemCount: 0,
            reverse: true,
            itemBuilder: (context,index){

            }
            )
            ),
            Container(
              child: ListTile(
                trailing: IconButton(icon : Icon(Icons.send), onPressed: () {
                  if(messagecontroller.text.isEmpty){
                    print("empty model");
                  }
                  else{
                    setState(() {

                    });
                  }
                },),
                title: Container(
                  height: 45,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                  color: Colors.grey),
                  padding: EdgeInsets.only(left: 15),
                  child: TextFormField(
                    controller: messagecontroller,
                    decoration: InputDecoration(
                      hintText: "Enter a Message",
                      hintStyle: TextStyle(
                        color: Colors.black26
                      ),
                      border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none
                    ),
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}
