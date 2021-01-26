class Activity {
  final String userDp;
  final String userName;
  final String notification;
  final String time;
  final bool isFollower;

  Activity(
      {this.userDp,
      this.userName,
      this.notification,
      this.time,
      this.isFollower = true});
}
