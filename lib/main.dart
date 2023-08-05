// ignore_for_file: prefer_const_constructors

import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_chat/managements/bindings/bindings.dart';
import 'package:wave_chat/managements/dBHelper/mongoDb.dart';
import 'package:wave_chat/managements/services/splashScreen.dart';
import 'package:wave_chat/screens/cameraScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  await Firebase.initializeApp();
  await Global.init();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff819ff3),
        //secondaryHeaderColor: Color(0xffb06ab3),
        //android:usesCleartextTraffic="true">
        // b06ab3
      ),
      home: SplashScreen(),
    );
  }
}