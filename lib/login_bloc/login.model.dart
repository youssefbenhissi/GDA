class User {
  final String login;
  User({required this.login});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      login: json['login'] as String,
    );
  }
}
