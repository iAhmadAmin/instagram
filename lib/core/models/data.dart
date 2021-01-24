import 'package:instagram/core/models/post.dart';
import 'package:instagram/core/models/story.dart';
import 'package:instagram/core/models/user.dart';

List<Story> stories = [
  Story(
    userDp: "assets/images/3.jpg",
    username: "random_user",
    assetPath: "assets/images/3.jpg",
  ),
  Story(
    userDp: "assets/images/4.jpg",
    username: "odl_user123",
    assetPath: "assets/images/r.jpg",
  ),
  Story(
    userDp: "assets/images/3.jpg",
    username: "new_user",
    assetPath: "assets/images/3.jpg",
    isViewed: true,
  ),
  Story(
    userDp: "assets/images/4.jpg",
    username: "user_1232",
    assetPath: "assets/images/r.jpg",
    isViewed: true,
  ),
  Story(
    userDp: "assets/images/3.jpg",
    username: "nafef",
    assetPath: "assets/images/3.jpg",
    isViewed: true,
  ),
  Story(
    userDp: "assets/images/4.jpg",
    username: "udfasd",
    assetPath: "assets/images/r.jpg",
    isViewed: true,
  ),
];

List<Post> posts = [
  Post(
    username: "user_1232",
    userDp: "assets/images/1.jpg",
    postAsset: "assets/images/1.jpg",
    postDesc: "it is me enjoying my times in holidays.",
    likes: 322,
    location: "City name, country",
    comments: [
      "awesome",
      "wow enjoying",
      "nice photo",
    ],
  ),
  Post(
    username: "new_user",
    userDp: "assets/images/2.jpg",
    postAsset: "assets/images/2.jpg",
    postDesc:
        "it is me enjoying my times in holidays. It was a really enjoyble day with my friends. BTW its just a demo description. LOL",
    likes: 322,
    comments: [
      "awesome",
      "wow enjoying",
      "nice photo",
    ],
  ),
  Post(
    username: "odl_user123",
    userDp: "assets/images/3.jpg",
    postAsset: "assets/images/3.jpg",
    postDesc: "it is me enjoying my times in holidays.",
    location: "City name, country",
    likes: 322,
    comments: [
      "awesome",
      "wow enjoying",
      "nice photo",
    ],
  ),
  Post(
    username: "random_user",
    userDp: "assets/images/4.jpg",
    postAsset: "assets/images/4.jpg",
    postDesc: "it is me enjoying my times in holidays.",
    likes: 322,
    comments: [
      "awesome",
      "wow enjoying",
      "nice photo",
    ],
  ),
];

List<User> users = [
  User(
    username: "user_1232",
    userDp: "assets/images/1.jpg",
    name: "Aalia Nay",
    post: 12,
    followers: 234,
    following: 113,
  ),
  User(
    username: "random_user",
    userDp: "assets/images/4.jpg",
    name: "Walther White",
    post: 141,
    followers: 23,
    following: 213,
  ),
  User(
    username: "odl_user123",
    userDp: "assets/images/3.jpg",
    name: "Oldy John",
    post: 12,
    followers: 234,
    following: 113,
  ),
  User(
    username: "new_user",
    userDp: "assets/images/2.jpg",
    name: "Smith Warn",
    post: 12,
    followers: 234,
    following: 113,
  ),
];
