class User {
  final String login;
  final int id;
  User({required this.login, required this.id});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      login: json['login'] as String,
      id: json['id'] as int,
    );
  }
}
