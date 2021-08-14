// ignore: import_of_legacy_library_into_null_safe
import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../models/chat_model.dart';
import '../widgets/own_message_card.dart';
import '../widgets/reply_card.dart';

class IndividualChat extends StatefulWidget {
  const IndividualChat({Key? key, required this.chat}) : super(key: key);

  final ChatModel chat;

  @override
  _IndividualChatState createState() => _IndividualChatState();
}

class _IndividualChatState extends State<IndividualChat> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  late IO.Socket socket;

  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    connect();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  void connect(){
    socket = IO.io('http://192.168.1.106:5000', <String, dynamic>{
      'transports':['websocket'],
      'autoConnect': false,
    });
    socket.connect();
    socket.emit('/test', 'hello world');
    socket.onConnect((data)=>print('Connected.'));
    print(socket.connected);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(
          'assets/whatsapp_back.png',
          height: size.height,
          width: size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
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
                        widget.chat.isGroup! ? Icons.groups : Icons.person,
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
                        style: TextStyle(
                            fontSize: 18.5, fontWeight: FontWeight.bold),
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
                  padding: EdgeInsets.all(0),
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
            child: WillPopScope(
              child: Stack(
                children: [
                  Container(
                    height: size.height - 140,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        OwnMessageCard(),
                        ReplyCard(),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: size.width - 60,
                              child: Card(
                                margin: EdgeInsets.only(
                                    left: 2, right: 2, bottom: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: TextFormField(
                                  controller: _controller,
                                  focusNode: focusNode,
                                  textAlignVertical: TextAlignVertical.center,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 5,
                                  minLines: 1,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Type a message',
                                    prefixIcon: IconButton(
                                      icon: Icon(Icons.emoji_emotions_outlined),
                                      onPressed: () {
                                        focusNode.unfocus();
                                        focusNode.canRequestFocus = false;
                                        setState(() {
                                          show = !show;
                                        });
                                      },
                                    ),
                                    suffixIcon: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.attach_file),
                                          onPressed: () {
                                            showModalBottomSheet(
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (BuildContext ctx) =>
                                                  bottomSheet(size),
                                            );
                                          },
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
                              padding:
                                  EdgeInsets.only(bottom: 8, right: 5, left: 2),
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
                        if (show) emojiSelect(),
                      ],
                    ),
                  ),
                ],
              ),
              onWillPop: () {
                if (show) {
                  setState(() {
                    show = false;
                  });
                } else {
                  Navigator.of(context).pop();
                }
                return Future.value(false);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomSheet(Size size) {
    return Container(
      height: 278,
      width: size.width,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconPad(Icons.insert_drive_file, Colors.indigo, 'Document'),
                  SizedBox(width: 40),
                  iconPad(Icons.camera_alt, Colors.pink, 'Camera'),
                  SizedBox(width: 40),
                  iconPad(Icons.insert_photo, Colors.purple, 'Gallery'),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconPad(Icons.headset, Colors.orange, 'Audio'),
                  SizedBox(width: 40),
                  iconPad(Icons.location_pin, Colors.teal, 'Location'),
                  SizedBox(width: 40),
                  iconPad(Icons.person, Colors.blue, 'Contact'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconPad(IconData icon, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 30,
            child: Icon(icon, size: 29, color: Colors.white),
          ),
          SizedBox(height: 5),
          Text(text, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget emojiSelect() {
    return EmojiPicker(
      rows: 4,
      columns: 7,
      onEmojiSelected: (emoji, category) {
        setState(() {
          _controller.text = _controller.text + emoji.emoji;
        });
      },
    );
  }
}
