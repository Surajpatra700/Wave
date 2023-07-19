// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wave_chat/colors/colors.dart';
import 'package:wave_chat/model/chatModel.dart';

class AvatarCard extends StatefulWidget {
  const AvatarCard({super.key, required this.contact});
  final ChatModel contact;

  @override
  State<AvatarCard> createState() => _AvatarCardState();
}

class _AvatarCardState extends State<AvatarCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8.0),
      child: Column(
        children: [
          Stack(
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
              Positioned(
                bottom: 4,
                right: 5,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.clear, color: Colors.white, size: 15),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            widget.contact.name!,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
