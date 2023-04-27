import 'package:flutter/material.dart';





class Dialogs{

  static void showSnackbar (BuildContext context, String s){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text("Something Went Worng "), backgroundColor: Colors.blue.withOpacity(.8), 
    behavior: SnackBarBehavior.floating,));
}
 static void showProgressbar (BuildContext context, String msg){
  
  showDialog(context: context, builder: (_) =>  const Center(child: CircularProgressIndicator()));

 }
} 