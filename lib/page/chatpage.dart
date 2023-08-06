import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_chat/customUi/CustomCard.dart';
import 'package:wave_chat/model/chatModel.dart';
import 'package:wave_chat/screens/signUpScreen.dart';
import 'package:wave_chat/screens/selectContact.dart';

class Chatpage extends StatefulWidget {
  Chatpage({super.key, required this.chatmodel, required this.sourceChat});
  // final List<ChatModel> chatmodel;
  final List<ChatModel> chatmodel;
  final ChatModel sourceChat;

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  //final LoginScreen login = LoginScreen();

  // List<ChatModel> chats = [
  //   ChatModel(
  //     name: "Suraj Patra",
  //     isGroup: false,
  //     currentMessage: "Hi EveryOne",
  //     time: "4:00",
  //     icon: "person.svg",
  //   ),
  //   ChatModel(
  //     name: "Sumit Kumar pattnaik",
  //     isGroup: false,
  //     currentMessage: "Hi EveryOne",
  //     time: "4:30",
  //     icon: "person.svg",
  //   ),
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.chatmodel.length,
        itemBuilder: (context, index) => CustomCard(
          chatModel: widget.chatmodel[index],
          sourceChat: widget.sourceChat,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(Selectcontact());
        },
        child: Icon(Icons.chat),
        backgroundColor: Color(0xff819ff3),
      ),
    );
  }
}
