import 'package:flutter/material.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({Key? key}) : super(key: key);

  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (ctx, i) => callCard(
          'Simran',
          Icons.call_made,
          Colors.green,
          'August 19, 18:34',
        ),
      ),
    );
  }

  Widget callCard(
    String name,
    IconData iconData,
    Color iconColor,
    String time,
  ) {
    return Card(
      margin: EdgeInsets.only(bottom: 0.5),
      child: ListTile(
        leading: CircleAvatar(radius: 26),
        title: Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Row(
          children: [
            Icon(
              iconData,
              color: iconColor,
              size: 20,
            ),
            SizedBox(width: 6),
            Text(
              time,
              style: TextStyle(
                fontSize: 12.8,
              ),
            ),
          ],
        ),
        trailing: Icon(
          Icons.call,
          size: 28,
          color: Colors.teal,
        ),
      ),
    );
  }
}
