import 'package:demo_stonks/app/modules/home/domain/models/user.dart';
import 'package:intl/intl.dart';

class Post {
  final int id;
  final String text;
  final User user;
  final DateTime date;

  Post({this.id, this.text, this.user, this.date});

  String get hour => DateFormat().add_jm().format(date);
}
