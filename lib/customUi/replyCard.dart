// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:wave_chat/colors/colors.dart';

class ReplyCard extends StatefulWidget {
  const ReplyCard({super.key});

  @override
  State<ReplyCard> createState() => _ReplyCardState();
}

class _ReplyCardState extends State<ReplyCard> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width -70,
      ),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        //color: AppColor.primaryColor,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 12,
                right: 20,
                top: 5,
                bottom: 20,
              ),
              child: Text("Hey there am using Wave",style: TextStyle(fontSize: 15.5),),
            ),
            Positioned(
              bottom: 2,
              right: 10,
              child: Row(
              children: [
                Text("20:58",style: TextStyle(fontSize: 12),),
                
                // Padding(
                //   padding: const EdgeInsets.only(left: 4.0),
                //   child: Icon(Icons.done_all,color: Color.fromARGB(255, 2, 105, 6),),
                // ),
              ],
            ))
          ],
        ),
      ),
      ),
    );
  }
}