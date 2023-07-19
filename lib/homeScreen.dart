// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_import

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:wave_chat/page/chatpage.dart';
import 'package:wave_chat/screens/cameraPage.dart';
import 'package:wave_chat/screens/cameraScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final nameController = TextEditingController();
  int _index = 0;
  PageController pageController = PageController();

  List screens = [
    Chatpage(),
    CameraScreen(),
    Center(child: Text("Status")),
    Center(child: Text("Calls")),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Color(0xff819ff3),
          title: Text(
            'Wave',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
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
            // IconButton(
            //     onPressed: () {},
            //     icon: Icon(
            //       Icons.search,
            //       color: Colors.white,
            //       size: 25,
            //     )),
            PopupMenuButton(
                onSelected: (value) {
                  print(value);
                },
                icon: Icon(Icons.more_vert, size: 25, color: Colors.white),
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      child: Text("New group"),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: Text("New Broadcast"),
                      value: 2,
                    ),
                    PopupMenuItem(
                      child: Text("Whatsapp web"),
                      value: 3,
                    ),
                    PopupMenuItem(
                      child: Text("Starred messages"),
                      value: 4,
                    ),
                    PopupMenuItem(
                      child: Text("Settings"),
                      value: 5,
                    ),
                  ];
                }),
          ],
        ),
      ),
      body: PageView.builder(
          itemCount: 4,
          controller: pageController,
          onPageChanged: (page) {
            setState(() {
              _index = page;
            });
          },
          itemBuilder: (context, position) {
            return Container(
              child: screens[position],
            );
          }),
      bottomNavigationBar: SafeArea(
        child: Container(
          color: Color(0xff819ff3),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
            child: GNav(
              curve: Curves.fastOutSlowIn,
              duration: Duration(milliseconds: 350),
              backgroundColor: Color(0xff819ff3),
              tabBackgroundColor: Color.fromARGB(255, 104, 129, 199),
              padding: EdgeInsets.all(16),
              color: Colors.white,
              activeColor: Colors.white,
              gap: 8,
              tabs: [
                GButton(
                  icon: Icons.message,
                  text: 'chats',
                  iconActiveColor: Colors.white,
                  iconColor: Colors.white70,
                ),
                GButton(
                  icon: Icons.camera,
                  text: 'camera',
                  iconActiveColor: Colors.white,
                  iconColor: Colors.white70,
                ),
                GButton(
                  icon: Icons.person,
                  text: 'status',
                  iconActiveColor: Colors.white,
                  iconColor: Colors.white70,
                ),
                GButton(
                  icon: Icons.call,
                  text: 'calls',
                  iconActiveColor: Colors.white,
                  iconColor: Colors.white70,
                ),
              ],
              selectedIndex: _index,
              onTabChange: (index) {
                setState(() {
                  _index = index;
                });
                pageController.jumpToPage(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
