import 'package:flutter/material.dart';
import 'package:flutterchatapp/view/Signin.dart';
import 'package:flutterchatapp/widgets/widget.dart';

import 'search.dart';

class Chatroom extends StatefulWidget {
  @override
  _ChatroomState createState() => _ChatroomState();
}

class _ChatroomState extends State<Chatroom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .scaffoldBackgroundColor,
      appBar: aappBar(),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Searchscrean()));
      },child: Icon(Icons.search),),
    );
  }
}
