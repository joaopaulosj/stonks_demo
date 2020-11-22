class User {
  final int id;
  final String name;

  User({this.id, this.name});

  String get picture => 'assets/avatars/avatar_$id.jpg';
}
