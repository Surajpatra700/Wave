// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wave_chat/colors/colors.dart';
import 'package:wave_chat/screens/displayPictureScreen.dart';
import 'package:wave_chat/screens/videoview.dart';

List<CameraDescription>? cameras;

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  bool clicked = false;
  bool recording = false;
  CameraController? _cameraController;
  Future<void>? cameraValue;
  String path = "";
  bool flash = false;
  bool isCameraFront = true;
  double transform = pi;

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(cameras![0], ResolutionPreset.high);
    cameraValue = _cameraController!.initialize();
  }

  @override
  void dispose() {
    _cameraController!.dispose();
    super.dispose();
  }
  // void set() {
  //   CameraController(
  //       check ? cameras![0] : cameras![1], ResolutionPreset.medium);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: Stack(
        children: [
          Center(
            child: FutureBuilder(
                future: cameraValue,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return CameraPreview(_cameraController!);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100,
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              flash = !flash;
                            });
                            flash
                                ? _cameraController!
                                    .setFlashMode(FlashMode.torch)
                                : _cameraController!
                                    .setFlashMode(FlashMode.off);
                          },
                          icon: Icon(
                            flash ? Icons.flash_on : Icons.flash_off,
                            color: Colors.white,
                            size: 28,
                          )),
                      GestureDetector(
                        onLongPress: () async {
                          await cameraValue;
                          await _cameraController!.startVideoRecording();
                          setState(() {
                            recording = true;
                            //path = videoPath;
                          });
                          //await Get.to()
                        },
                        onLongPressUp: () async {
                          setState(() {
                            recording = false;
                          });
                          final videoPath =
                              await _cameraController!.stopVideoRecording();
                          await Get.to(
                              VideoViewScreen(videoPath: videoPath.path));
                        },
                        child: InkWell(
                          onTap: () async {
                            if (!recording) {
                              setState(() {
                                clicked = !clicked;
                              });
                              try {
                                await cameraValue;

                                final image =
                                    await _cameraController!.takePicture();
                                if (!mounted) return;
                                await Get.to(DisplayPictureScreen(
                                    imagePath: image.path));
                              } catch (e) {
                                print(e.toString());
                              }
                            }
                          },
                          child: recording
                              ? Icon(
                                  Icons.radio_button_on,
                                  color: Colors.red,
                                  size: 70,
                                )
                              : Icon(
                                  Icons.panorama_fish_eye,
                                  color: clicked
                                      ? AppColor.primaryColor
                                      : Colors.white,
                                  size: 70,
                                ),
                        ),
                      ),
                      IconButton(
                          onPressed: () async {
                            setState(() {
                              isCameraFront = !isCameraFront;
                              transform = transform + pi;
                            });
                            int cameraPos = isCameraFront ? 0 : 1;
                            _cameraController = CameraController(
                                cameras![cameraPos], ResolutionPreset.high);
                            cameraValue = _cameraController!.initialize();
                          },
                          icon: Transform.rotate(
                            angle: transform,
                            child: Icon(
                              Icons.flip_camera_ios,
                              color: Colors.white,
                              size: 28,
                            ),
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Text(
                      "Hold for video, tap for photo",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // void takePhoto() async {
  //   final path =
  //       join((await getTemporaryDirectory()).path, "${DateTime.now()}.png");
  //   await _cameraController!.takePicture(path);
  // }
}
