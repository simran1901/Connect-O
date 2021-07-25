import 'package:flutter/material.dart';

import '../widgets/custom_card.dart';
import '../screens/select_contact.dart';
import '../models/chat_model.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
      name: 'Simran',
      isGroup: false,
      currentMessage: 'Hello Simran',
      time: '4:00',
      icon: '',
    ),
    ChatModel(
      name: 'Simran',
      isGroup: false,
      currentMessage: 'Hello Simran',
      time: '4:00',
      icon: '',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext ctx) => SelectContact()));
        },
        child: Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (BuildContext ctx, int i) {
          return CustomCard(chat: chats[i]);
        },
      ),
    );
  }
}
