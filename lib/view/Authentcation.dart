import 'package:flutter/material.dart';
import 'package:flutterchatapp/view/SignUp.dart';
import 'package:flutterchatapp/view/Signin.dart';
class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool showSign=true;
void toogle(){
    setState(() {
      showSign= !showSign;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (showSign==true) {
      return Sign_In(Log: toogle,);
    } else {
      return SignUp(Log: toogle,);
    }  }
}
