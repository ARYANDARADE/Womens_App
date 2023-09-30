import 'package:basic/chatbot.dart';
import 'package:basic/contact.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final contact = ["contact1",
      "contact2",
      "contact3",
     "contact4",
    "contact5",
    "contact6"];
    final screenWidth = MediaQuery.of(context).size.width;
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
                              child:
                                  IconButton(icon:Icon(Icons.add, color: Colors.grey.shade200), onPressed: () {

                                  },),
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
                                    return Contact();
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
