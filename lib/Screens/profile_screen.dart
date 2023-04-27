import 'dart:convert';
import 'dart:core';
import 'dart:developer';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_application/models/chat_user.dart';

import 'package:flutter/material.dart';

import '../api/apis.dart';

class ProfileScreen extends StatefulWidget {
  final ChatUser user;

  const ProfileScreen({super.key, required this.user, required userExists});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile Screen'),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: FloatingActionButton(
            onPressed: () async {
              APIs.auth.signOut();
            },
            child: const Icon(Icons.add_comment_rounded),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: mq.width * .05),
          child: Column(
            children: [
              SizedBox(width: mq.width, height: mq.height * .03),
              ClipRRect(
                borderRadius: BorderRadius.circular(mq.height * .3),
                child: CachedNetworkImage(
                  imageUrl: widget.user.image,
                  fit: BoxFit.fill,
                  width: mq.height * .2,
                  height: mq.height * .2,
                  errorWidget: (context, url, error) => const CircleAvatar(
                    child: Icon(Icons.person_3_rounded),
                  ),
                ),
              ),
              SizedBox(height: mq.height * .03),
            ],
          ),
        ));
  }

  googleSignIn() async {}
}
