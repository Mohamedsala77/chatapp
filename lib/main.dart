import 'package:flutter/material.dart';
import 'package:flutterchatapp/view/Authentcation.dart';
import 'package:flutterchatapp/view/Chats.dart';
import 'package:flutterchatapp/view/SignUp.dart';
import 'package:flutterchatapp/view/Signin.dart';
import 'package:flutterchatapp/widgets/widget.dart';

void main() => runApp(MaterialApp(home: DD(),
debugShowCheckedModeBanner: false,
theme: ThemeData(
    primaryColor: Color(0xff145C9E),
  scaffoldBackgroundColor: Colors.grey.shade900,
  accentColor: Color(0xff007EF4),
  fontFamily: "Overpass",
),
));

class DD extends StatefulWidget {
  @override
  _DDState createState() => _DDState();
}

class _DDState extends State<DD> {
  @override
  Widget build(BuildContext context) {
    return Container(
    child:  Auth(),
    );
  }
}
