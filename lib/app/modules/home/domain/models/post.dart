import 'package:demo_stonks/app/modules/home/domain/models/user.dart';

class Post {
  final int id;
  final String text;
  final User user;
  final String hour;

  Post({this.id, this.text, this.user, this.hour});
}
