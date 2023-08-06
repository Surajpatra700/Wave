import 'package:flutter/material.dart';
import 'package:wave_chat/customUi/buttonCard.dart';
import 'package:wave_chat/homeScreen.dart';
import 'package:wave_chat/model/chatModel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ChatModel? sourceChat;

  final List<ChatModel> chatmodel = [
    ChatModel(
      name: "Suraj Patra",
      isGroup: false,
      currentMessage: "Hi EveryOne",
      time: "4:00",
      icon: "person.svg",
      id: 1,
    ),
    ChatModel(
      name: "Sumit Kumar pattnaik",
      isGroup: false,
      currentMessage: "Hi EveryOne",
      time: "4:30",
      icon: "person.svg",
      id: 2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: chatmodel.length,
          itemBuilder: (context, index) => InkWell(
              onTap: () {
                sourceChat = chatmodel.removeAt(index);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeScreen(
                              chatmodels: this.chatmodel,
                              sourceChat: sourceChat!,
                            )));
              },
              child: ButtonCard(
                name: chatmodel[index].name,
                icon: Icons.person,
              ))),
    );
  }
}
