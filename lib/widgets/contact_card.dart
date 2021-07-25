import 'package:flutter/material.dart';
import '../models/chat_model.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key, required this.contact}) : super(key: key);
  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: CircleAvatar(
          radius: 23,
          child: Icon(Icons.person, color: Colors.white, size: 30),
          backgroundColor: Colors.blueGrey[200],
        ),
        title: Text(
          contact.name,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          contact.status!,
          style: TextStyle(fontSize: 13),
        ),
      ),
    );
  }
}
