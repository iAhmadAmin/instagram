import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/core/models/message.dart';
import 'package:instagram/sizeconfig.dart';
import 'package:instagram/ui/styles/colors.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({this.message});

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return _oldChatBuble();
  }

  _oldChatBuble() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8),
      child: Column(
        crossAxisAlignment:
            message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            //  width: SizeConfig.screenWidth * 0.8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                gradient: LinearGradient(
                  colors: message.isMe
                      ? [primaryColor, Colors.blue[400]]
                      : [Colors.grey[350], Colors.grey[350]],
                )),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                message.message,
                style: TextStyle(
                  color: message.isMe ? Colors.white : Colors.black,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
