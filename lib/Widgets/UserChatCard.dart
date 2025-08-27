import 'package:chat_app/Model/User_Data.dart';
import 'package:chat_app/Screens/ChatScreen.dart';
import 'package:flutter/material.dart';

class UserChatCard extends StatefulWidget {
  final UserData user;

  const UserChatCard({super.key, required this.user});
  @override
  State<UserChatCard> createState() => _UserChatCardState();
}

class _UserChatCardState extends State<UserChatCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ChatScreen(user: widget.user),
            ),
          );
        },
        child: ListTile(
          leading: CircleAvatar(child: Icon(Icons.person)),
          title: Text(widget.user.name),
          subtitle: Text(widget.user.lastMessage, maxLines: 1),
          trailing: Text(
            "12:00",
            // formatDate(widget.user.createdAt),
            // style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
      ),
    );
  }

  // String formatDate(String dateString) {
  //   try {
  //     final date = DateTime.parse(dateString);
  //     final now = DateTime.now();
  //     final today = DateTime(now.year, now.month, now.day);
  //     final messageDate = DateTime(date.year, date.month, date.day);

  //     if (messageDate.isAtSameMomentAs(today)) {
  //       return '${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  //     } else {
  //       return '${date.day}/${date.month}';
  //     }
  //   } catch (e) {
  //     return dateString;
  //   }
  // }
}
