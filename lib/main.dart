
import 'package:camera/camera.dart';
import 'package:chat_application/Screens/CameraScreen.dart';
import 'package:chat_application/Screens/Homescreen.dart';
import 'package:flutter/material.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
       
        primaryColor:  const Color.fromARGB(255, 8, 71, 64),
      ),
      home:const Homescreen(),
    );
    


  }
}
