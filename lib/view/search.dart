import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterchatapp/services/dataBase.dart';
import 'package:flutterchatapp/widgets/widget.dart';
class Searchscrean extends StatefulWidget {
  @override
  _SearchscreanState createState() => _SearchscreanState();
}

class _SearchscreanState extends State<Searchscrean> {
  Database database=Database();
  TextEditingController searchEditingController=TextEditingController();
  QuerySnapshot searchResultSnapshot;
  initiateSearch() {
    if(searchEditingController.text.isNotEmpty){
       database.getuserwithname(searchEditingController.text)
          .then((snapshot){
            setState(() {
              searchResultSnapshot = snapshot;
            });
      });
    }
  }
  @override
  void initState() {
initiateSearch();
super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: aappBar(),
      body:Container(
        child: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            color: Color(0x54FFFFFF),
            child: Row(children: <Widget>[
              Expanded(
                child: TextField(
                  controller: searchEditingController,
                  style: Simplestyle(),
                  decoration: InputDecoration(
                      hintText: "search username ...",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      border: InputBorder.none
                  ),
                ),
              ),
        GestureDetector(
          onTap: (){

            initiateSearch();
          },
          child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        const Color(0x36FFFFFF),
                        const Color(0x0FFFFFFF)
                      ],
                      begin: FractionalOffset.topLeft,
                      end: FractionalOffset.bottomRight
                  ),
                  borderRadius: BorderRadius.circular(40)
              ),
              padding: EdgeInsets.all(12),
              child: Image.asset("assets/images/search_white.png",
                height: 25, width: 25,)),
        )
            ],),
          ),
          userList()
        ],),
      )


    );
  }
  Widget userList(){
    return searchResultSnapshot !=null?ListView.builder(
        shrinkWrap: true,
        itemCount: searchResultSnapshot.documents.length,
        itemBuilder: (context, index){
          return userTile(
            searchResultSnapshot.documents[index].data["name"],
            searchResultSnapshot.documents[index].data["email"],
          );
        }):Container();
  }

  Widget userTile(String userName,String userEmail){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                ),
              ),
              Text(
                userEmail,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                ),
              )
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: (){
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(24)
              ),
              child: Text("Message",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                ),),
            ),
          )
        ],
      ),
    );
  }
}
