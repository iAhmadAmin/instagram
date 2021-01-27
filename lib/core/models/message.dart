import 'package:flutter/cupertino.dart';

class MessageModel {
  String message;
  bool isMe;
  String dp;

  MessageModel({@required this.message, this.isMe = false, this.dp});
}
