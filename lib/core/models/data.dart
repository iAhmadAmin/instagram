import 'package:instagram/core/models/activity.dart';
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

List searchCategories = [
  "Shop",
  "Decor",
  "Travel",
  "Architechture",
  "Food",
  "Art",
  "Style",
  "TV & Movies",
  "Music",
  "DIY",
  "Comics"
];

List searchImages = [
  "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1514315384763-ba401779410f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1496440737103-cd596325d314?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1504276048855-f3d60e69632f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1510832198440-a52376950479?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1545912452-8aea7e25a3d3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1510520434124-5bc7e642b61d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1474073705359-5da2a8270c64?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1500917293891-ef795e70e1f6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1514846226882-28b324ef7f28?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1504730030853-eff311f57d3c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1506901437675-cde80ff9c746?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1500336624523-d727130c3328?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1504933350103-e840ede978d4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1467632499275-7a693a761056?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"
];

List<Activity> activities = [
  Activity(
    userDp: "assets/images/1.jpg",
    userName: "user_raw",
    notification: "started following you.",
    time: "4 h",
  ),
  Activity(
    userDp: "assets/images/2.jpg",
    userName: "ajef_asf",
    notification: "started following you.",
    time: "6 h",
  ),
  Activity(
    userDp: "assets/images/3.jpg",
    userName: "another_user",
    notification: "who you might know, is on instagramm.",
    time: "2 d",
    isFollower: false,
  ),
  Activity(
    userDp: "assets/images/4.jpg",
    userName: "user_raw",
    notification: "started following you",
    time: "2 d",
  ),
  Activity(
      userDp: "assets/images/5.jpg",
      userName: "insta_user",
      notification: "who you might know, is on instagramm.",
      isFollower: false,
      time: "4 d"),
];
