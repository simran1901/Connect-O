import 'package:connecto/screens/create_group.dart';
import 'package:connecto/widgets/button_card.dart';
import 'package:flutter/material.dart';

import '../widgets/contact_card.dart';
import '../models/chat_model.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({Key? key}) : super(key: key);

  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> contacts = [
      ChatModel(
        name: 'Simran',
        status: 'A full stack developer',
      ),
      ChatModel(
        name: 'Balram',
        status: 'Flutter developer',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Contact',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            Text('256 contacts', style: TextStyle(fontSize: 13)),
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.search, size: 26), onPressed: () {}),
          PopupMenuButton(
            onSelected: (value) {},
            padding: EdgeInsets.all(0),
            itemBuilder: (BuildContext ctx) {
              return [
                PopupMenuItem(
                  child: Text('Invite a friend'),
                  value: 'Invite a friend',
                ),
                PopupMenuItem(
                  child: Text('Contacts'),
                  value: 'Contacts',
                ),
                PopupMenuItem(
                  child: Text('Refresh'),
                  value: 'Refresh',
                ),
                PopupMenuItem(
                  child: Text('Help'),
                  value: 'Help',
                ),
              ];
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length + 2,
        itemBuilder: (BuildContext ctx, int i) {
          if (i == 0) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext ctx) => CreateGroup()));
              },
              child: ButtonCard(name: 'New group', icon: Icons.group),
            );
          } else if (i == 1) {
            return ButtonCard(name: 'New contact', icon: Icons.person_add);
          }
          return ContactCard(contact: contacts[i - 2]);
        },
      ),
    );
  }
}
