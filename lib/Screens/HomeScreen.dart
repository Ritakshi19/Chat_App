import 'package:chat_app/Model/User_Data.dart';
import 'package:chat_app/Widgets/UserChatCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<UserData> list=[];
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Center(child: Text("Chat App")),backgroundColor: Colors.amber[100],),
    floatingActionButton: Padding(
      padding: const EdgeInsets.all(8.0),
      child: FloatingActionButton(onPressed: (){}, child: Icon(Icons.add_comment_rounded),),
    ),
      body: StreamBuilder(
        stream: firestore.collection('users').snapshots() ,
        builder: (context, snapshot) {
          switch (snapshot.connectionState){
            case ConnectionState.waiting:
            case ConnectionState.none:
              return Center(child: CircularProgressIndicator());
            
            case ConnectionState.active:
            case ConnectionState.done:
              final data = snapshot.data?.docs;
              list = data?.map((e) => UserData.fromJson(e.data())).toList() ?? [];
          }

          if(list.isNotEmpty){
          return 
            ListView.builder(
              itemCount: list.length,
              itemBuilder:(context,index){ 
                return UserChatCard(user: list[index]);
              });

          }else{
            return Center(child:Text("No Messages!!"));
          }
        }),
        );
  }
}