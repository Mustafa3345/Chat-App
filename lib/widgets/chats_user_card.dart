import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/chat_user.dart';

class ChatUsercard extends StatefulWidget {
  const ChatUsercard({super.key, required this.user});

  final ChatUser user;

  @override
  State<ChatUsercard> createState() => _ChatUsercardState();
}

class _ChatUsercardState extends State<ChatUsercard> {
  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;
    return Card(
      margin: EdgeInsets.symmetric(horizontal: mq.width * .04, vertical: 4),
      //color: Colors.blue.shade100,
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () {},
        child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(mq.height * .3),
              child: CachedNetworkImage(
                imageUrl: widget.user.image,
                width: mq.height * .055,
                height: mq.height * .055,
                errorWidget: (context, url, error) => const CircleAvatar(
                  child: Icon(Icons.person_3_rounded),
                ),
              ),
            ),
            title: Text(widget.user.name),
            subtitle: Text(
              widget.user.about,
              maxLines: 1,
            ),
            trailing: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                  color: Colors.lightGreenAccent.shade400,
                  borderRadius: BorderRadius.circular(10)),
            )

            //  trailing: const Text(
            //  '12:00 PM  ',
            //  style: TextStyle(color: Colors.black54),
            //   ),

            ),
      ),
    );
  }
}
