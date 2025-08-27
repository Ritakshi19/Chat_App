import 'dart:async';

import 'package:chat_app/Model/User_Data.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final UserData user;

  const ChatScreen({super.key, required this.user});
  @override
  State<ChatScreen> createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  List messages = [];

  TextEditingController textController = TextEditingController();
  late StreamSubscription<QuerySnapshot> messageSubscription;
  bool isLoading = true;
  final ScrollController scrollController = ScrollController();

  // Scroll to bottom when new messages arrive

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back),
            ),
            CircleAvatar(child: Icon(Icons.person)),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.user.name, style: TextStyle(fontSize: 16)),
                Text(
                  widget.user.isOnline ? "Online" : "Offline",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child:
                isLoading
                    ? Center(child: CircularProgressIndicator())
                    : messages.isEmpty
                    ? Center(
                      child: Text(
                        "No messages yet.\nStart a conversation!",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                    : ListView.builder(
                      controller: scrollController,
                      reverse: false,
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final message = messages[index];
                      },
                    ),
          ),
          buildMessageInput(),
        ],
      ),
    );
  }

  Widget buildMessageInput() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
              ),
              onSubmitted: (_) => () {},
            ),
          ),
          SizedBox(width: 10),
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.send, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
