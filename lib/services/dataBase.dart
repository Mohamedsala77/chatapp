import 'package:cloud_firestore/cloud_firestore.dart';
class Database{
  Future<void> uploaduder(userData) async {
    Firestore.instance.collection("users").add(userData).catchError((e) {
      print(e.toString());
    });
  }
  getuserwithname(String uusername) async {
   return await Firestore.instance.collection("users").where("name",isEqualTo: uusername).getDocuments();

  }
}