import 'package:flutter/material.dart';

import '../pages/chat_page.dart';
import '../pages/status_page.dart';
import '../pages/camera_page.dart';
import '../models/chat_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.chatModels, required this.sourceChat}) : super(key: key);

  final List<ChatModel> chatModels;
  final ChatModel sourceChat;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connect-O'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          PopupMenuButton(
              onSelected: (value) {},
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text('New group'),
                    value: 'New Group',
                  ),
                  PopupMenuItem(
                    child: Text('New broadcast'),
                    value: 'New broadcast',
                  ),
                  PopupMenuItem(
                    child: Text('Whatsapp Web'),
                    value: 'Whatsapp Web',
                  ),
                  PopupMenuItem(
                    child: Text('Starred messages'),
                    value: 'Starred messages',
                  ),
                  PopupMenuItem(
                    child: Text('Settings'),
                    value: 'Settings',
                  ),
                ];
              }),
        ],
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: 'CHATS',
            ),
            Tab(
              text: 'STATUS',
            ),
            Tab(
              text: 'CALLS',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          CameraPage(),
          ChatPage(chatModels: widget.chatModels, sourceChat: widget.sourceChat),
          StatusPage(),
          Text('calls'),
        ],
      ),
    );
  }
}
