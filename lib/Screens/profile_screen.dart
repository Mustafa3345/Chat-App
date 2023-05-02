import 'dart:core';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_application/models/chat_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
          child: FloatingActionButton.extended(
            backgroundColor: Colors.red,
            onPressed: () async {
              APIs.auth.signOut();

              await FirebaseAuth.instance.signOut();
              await GoogleSignIn().signOut();
            },
            icon: Icon(Icons.add_comment_rounded),
            label: Text('logOut'),
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
              Text(widget.user.email,
                  style: TextStyle(color: Colors.black54, fontSize: 16)),
              SizedBox(height: mq.height * .05),
              TextFormField(
                initialValue: widget.user.name,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person_2_rounded,
                      color: Colors.blue,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    hintText: 'e.g Name Or Email',
                    label: const Text('Name')),
              ),
              SizedBox(height: mq.height * .02),
              TextFormField(
                initialValue: widget.user.about,
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.info,
                      color: Colors.blue,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    hintText: 'e.g Current Mood ',
                    label: const Text('About')),
              ),
              SizedBox(height: mq.height * .05),
              Builder(builder: (context) {
                return ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.edit),
                    label: Text('Update'));
              })
            ],
          ),
        ));
  }

  googleSignIn() async {}
}
