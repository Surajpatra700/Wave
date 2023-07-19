import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:wave_chat/colors/colors.dart';

class OwnMessageCard extends StatefulWidget {
  const OwnMessageCard({super.key});

  @override
  State<OwnMessageCard> createState() => _OwnMessageCardState();
}

class _OwnMessageCardState extends State<OwnMessageCard> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width -50,
      ),
      child: Card(
        color: AppColor.primaryColor,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 15,
                right: 30,
                top: 5,
                bottom: 20,
              ),
              child: Text("Hey",style: TextStyle(fontSize: 16),),
            ),
            Positioned(
              bottom: 4,
              right: 10,
              child: Row(
              children: [
                Text("20:58",style: TextStyle(fontSize: 12),),
                Icon(Icons.done_all),
              ],
            ))
          ],
        ),
      ),
      ),
    );
  }
}