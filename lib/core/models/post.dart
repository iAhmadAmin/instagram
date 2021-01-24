class Post {
  final String username;
  final String userDp;
  final String postAsset;
  final String location;
  int likes;
  List<String> comments;
  final String postDesc;

  Post(
      {this.username,
      this.location,
      this.userDp,
      this.postAsset,
      this.likes,
      this.comments,
      this.postDesc});
}
