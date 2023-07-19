import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:wave_chat/colors/colors.dart';

class DisplayPictureScreen extends StatefulWidget {
  final String imagePath;
  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  State<DisplayPictureScreen> createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.black,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.crop_rotate,size: 27,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.emoji_emotions_outlined)),
          IconButton(onPressed: (){}, icon: Icon(Icons.title,size: 27,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.edit,size: 27,)),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 130,
              child: Image.file(File(widget.imagePath),fit: BoxFit.cover,)),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: AppColor.black,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                child: TextFormField(  
                  maxLines: 5,
                  minLines: 1,   
                  style: TextStyle(color: Colors.white, fontSize: 17),          
                  decoration: InputDecoration(
                    hintText: "Add Caption...",
                    filled: true,
                    fillColor: AppColor.black,
                    hintStyle: TextStyle(color: Colors.white, fontSize: 17),
                    suffixIcon: CircleAvatar(
                      radius: 10,
                      backgroundColor: AppColor.primaryColor,
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.send, color: Colors.white,)))
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
