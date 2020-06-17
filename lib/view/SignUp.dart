import 'package:flutter/material.dart';
import 'package:flutterchatapp/services/Auth.dart';
import 'package:flutterchatapp/services/dataBase.dart';
import 'package:flutterchatapp/view/Chats.dart';
import 'package:flutterchatapp/widgets/widget.dart';
class SignUp extends StatefulWidget {
 final Function Log;
  SignUp( {this.Log});
  @override
  _SignUpState createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {
  Authentcation authentcation=Authentcation();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailcomtrolar = TextEditingController();
  final TextEditingController pascControllar = TextEditingController();
  final TextEditingController usernamecomtrolar = TextEditingController();
Database database=Database();
bool isLoading=false;
  void validate() async{
    if(formKey.currentState.validate()){
      setState(() {
        isLoading=true;
      });
     await authentcation.Signupwithemailandpassword(emailcomtrolar.text, pascControllar.text).then((onvalue){
       if(onvalue != null){

         Map<String,String> userinfo={
           "name":usernamecomtrolar.text,
           "email":emailcomtrolar.text
         };
       database.uploaduder(userinfo);
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Chatroom()));
      }});
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: aappBar(

      ),
      body:isLoading ? Container(child: Center(child: CircularProgressIndicator(),),) :  Container(
        child: Center(
            child: new SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height/4.5,
                  ),
                  new Container(
                      child: Form(
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.only(left:20.0,right: 15,top: 15,bottom: 10),
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              TextFormField(
                                cursorColor: Colors.grey,
                                style: Simplestyle(),
                                controller: usernamecomtrolar,
                                validator:(val){
                                  return val.isEmpty || val.length < 3 ? "Enter Username 3+ characters" : null;
                                },
                                decoration: decoratiofield("Username"),
                              ),
                              TextFormField(
                                cursorColor: Colors.grey,
                                style: Simplestyle(),
                                controller: emailcomtrolar,
                                validator:  (val){
                        return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ?
                        null : "Enter correct email";
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
                                validator: (val){
                                  return val.length < 6 ? "Enter Password 6+ characters" : null;
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
                      onTap: () {
                        validate();
                      },
                      child:containerbutton(context,Theme.of(context).accentColor,
                          Text("Sign up",style: TextStyle(color: Colors.white, fontSize: 25))
                      )
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  GestureDetector(
                      onTap: () {},
                      child:containerbutton(context,Colors.white,
                          Text("Sign up with google",style: TextStyle(color: Colors.white, fontSize: 20))
                      )
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text("Already have account? ",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                )),
                            GestureDetector(
                              onTap: () {
                                widget.Log();
                              },
                              child: Text(
                                "login now",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    decoration: TextDecoration.underline),
                              ),
                            ),

                          ],
                        ),
                      )), SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
