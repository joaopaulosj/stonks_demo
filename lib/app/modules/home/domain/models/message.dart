import 'package:demo_stonks/app/modules/home/domain/models/user.dart';

class Message {
  final int id;
  final String text;
  final User user;

  Message({this.id, this.text, this.user});
}
