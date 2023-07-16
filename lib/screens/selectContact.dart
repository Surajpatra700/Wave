// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:wave_chat/colors/colors.dart';
import 'package:wave_chat/customUi/buttonCard.dart';
import 'package:wave_chat/customUi/contactCard.dart';
import 'package:wave_chat/model/chatModel.dart';
import 'package:wave_chat/screens/createGroup.dart';

class Selectcontact extends StatefulWidget {
  const Selectcontact({super.key});

  @override
  State<Selectcontact> createState() => _SelectcontactState();
}

class _SelectcontactState extends State<Selectcontact> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> contacts = [
      ChatModel(
        name: "Suraj Patra",
        status: "Full stack Developer",
      ),
      ChatModel(
        name: "Samrat Kumar Pattnayak",
        status: "MERN stack Developer",
      ),
      ChatModel(
        name: "Samarjeet Singh",
        status: "Frontend developer",
      ),
      ChatModel(
        name: "Satya Prakash Sahu",
        status: "BlockChain Developer",
      ),
    ];
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: AppBar(
            backgroundColor: AppColor.primaryColor,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select Contact",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                ),
                Text(
                  "Select Contact",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 25)),
              PopupMenuButton(
                  onSelected: (value) {
                    print(value);
                  },
                  icon: Icon(Icons.more_vert, size: 25, color: Colors.white),
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem(
                        child: Text("Invite a friend"),
                        value: 1,
                      ),
                      PopupMenuItem(
                        child: Text("Contacts"),
                        value: 2,
                      ),
                      PopupMenuItem(
                        child: Text("Refresh"),
                        value: 3,
                      ),
                      PopupMenuItem(
                        child: Text("Help"),
                        value: 4,
                      ),
                    ];
                  }),
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: (contacts.length) + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return InkWell(
                  onTap: () {
                    Get.to(CreateGroup());
                  },
                  child: ButtonCard(
                    icon: Icons.group,
                    name: "New group",
                  ));
            } else if (index == 1) {
              return ButtonCard(
                icon: Icons.person_add,
                name: "New contact",
              );
            }
            return ContactCard(
              chatModel: contacts[index - 2],
            );
          },
        ));
  }
}
