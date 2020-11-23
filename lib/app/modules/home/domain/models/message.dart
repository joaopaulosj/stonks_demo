import 'package:demo_stonks/app/modules/home/domain/models/user.dart';

class Message {
  final int id;
  final String text;
  final User user;
  final bool unread;

  Message({this.id, this.text, this.user, this.unread = false});
}
