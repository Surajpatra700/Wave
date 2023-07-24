// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wave_chat/colors/colors.dart';
import 'package:wave_chat/customUi/avatarCard.dart';
import 'package:wave_chat/customUi/buttonCard.dart';
import 'package:wave_chat/customUi/contactCard.dart';
import 'package:wave_chat/model/chatModel.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
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

  List<ChatModel> group = [];

  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                  "New Group",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                ),
                Text(
                  "Add participants",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            actions: [
              AnimSearchBar(
                width: 300,
                textController: nameController,
                color: Color(0xff819ff3),
                boxShadow: false,
                animationDurationInMilli: 300,
                searchIconColor: Colors.white,
                //autoFocus: true,
                onSuffixTap: () {
                  setState(() {
                    nameController.clear();
                  });
                },
                onSubmitted: (value) {},
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            ListView.builder(
              itemCount: (contacts.length) + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    height: (group.length > 0) ? 90 : 10,
                  );
                }
                return InkWell(
                  onTap: () {
                    if (contacts[index-1].select == false) {
                      setState(() {
                        contacts[index-1].select = true;
                        group.add(contacts[index-1]);
                      });
                    } else {
                      setState(() {
                        contacts[index-1].select = false;
                        group.remove(contacts[index-1]);
                      });
                    }
                  },
                  child: ContactCard(
                    chatModel: contacts[index -1],
                  ),
                );
              },
            ),
            (group.length > 0)
                ? Column(
                    children: [
                      Container(
                        height: 75,
                        color: Colors.white,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: contacts.length,
                            itemBuilder: (context, index) {
                              if (contacts[index].select == true) {
                                return InkWell(
                                    onTap: () {
                                      setState(() {
                                        group.remove(contacts[index]);
                                        contacts[index].select = false;
                                      });
                                    },
                                    child: AvatarCard(
                                      contact: contacts[index],
                                    ));
                              } else {
                                return Container();
                              }
                            }),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                    ],
                  )
                : Container(),
          ],
        ));
  }
}
