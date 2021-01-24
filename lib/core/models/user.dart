class User {
  final String username;
  String userDp;
  int post;
  int followers;
  int following;
  String name;

  User(
      {this.followers,
      this.following,
      this.name,
      this.post,
      this.userDp,
      this.username});
}
