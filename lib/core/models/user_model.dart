class UserModel {
  final String username;
  String userDp;
  int post;
  int followers;
  int following;
  String name;
  String website;
  String bio;
  String password;
  String email;

  UserModel(
      {this.followers,
      this.email,
      this.following,
      this.bio,
      this.website,
      this.name,
      this.password,
      this.post,
      this.userDp,
      this.username});
}
