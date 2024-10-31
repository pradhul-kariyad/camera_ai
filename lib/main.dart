// ignore_for_file: unused_import
import 'package:camera/camera.dart';
import 'package:camera_ai/views/home/home.dart';
import 'package:camera_ai/views/mainPage.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final camera = await availableCameras();
  runApp(MyApp(
    cameras: camera,
  ));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;
  const MyApp({super.key, required this.cameras});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(cameras: cameras),
    );
  }
}
