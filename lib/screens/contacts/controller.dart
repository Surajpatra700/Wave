// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:wave_chat/managements/storage/users.dart';
// import 'package:wave_chat/screens/contacts/state.dart';

// class ContactController extends GetxController {
//   ContactController();
//   //final title = "ChatWave";
//   final state = ContactState();
//   final token = UserStore.to.token;

//   @override
//   void onReady() async {
//     super.onReady();
//     asyncLoadAllData();
//   }

// // THIS FUNCTION HELPS IN CONVERSATION BETWEEN TWO USERS
//   // goChat(UserData to_userdata) async {
//   //   var from_messages = await db
//   //       .collection("message")
//   //       .withConverter(
//   //         fromFirestore: Msg.fromFirestore,
//   //         toFirestore: (Msg msg, options) => msg.toFirestore(),
//   //       )
//   //       .where("from_uid", isEqualTo: token)
//   //       .where("to_uid", isEqualTo: to_userdata.id)
//   //       .get();

//   //   var to_messages = await db
//   //       .collection("message")
//   //       .withConverter(
//   //         fromFirestore: Msg.fromFirestore,
//   //         toFirestore: (Msg msg, options) => msg.toFirestore(),
//   //       )
//   //       .where("from_uid", isEqualTo: to_userdata.id)
//   //       .where("to_uid", isEqualTo: token)
//   //       .get();

//   //   // FOR THE 1ST TIME CONVERSATION OF 2 USERS
//   //   if (from_messages.docs.isEmpty && to_messages.docs.isEmpty) {
//   //     String profile = await UserStore.to.getProfile();
//   //     UserLoginResponseEntity userdata =
//   //         UserLoginResponseEntity.fromJson(json.decode(profile));
//   //     var msgdata = Msg(
//   //       from_uid: userdata.accessToken!,
//   //       to_uid: to_userdata.id!,
//   //       from_name: userdata.displayName!,
//   //       to_name: to_userdata.name!,
//   //       from_avatar: userdata.photoUrl!,
//   //       to_avatar: to_userdata.photourl!,
//   //       last_msg: "",
//   //       last_time: Timestamp.now(),
//   //       msg_num: 0,
//   //     );
//   //     db
//   //         .collection("message")
//   //         .withConverter(
//   //           fromFirestore: Msg.fromFirestore,
//   //           toFirestore: (Msg msg, options) => msg.toFirestore(),
//   //         )
//   //         .add(msgdata)
//   //         .then((value) {
//   //       Get.toNamed("/chat", parameters: {
//   //         "doc_id": value.id,
//   //         "to_uid": to_userdata.id ?? "",
//   //         "to_name": to_userdata.name ?? "",
//   //         "to_avatar": to_userdata.photourl?? "",
//   //       });
//   //     });
//   //   } else {
//   //     // IF USER HAS SOME DATA THIS WILL CALL THIS
//   //     if (from_messages.docs.isNotEmpty) {
//   //       Get.toNamed("/chat", parameters: {
//   //         "doc_id": from_messages.docs.first.id,
//   //         "to_uid": to_userdata.id ?? "",
//   //         "to_name": to_userdata.name ?? "",
//   //         "to_avatar": to_userdata.photourl ?? "",
//   //       });
//   //     }
//   //     // IF THE RECIEPANT HAS SOME DATA THEN THIS METHOD WILL CALL THIS
//   //     if (to_messages.docs.isNotEmpty) {
//   //       Get.toNamed("/chat", parameters: {
//   //         "doc_id": to_messages.docs.first.id,
//   //         "to_uid": to_userdata.id ?? "",
//   //         "to_name": to_userdata.name ?? "",
//   //         "to_avatar": to_userdata.photourl ?? "",
//   //       });
//   //     }
//   //   }
//   // }

//   asyncLoadAllData() async {
//     var userbase = await db
//         .collection("users")
//         .where("id", isNotEqualTo: token)
//         .withConverter(
//           fromFirestore: UserData.fromFirestore,
//           toFirestore: (UserData userdata, options) => userdata.toFirestore(),
//         )
//         .get();

//     for (var doc in userbase.docs) {
//       state.contactList.add(doc.data());
//     }
//   }
// }
