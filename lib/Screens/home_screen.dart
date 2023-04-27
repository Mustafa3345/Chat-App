import 'dart:core';

import 'package:chat_application/Screens/profile_screen.dart';
import 'package:chat_application/models/chat_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import '../api/apis.dart';
import '../widgets/chats_user_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List list = [];

  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: const Text('Chat Application'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ProfileScreen(
                              user: list[0],
                              userExists: null,
                            )));
              },
              icon: const Icon(Icons.more_vert_outlined))
        ],
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
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (BuildContext context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:

              case ConnectionState.none:
                return const Center(child: CircularProgressIndicator());

              case ConnectionState.active:

              case ConnectionState.done:
                if (snapshot.hasData) {
                  final data = snapshot.data?.docs;
                  for (var i in data!) {
                    list.length;
                    list = data
                            ?.map((e) => ChatUser.fromJson(i.data()))
                            .toList() ??
                        [];
                  }

                  if (!list.isNotEmpty) {
                    return const Center(
                      child: Text(
                        'No Connections Found',
                        style: TextStyle(fontSize: 20),
                      ),
                    );
                  } else {
                    return snapshot.hasData
                        ? ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            padding: EdgeInsets.only(top: mq.height * .01),
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, index) {
                              return ChatUsercard(user: list[index]);
                            })
                        : const CircularProgressIndicator();
                  }
                }
            }

            return CircularProgressIndicator();
          }),
    );
  }

  googleSignIn() async {}
}
