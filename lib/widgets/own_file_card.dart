import 'dart:io';

import 'package:flutter/material.dart';

class OwnFileCard extends StatelessWidget {
  const OwnFileCard({
    Key? key,
    required this.path,
    required this.message,
    required this.time,
  }) : super(key: key);

  final String path;
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Container(
          height: size.height / 2.3,
          width: size.width / 1.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.teal[400],
          ),
          child: Card(
            margin: EdgeInsets.all(3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: Colors.teal[400],
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.file(
                    File(path),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                message.length > 0
                    ? Container(
                        height: 40,
                        padding: EdgeInsets.only(left: 15, top: 8),
                        child: Text(
                          message,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
