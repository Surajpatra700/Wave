import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wave_chat/indivisualPage.dart';
import 'package:wave_chat/model/chatModel.dart';

class CustomCard extends StatefulWidget {
  CustomCard({super.key, required this.chatModel});
  final ChatModel chatModel;


  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  // ChatModel chatModel = ChatModel();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    IndivisualPage(chatModel: widget.chatModel)));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: SvgPicture.asset(widget.chatModel.isGroup == true
                  ? "assets/svg/group.svg"
                  : "assets/svg/person.svg"),
            ),
            title: Text(
              widget.chatModel.name!,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(
                  width: 3,
                ),
                Text(
                  widget.chatModel.currentMessage!,
                  style: TextStyle(fontSize: 13),
                )
              ],
            ),
            trailing: Text(widget.chatModel.time!),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.0, left: 60),
            child: Divider(
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
