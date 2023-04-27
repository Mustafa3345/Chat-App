import 'package:chat_application/Screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_core/firebase_core.dart'
    show Firebase, FirebaseOptions;

import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // SystemChrome.setPreferredOrientations(
  //         [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
  //     .then((value) => _initializeFirebase());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat Application',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              elevation: 1,
              iconTheme: IconThemeData(color: Colors.black),
              centerTitle: true,
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 20),
              backgroundColor: Colors.white)),
      home: const splashscreen(),
    );
  }
}
