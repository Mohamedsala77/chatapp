import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterchatapp/model/user.dart';
class Authentcation{
  User _userfirebaseuser(FirebaseUser user){
   return user!=null? User(userId: user.uid):null;
  }
  FirebaseAuth _auth=FirebaseAuth.instance;
  Future Signinwithemailandpassword(String email,String password)async{
    try{
      AuthResult authResult=await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser firebaseUser= authResult.user;
      return _userfirebaseuser(firebaseUser);
    }catch(e){
      print(e.toString());return null;
    }
  }
  Future Signupwithemailandpassword(String email,String password)async{
    try{
      AuthResult authResult=await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser firebaseUser= authResult.user;
      return _userfirebaseuser(firebaseUser);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  Future signout()async{
    try{
      return await _auth.signOut();

    }catch(e){
      print(e.toString());return null;
    }
  }
  Future resetpassword(String email)async{
    try{
      Future<void> authResult= _auth.sendPasswordResetEmail(email: email);
    }catch(e){
      print(e.toString());return null;
    }
  }
}