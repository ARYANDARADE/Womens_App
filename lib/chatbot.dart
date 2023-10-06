import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:basic/ChatMessages.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});


  @override
  State<ChatBot> createState() => _ChatBotState();
}



class _ChatBotState extends State<ChatBot> {
  List<Map<String, dynamic>> intents = [];
  @override
  void initState() {
    super.initState();
    loadJsonData();
  }
  final TextEditingController _messagecontroller = TextEditingController();
  final List<ChatMessages> _messages =[];


  Future<void> loadJsonData() async {
    String jsonString = await rootBundle.loadString('assets/chat.json');
    print("loaded");
    setState(() {
      Map<String, dynamic> jsonData = json.decode(jsonString);
      intents = List<Map<String, dynamic>>.from(jsonData['intents']);
    });
  }
  String chatbotResponse(String userInput) {
    for (var intent in intents) {
      if (intent['patterns'].contains(userInput)) {
        dynamic responses = intent['responses'];
        if (responses is List<dynamic>) {
          return responses[(responses.length * (Random().nextDouble())).toInt()].toString();
        }
      }
    }
    return "Sorry, I didn't understand that.";
  }



  void _sendMessage(){
    String prompt = _messagecontroller.text;
    ChatMessages _message = ChatMessages(text: prompt, sender: "you");

    setState(() {
    _messages.insert(0, _message);
  });

  _messagecontroller.clear();

  ChatMessages _botmessage = ChatMessages(text: chatbotResponse(prompt), sender: "bot");
  setState(() {
    _messages.insert(0, _botmessage);
  });
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
            Flexible(
                 child:ListView.builder(
                   reverse: true,
                  padding: EdgeInsets.all(8),
                  itemCount: _messages.length,
                  itemBuilder: (context,index){
                  return Padding(
                    padding: EdgeInsets.all(16),
                    child: _messages[index]
                  );
                }
                )
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 25),
              child: ListTile(
                trailing: IconButton(icon : const Icon(Icons.send), onPressed: () {
                  if(_messagecontroller.text.isEmpty){
                    print("empty model");
                  }
                  else{
                    _sendMessage();

                  }
                },),
                title: Container(
                  height: 45,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                  color: Colors.grey),
                  padding: const EdgeInsets.only(left: 15),
                  child: TextFormField(
                    onFieldSubmitted: (value)=> _sendMessage(),
                    controller: _messagecontroller,
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
                    style: const TextStyle(fontSize: 16, color: Colors.black),
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

