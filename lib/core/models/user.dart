class User {
  final String username;
  String userDp;
  int post;
  int followers;
  int following;
  String name;
  String website;
  String bio;

  User(
      {this.followers,
      this.following,
      this.bio,
      this.website,
      this.name,
      this.post,
      this.userDp,
      this.username});
}
