// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wave_chat/managements/dBHelper/mongoDb.dart';
import 'package:wave_chat/managements/entity/user.dart';

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  BuildListItem(UserLoginResponseEntity item) {
    return Container(
      padding: EdgeInsets.only(top: 15, left: 15, right: 15),
      child: InkWell(
        onTap: () {
          // if (item.id != null) {
          //   controller.goChat(item);
          // }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 0, left: 0, right: 15),
              child: SizedBox(
                width: 50,
                height: 50,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(45),
                    child: CachedNetworkImage(imageUrl: "${item.photoUrl}")),
              ),
            ),
            Container(
              width: 250,
              padding: EdgeInsets.only(top: 15, left: 0, right: 0, bottom: 0),
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(width: 1, color: Color(0xffe5efe5)),
              )),
              child: Row(
                children: [
                  SizedBox(
                    width: 200,
                    height: 42,
                    child: Text(
                      item.displayName.isNotEmpty ? item.displayName : "",
                      style: TextStyle(
                          fontFamily: "Avenir",
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // return Obx(
    //   () => CustomScrollView(
    //     slivers: [
    //       SliverPadding(
    //         padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
    //         sliver: SliverList(
    //           delegate: SliverChildBuilderDelegate((context, index) {
    //             var item = controller.state.contactList[index];
    //             return BuildListItem(item);
    //           }, childCount: controller.state.contactList.length),
    //         ),
    //       ),
    //     ],
    //   ),
    // );

    return FutureBuilder(
        future: MongoDatabase.getData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasData) {
              var totalData = snapshot.data.length;
              print("Total Data" + totalData.toString());
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return BuildListItem(
                        UserLoginResponseEntity.fromJson(snapshot.data[index]));
                  });
            } else {
              return Center(
                child: Text("No contacts found"),
              );
            }
          }
        });
  }
}
