import 'package:flutter/material.dart';

import '../models/chat_model.dart';
import '../screens/individual_chat.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.chat}) : super(key: key);

  final ChatModel chat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) => IndividualChat(chat: chat)));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Icon(
                chat.isGroup ? Icons.groups : Icons.person,
                size: 36,
                color: Colors.white,
              ),
              backgroundColor: Colors.blueGrey,
            ),
            title: Text(
              chat.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                Text(chat.currentMessage, style: TextStyle(fontSize: 13))
              ],
            ),
            trailing: Text(chat.time),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20, left: 80),
            child: Divider(thickness: 1),
          ),
        ],
      ),
    );
  }
}
