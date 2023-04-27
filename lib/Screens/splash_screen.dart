import 'dart:developer';

import 'package:chat_application/Screens/auth/login_screen.dart';
import 'package:chat_application/Screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../api/apis.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
      if (APIs.auth.currentUser != null) {
        log('\nUser: ${FirebaseAuth.instance.currentUser}');
        //navigate to home screen
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const HomeScreen()));
      } else {
        //navigate to login screen
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const loginscreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: mq.height * .36,
              right: mq.width * .25,
              width: mq.width * .5,
              child: Image.asset('images/ic_launcher.png')),
          Positioned(
              bottom: mq.height * .15,
              width: mq.width,
              height: mq.height,
              child: const Text(
                'BY PAKISTANI DEVELOPER 🇵🇰',
                textAlign: TextAlign.center,
                style: TextStyle(
                    letterSpacing: .5, fontSize: 16, color: Colors.black87),
              )),
        ],
      ),
    );
  }
}
