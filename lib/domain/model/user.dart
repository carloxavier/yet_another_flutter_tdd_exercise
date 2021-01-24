class User {
  final int id;
  final String name;
  final String username;

  User({this.id, this.name, this.username});

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        username = json['username'];
}
