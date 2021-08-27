import 'package:flutter/material.dart';

import '../widgets/statusPage/others_status.dart';
import '../widgets/statusPage/head_own_status.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 48,
            child: FloatingActionButton(
              elevation: 8,
              backgroundColor: Colors.blueGrey[100],
              onPressed: () {},
              child: Icon(Icons.edit, color: Colors.blueGrey[900]),
            ),
          ),
          SizedBox(height: 13),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.greenAccent[700],
            elevation: 5,
            child: Icon(Icons.camera_alt),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(height: 10),
            HeadOwnStatus(),
            label('Recent updates'),
            OthersStatus(
              name: 'Harsh',
              time: '01:25',
              image: 'assets/2.jpeg',
              isSeen: false,
              statusNum: 1,
            ),
            OthersStatus(
              name: 'Balraj',
              time: '01:28',
              image: 'assets/1.jpg',
              isSeen: false,
              statusNum: 2,
            ),
            OthersStatus(
              name: 'Harshit',
              time: '01:45',
              image: 'assets/3.jpg',
              isSeen: false,
              statusNum: 3,
            ),
            label('Viewed updates'),
            SizedBox(height: 10),
            OthersStatus(
              name: 'Harsh',
              time: '01:25',
              image: 'assets/2.jpeg',
              isSeen: true,
              statusNum: 3,
            ),
            OthersStatus(
              name: 'Balraj',
              time: '01:28',
              image: 'assets/1.jpg',
              isSeen: true,
              statusNum: 1,
            ),
            OthersStatus(
              name: 'Harshit',
              time: '01:45',
              image: 'assets/3.jpg',
              isSeen: true,
              statusNum: 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget label(String labelName) {
    return Container(
      height: 33,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
        child: Text(
          labelName,
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
