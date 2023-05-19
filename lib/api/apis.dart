import 'package:chat_application/models/chat_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class APIs {
  // For authentication
  static FirebaseAuth auth = FirebaseAuth.instance;
  // for Accessing Cloud Fire Store database
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  // ignore: prefer_typing_uninitialized_variables
  static var chatUser;

  // to return currrent user
  static User get user => auth.currentUser!;

  // For Chehcking if user exists or not ?
  static Future<bool> userExists() async {
    return (await firestore.collection('users').doc(user.uid).get()).exists;
  }

  static createUser() async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();

    // Retrieve the current user
    final currentUser = auth.currentUser;

    if (currentUser != null) {
      final user = ChatUser(
        id: currentUser.uid,
        name: currentUser.displayName.toString(),
        about: 'hey I am using Chat Application',
        lastactive: time,
        pushToken: '',
        createAt: time,
        email: 'shajee.tech@gmail.com',
        isOnline: false,
        image: currentUser.photoURL.toString(),
      );

      return await firestore.collection('users').add(user.toJson());
    } else {
      throw Exception("User is null");
    }
  }
}
