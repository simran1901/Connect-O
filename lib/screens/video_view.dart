import 'dart:io';

import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  const VideoView({Key? key, required this.path}) : super(key: key);
  final String path;

  @override
  _VideoViewState createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.path))
      ..initialize().then((_) {
        setState(() {});
      });
  }

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
              child: _controller.value.initialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Container(),
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
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
                child: CircleAvatar(
                  radius: 33,
                  backgroundColor: Colors.black38,
                  child: Icon(
                    _controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: Colors.white,
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
