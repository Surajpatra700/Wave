// ignore_for_file: prefer_const_constructors, sort_child_properties_last, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wave_chat/colors/colors.dart';
import 'package:wave_chat/model/chatModel.dart';

class ButtonCard extends StatefulWidget {
  const ButtonCard({super.key, this.name, this.icon});
  final String? name;
  final IconData? icon;

  @override
  State<ButtonCard> createState() => _ButtonCardState();
}

class _ButtonCardState extends State<ButtonCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          radius: 23,
          child: Icon(widget.icon,color: Colors.white,),
          backgroundColor: AppColor.primaryColor,
        ),
        title: Text(
          widget.name!,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      );
  }
}
