// ignore_for_file: prefer_const_constructors, sort_child_properties_last, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wave_chat/colors/colors.dart';
import 'package:wave_chat/model/chatModel.dart';

class ContactCard extends StatefulWidget {
  const ContactCard({super.key, required this.chatModel});
  final ChatModel chatModel;

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 23,
              child: SvgPicture.asset(
                "assets/svg/person.svg",
                color: Colors.white,
                height: 30,
                width: 30,
              ),
              backgroundColor: Colors.blueGrey[200],
            ),
      
            widget.chatModel.select? Positioned(
              bottom: 4,
              right: 5,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: AppColor.primaryColor,
                child: Icon(Icons.check,color: Colors.white,size: 18),
              ),
            ) : Container(),
          ],
        ),
      ),
      title: Text(
        widget.chatModel.name!,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        widget.chatModel.status!,
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
      ),
    );
  }
}
