import 'dart:io';

class Post {
  final String username;
  final String userDpUrl;
  final File imgFile;
  final String location;
  final String caption;
  List<String> likes;
  Map<String, String> comments;

  Post({
    this.username,
    this.imgFile,
    this.location,
    this.userDpUrl,
    this.likes,
    this.comments,
    this.caption,
  });
}
