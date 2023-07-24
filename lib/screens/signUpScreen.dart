// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:wave_chat/customUi/buttonCard.dart';
// import 'package:wave_chat/homeScreen.dart';
// import 'package:wave_chat/model/chatModel.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   ChatModel? sourceChat;
//   List<ChatModel> chatmodels = [
//     ChatModel(
//       name: "Suraj Patra",
//       isGroup: false,
//       currentMessage: "Hi EveryOne",
//       time: "4:00",
//       icon: "person.svg",
//       id: 1,
//     ),
//     ChatModel(
//       name: "Sumit Kumar pattnaik",
//       isGroup: false,
//       currentMessage: "Hi EveryOne",
//       time: "4:30",
//       icon: "person.svg",
//       id: 2,
//     ),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//           itemCount: chatmodels.length,
//           itemBuilder: (context, index) {
//             InkWell(
//                 onTap: () {
//                   sourceChat = chatmodels.removeAt(index);
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => HomeScreen(
//                         chatmodels: chatmodels,
//                       )));
//                 },
//                 child: ButtonCard(
//                   name: chatmodels[index].name,
//                   icon: Icons.person,
//                 ));
//           }),
//     );
//   }
// }

// ignore_for_file: implementation_imports, unused_local_variable, non_constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wave_chat/homeScreen.dart';
import 'package:wave_chat/managements/dBHelper/mongoDb.dart';
import 'package:wave_chat/managements/entity/user.dart';
import 'package:wave_chat/managements/storage/users.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              GoogleSignIn googleSignIn = GoogleSignIn();
              final user = await googleSignIn.signIn();
              if (user != null) {
                final googleAuth = await user.authentication;
                final credentials = GoogleAuthProvider.credential(
                  idToken: googleAuth.idToken,
                  accessToken: googleAuth.accessToken,
                );
                await auth.signInWithCredential(credentials);
                String displayName = user.displayName ?? user.email;
                String email = user.email;
                String id = user.id;
                String photoUrl = user.photoUrl ?? "assets/images/bg.jpg";

                UserLoginResponseEntity userProfile = UserLoginResponseEntity(
                  accessToken: id,
                  email: email,
                  displayName: displayName,
                  photoUrl: photoUrl,
                );
                UserStore.to.saveProfile(userProfile);
                var userDetail = await MongoDatabase.insert(userProfile);
                Get.to(HomeScreen());
                // password: x9NA1RxqjlvOSQB8
                // username: SurajPatra
                // mongodb+srv://SurajPatra:<password>@cluster0.d3kgitd.mongodb.net/?retryWrites=true&w=majority
              }
            },
            child: Text("SignIn with google")),
      ),
    );
  }
}
