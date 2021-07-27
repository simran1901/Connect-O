import 'dart:io';

import 'package:flutter/material.dart';

class CameraView extends StatelessWidget {
  const CameraView({Key? key, required this.path}) : super(key: key);
  final String path;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.crop_rotate, size: 27),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.emoji_emotions_outlined, size: 27),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.title, size: 27),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.edit, size: 27),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Container(
              height: size.height - 150,
              width: size.width,
              child: Image.file(
                File(path),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                color: Colors.black38,
                width: size.width,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                child: TextFormField(
                  maxLines: 6,
                  minLines: 1,
                  style: TextStyle(color: Colors.white, fontSize: 17),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Add caption...',
                    hintStyle: TextStyle(color: Colors.white, fontSize: 17),
                    prefixIcon: Icon(
                      Icons.add_photo_alternate,
                      color: Colors.white,
                      size: 27,
                    ),
                    suffixIcon: CircleAvatar(
                      radius: 27,
                      backgroundColor: Colors.tealAccent[700],
                      child: Icon(Icons.check, color: Colors.white, size: 27),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
