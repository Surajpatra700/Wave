// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_import, implementation_imports

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wave_chat/customUi/ownMessageCard.dart';
import 'package:wave_chat/customUi/replyCard.dart';
import 'package:wave_chat/model/chatModel.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class IndivisualPage extends StatefulWidget {
  IndivisualPage({super.key, required this.chatModel});
  final ChatModel chatModel;

  @override
  State<IndivisualPage> createState() => _IndivisualPageState();
}

class _IndivisualPageState extends State<IndivisualPage> {
  final messageController = TextEditingController();
  bool show = false;
  FocusNode focusNode = FocusNode();
  late IO.Socket socket;
  String? id;
  bool sendButton = false;

  @override
  void initState() {
    super.initState();
    connect();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  void connect() {
    socket = IO.io("http://192.168.154.216:6000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    socket.emit("test", "Hello Suraj");
    // socket.onconnect((_) {
    //   print("Connected");
    // });
    print(socket.connected);
  }

  @override
  Widget build(BuildContext context) {
    //final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Image.asset(
          "assets/images/bg.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
          colorBlendMode: BlendMode.colorBurn,
          opacity: const AlwaysStoppedAnimation(.55),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(65),
            child: AppBar(
              backgroundColor: Color(0xff819ff3),
              leadingWidth: 80,
              leading: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.white.withOpacity(0.2),
                      child: SvgPicture.asset(widget.chatModel.isGroup == true
                          ? "assets/svg/group.svg"
                          : "assets/svg/person.svg"),
                    ),
                  ],
                ),
              ),
              title: InkWell(
                onTap: () {},
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.chatModel.name!,
                        style: TextStyle(
                            fontSize: 17.8, fontWeight: FontWeight.w600),
                      ),
                      //Text("last seen at 12:05",style: TextStyle(fontSize: 18.5,fontWeight: FontWeight.w600), ),
                    ],
                  ),
                ),
              ),
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.call)),
                IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
                PopupMenuButton(
                    onSelected: (value) {
                      print(value);
                    },
                    icon: Icon(Icons.more_vert, size: 25, color: Colors.white),
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(
                          child: Text("View contact"),
                          value: 1,
                        ),
                        PopupMenuItem(
                          child: Text("Media, links and docs"),
                          value: 2,
                        ),
                        PopupMenuItem(
                          child: Text("Search"),
                          value: 3,
                        ),
                        PopupMenuItem(
                          child: Text("Mute notifications"),
                          value: 4,
                        ),
                        PopupMenuItem(
                          child: Text("wallpaper"),
                          value: 5,
                        ),
                      ];
                    }),
              ],
            ),
          ),
          // ************** BODY ******************************
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: WillPopScope(
              onWillPop: () {
                if (show) {
                  setState(() {
                    show = false;
                  });
                } else {
                  Navigator.pop(context);
                }
                return Future.value(false);
              },
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 155,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                    left: 5, right: 2, bottom: 8),
                                width: w - 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.white),
                                child: TextFormField(
                                  onChanged: (value) {
                                    if (value.length > 0) {
                                      setState(() {
                                        sendButton = true;
                                      });
                                    }else{
                                       setState(() {
                                        sendButton = false;
                                      });
                                    }
                                  },
                                  focusNode: focusNode,
                                  controller: messageController,
                                  textAlignVertical: TextAlignVertical.center,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 5,
                                  minLines: 1,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    hintText: "Message..",
                                    contentPadding: EdgeInsets.all(5),
                                    prefixIcon: IconButton(
                                        onPressed: () {
                                          focusNode.unfocus();
                                          focusNode.canRequestFocus = false;
                                          setState(() {
                                            show = !show;
                                          });
                                        },
                                        icon: Icon(Icons.emoji_emotions)),
                                    suffixIcon: SpeedDial(
                                      overlayColor: Colors.black12,
                                      childrenButtonSize: Size(60, 60),
                                      backgroundColor: Color(0xff819ff3),
                                      mini: true,
                                      spacing: 14,
                                      spaceBetweenChildren: 12,
                                      buttonSize: Size(30, 30),
                                      animatedIcon: AnimatedIcons.list_view,
                                      children: [
                                        SpeedDialChild(
                                            onTap: () {},
                                            label: "gallery",
                                            labelBackgroundColor:
                                                Colors.grey.shade200,
                                            child: Icon(Icons.photo,
                                                color: Colors.white),
                                            backgroundColor: Color.fromARGB(
                                                255, 122, 69, 214)),
                                        SpeedDialChild(
                                            onTap: () {},
                                            label: "camera",
                                            labelBackgroundColor:
                                                Colors.grey.shade200,
                                            child: Icon(Icons.camera,
                                                color: Colors.white),
                                            backgroundColor: Color.fromARGB(
                                                255, 181, 111, 7)),
                                        SpeedDialChild(
                                            onTap: () {},
                                            label: "location",
                                            labelBackgroundColor:
                                                Colors.grey.shade200,
                                            child: Icon(Icons.location_on,
                                                color: Colors.white),
                                            backgroundColor: Color.fromARGB(
                                                255, 12, 164, 17)),
                                        SpeedDialChild(
                                            onTap: () {},
                                            label: "document",
                                            labelBackgroundColor:
                                                Colors.grey.shade200,
                                            child: Icon(Icons.document_scanner),
                                            backgroundColor:
                                                Colors.grey.shade300),
                                      ],
                                    ),
                                  ),
                                )),
                            //),
                            Padding(
                              padding: EdgeInsets.only(bottom: 8.0, left: 4),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Color(0xff819ff3),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      sendButton? Icons.send: Icons.mic,
                                      color: Colors.white,
                                    )
                                    ),
                              ),
                            ),
                          ],
                        ),
                        show ? emojiSelect() : Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget emojiSelect() {
    return EmojiPicker(
      onEmojiSelected: (Category? category, Emoji emoji) {
        print(emoji);
      },
      onBackspacePressed: () {},
    );
  }
}
