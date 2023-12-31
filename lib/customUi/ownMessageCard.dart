// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import

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
        maxWidth: MediaQuery.of(context).size.width -70,
      ),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: Color.fromARGB(255, 142, 199, 245),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 12,
                right: 20,
                top: 5,
                bottom: 20,
              ),
              child: Text("Hey there am using Wave can you please have a communication with me",style: TextStyle(fontSize: 15.5),),
            ),
            Positioned(
              bottom: 2,
              right: 10,
              child: Row(
              children: [
                Text("20:58",style: TextStyle(fontSize: 12),),
                
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Icon(Icons.done_all,color: Color.fromARGB(255, 2, 105, 6),),
                ),
              ],
            ))
          ],
        ),
      ),
      ),
    );
  }
}