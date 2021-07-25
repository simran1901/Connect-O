import 'package:flutter/material.dart';

import '../widgets/avatar_card.dart';
import '../widgets/contact_card.dart';
import '../models/chat_model.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
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
  List<ChatModel> groups = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New Group',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            Text('Add participants', style: TextStyle(fontSize: 13)),
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.search, size: 26), onPressed: () {}),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: contacts.length + 1,
            itemBuilder: (BuildContext ctx, int i) {
              if (i == 0) {
                return Container(height: groups.length > 0 ? 90 : 10);
              }
              return InkWell(
                onTap: () {
                  if (contacts[i - 1].select == false) {
                    setState(() {
                      groups.add(contacts[i - 1]);
                      contacts[i - 1].select = true;
                      print(contacts[i - 1].select);
                    });
                  } else {
                    setState(() {
                      groups.remove(contacts[i - 1]);
                      contacts[i - 1].select = false;
                    });
                  }
                },
                child: ContactCard(contact: contacts[i - 1]),
              );
            },
          ),
          if (groups.length > 0)
            Column(
              children: [
                Container(
                  height: 75,
                  color: Colors.white,
                  child: ListView.builder(
                    itemCount: groups.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, i) {
                      if (contacts[i].select)
                        return InkWell(
                          onTap: () {
                            setState(() {
                              groups.remove(contacts[i]);
                              contacts[i].select = false;
                            });
                          },
                          child: AvatarCard(contact: contacts[i]),
                        );
                      return Container();
                    },
                  ),
                ),
                Divider(thickness: 1),
              ],
            ),
        ],
      ),
    );
  }
}
