import 'package:flutter/material.dart';

import '../widgets/custom_card.dart';
import '../screens/select_contact.dart';
import '../models/chat_model.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key, required this.chatModels, required this.sourceChat}) : super(key: key);
  final List<ChatModel> chatModels;
  final ChatModel sourceChat;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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
        itemCount: widget.chatModels.length,
        itemBuilder: (BuildContext ctx, int i) {
          return CustomCard(chat: widget.chatModels[i], sourceChat: widget.sourceChat);
        },
      ),
    );
  }
}
