import 'package:basic/chatbot.dart';
import 'package:basic/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  _callNumber(String number) async {
    await FlutterPhoneDirectCaller.callNumber(number);
  }
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  final List<String> numbers = ["9529448553","987654321","987654321","987654321","1234567889"];
  final List<String> contact = ["Harshavardhan","test","test","test","test"];
  void addItemToList(){
    setState(() {
      contact.insert(0,nameController.text);
      numbers.insert(0,numberController.text);
    });
  }
  @override
  Widget build(BuildContext context) {



    final screenWidth = MediaQuery.of(context).size.width;
    Future openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Enter Contact Details"),
              content: Container(
                height: 100,
                child: Column(
                  children: [
                    TextField(
                      autofocus: true,
                      controller: nameController,
                      decoration:
                          InputDecoration(hintText: "Enter Contact Name"),
                    ),
                    TextField(
                      controller: numberController,
                      decoration:
                          InputDecoration(hintText: "Enter Contact No."),
                    )
                  ],
                ),
              ),
              actions: [TextButton(onPressed: () {
                addItemToList();
                Navigator.of(context).pop();
              }, child: Text("Submit"))],
            ));
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SafeArea(
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 70,
                              width: 75,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
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
                        ),
                        Container(
                          height: 100,
                          child: VerticalDivider(
                            width: 15,
                            thickness: 1,
                          ),
                        ),
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.all(0),
                              height: 100,
                              child: ListView.builder(
                                  padding: EdgeInsets.all(15),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: contact.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () => _callNumber(numbers[index]),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 54,
                                            width: 75,
                                            decoration: BoxDecoration(
                                              color: Colors.lightBlue,
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/avatar.png")),
                                            ),
                                            child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: Container(
                                                decoration: BoxDecoration(),
                                                child: Icon(
                                                  Icons.call,
                                                  color: Colors.green,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              contact[index],
                                              style: TextStyle(fontSize: 11),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                    ;
                                  })),
                        ),
                      ],
                    ),
                  ),
                  ChatBot()
                ],
              ),
            ),
          ],
        ));
  }
}
