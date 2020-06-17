import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

Widget aappBar() {
  return AppBar(
    elevation: 0,
    title: Image.asset(
      "assets/images/logo.png",
      height: 70,
      width: 220,
    ),
  );
}

TextStyle Simplestyle() {
  return TextStyle(color: Colors.white);
}

InputDecoration decoratiofield(String hint) {
  return InputDecoration(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
    hintText: hint,
    hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
  );
}

Widget containerbutton(BuildContext context, Color color, Text text) {
  return Container(
      child: Center(
        child: text,
      ),
      margin: EdgeInsets.only(right: 10, left: 10),
      width: MediaQuery.of(context).size.width,
      height: 60,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Theme.of(context).accentColor,Colors.black38]),
        borderRadius: BorderRadius.circular(50),
        color: color,
      ));
}
