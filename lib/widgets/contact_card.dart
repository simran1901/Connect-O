import 'package:flutter/material.dart';
import '../models/chat_model.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key, required this.contact}) : super(key: key);
  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    print(contact.select);
    return ListTile(
      leading: Container(
        height: 53,
        width: 50,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 23,
              child: Icon(Icons.person, color: Colors.white, size: 30),
              backgroundColor: Colors.blueGrey[200],
            ),
            if (contact.select == true)
            Positioned(
              bottom: 4,
              right: 5,
              child: CircleAvatar(
                backgroundColor: Colors.teal,
                radius: 11,
                child: Icon(Icons.check, color: Colors.white, size: 18),
              ),
            ),
          ],
        ),
      ),
      title: Text(
        contact.name,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        contact.status!,
        style: TextStyle(fontSize: 13),
      ),
    );
  }
}
