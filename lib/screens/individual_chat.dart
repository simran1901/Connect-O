import 'package:flutter/material.dart';

import '../models/chat_model.dart';

class IndividualChat extends StatefulWidget {
  const IndividualChat({Key? key, required this.chat}) : super(key: key);

  final ChatModel chat;

  @override
  _IndividualChatState createState() => _IndividualChatState();
}

class _IndividualChatState extends State<IndividualChat> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          titleSpacing: 0,
          leadingWidth: 70,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back, size: 24),
                CircleAvatar(
                  radius: 20,
                  child: Icon(
                    widget.chat.isGroup ? Icons.groups : Icons.person,
                    size: 36,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.blueGrey,
                ),
              ],
            ),
          ),
          title: InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.chat.name,
                    style:
                        TextStyle(fontSize: 18.5, fontWeight: FontWeight.bold),
                  ),
                  Text('last seen today at 12:05',
                      style: TextStyle(fontSize: 13)),
                ],
              ),
            ),
          ),
          actions: [
            IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
            IconButton(icon: Icon(Icons.call), onPressed: () {}),
            PopupMenuButton(
              onSelected: (value) {},
              itemBuilder: (BuildContext ctx) {
                return [
                  PopupMenuItem(
                    child: Text('View Contact'),
                    value: 'View Contact',
                  ),
                  PopupMenuItem(
                    child: Text('Media, links and docs'),
                    value: 'Media, links and docs',
                  ),
                  PopupMenuItem(
                    child: Text('Search'),
                    value: 'Search',
                  ),
                  PopupMenuItem(
                    child: Text('Mute Notifications'),
                    value: 'Mute Notifications',
                  ),
                  PopupMenuItem(
                    child: Text('Wallpaper'),
                    value: 'Wallpaper',
                  ),
                  PopupMenuItem(
                    child: Text('More'),
                    value: 'More',
                  ),
                ];
              },
            ),
          ],
        ),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            ListView(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Container(
                    width: size.width - 60,
                    child: Card(
                      margin: EdgeInsets.only(left: 2, right: 2, bottom: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        minLines: 1,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Type a message',
                          prefixIcon: IconButton(
                            icon: Icon(Icons.emoji_emotions),
                            onPressed: () {},
                          ),
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.attach_file),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(Icons.camera_alt),
                                onPressed: () {},
                              ),
                            ],
                          ),
                          contentPadding: EdgeInsets.all(5),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8, right: 5, left: 2),
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).accentColor,
                      radius: 25,
                      child: IconButton(
                        icon: Icon(Icons.mic, color: Colors.white),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
