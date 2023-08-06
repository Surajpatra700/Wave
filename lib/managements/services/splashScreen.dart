import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:wave_chat/colors/colors.dart';
import 'package:wave_chat/homeScreen.dart';
import 'package:wave_chat/screens/logintest.dart';
import 'package:wave_chat/screens/signUpScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashServices = SplashServices();
  @override
  void initState() {
    super.initState();
    splashServices.control();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.transparent,
            image:
                DecorationImage(image: AssetImage("assets/images/applogo.jpg")),
          ),
        ),
      ),
    );
  }
}

class SplashServices {
  final auth = FirebaseAuth.instance;

  final login = LoginScreen();
  void control() {
    if (auth.currentUser != null) {
      Timer(Duration(seconds: 3), () => Get.to(LoginScreen()));
    } else {
      Get.to(SignUpScreen());
      //Get.to(LoginScreen());
    }
  }
}
