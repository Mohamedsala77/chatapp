import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterchatapp/services/Auth.dart';
import 'package:flutterchatapp/widgets/widget.dart';

import 'Chats.dart';

class Sign_In extends StatefulWidget {
  final Function Log;
   Sign_In( {this.Log});
  @override
  _Sign_InState createState() => _Sign_InState();
}
class _Sign_InState extends State<Sign_In> {
  Authentcation authentcation=Authentcation();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailcomtrolar = TextEditingController();
  final TextEditingController pascControllar = TextEditingController();
  void validate()async{
    if(formKey.currentState.validate()){
      await authentcation.Signinwithemailandpassword(emailcomtrolar.text, pascControllar.text).then((onValue){
        if(onValue != null) {
          print(onValue.toString());
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Chatroom()));
        }
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: aappBar(),
      body: Container(
        child: Center(
            child: new SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height/3.5,
              ),
              new Container(
                  child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        cursorColor: Colors.grey,
                        style: Simplestyle(),
                        controller: emailcomtrolar,
                        validator: (val) {
                          return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val)?null:
                              "please enter your email";
                        },
                        decoration: decoratiofield("Email"),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        obscureText: true,
                        style: Simplestyle(),
                        controller: pascControllar,
                        validator: (val) {
                          return val.isEmpty?"please enter your password":null;
                        },
                        decoration: decoratiofield("password"),
                      )
                    ],
                  ),
                ),
              )),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      child: Text("forgot password?  ",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  validate();
                },
                child:containerbutton(context,Theme.of(context).accentColor,
                    Text("Sign in",style: TextStyle(color: Colors.white, fontSize: 25))
                )
              ),
              SizedBox(
                height: 15,
              ),

              GestureDetector(
                  onTap: () {
                  },
                  child:containerbutton(context,Colors.white,
                      Text("Sign in with google",style: TextStyle(color: Colors.white, fontSize: 20))
                  )
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Don’t have account? ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            )),
                        GestureDetector(
                          onTap: () {
                            widget.Log();
                          },
                          child: Text(
                            "Register now ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                decoration: TextDecoration.underline),
                          ),
                        ),

                      ],
                    ),
                  )), SizedBox(
                height: 15,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
