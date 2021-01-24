import 'package:instagram/core/models/post.dart';
import 'package:instagram/core/models/story.dart';

List<Story> stories = [
  Story(
    userDp: "assets/images/1.jpg",
    username: "user1234",
    assetPath: "assets/images/1.jpg",
  ),
  Story(
    userDp: "assets/images/2.jpg",
    username: "ajfadsf",
    assetPath: "assets/images/2.jpg",
  ),
  Story(
    userDp: "assets/images/3.jpg",
    username: "insta_user",
    assetPath: "assets/images/3.jpg",
    isViewed: true,
  ),
  Story(
    userDp: "assets/images/4.jpg",
    username: "new_user",
    assetPath: "assets/images/r.jpg",
    isViewed: true,
  ),
  Story(
    userDp: "assets/images/3.jpg",
    username: "insta_user",
    assetPath: "assets/images/3.jpg",
    isViewed: true,
  ),
  Story(
    userDp: "assets/images/4.jpg",
    username: "new_user",
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
    postDesc: "it is me enjoying my times in holidays.",
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
