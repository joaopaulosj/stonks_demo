import 'package:demo_stonks/app/modules/home/domain/models/reaction.dart';
import 'package:demo_stonks/app/modules/home/domain/models/user.dart';
import 'package:intl/intl.dart';

class Message {
  final int id;
  final String text;
  final User user;
  final DateTime date;
  List<Reaction> reactions;
  List<Message> replies;

  Message({
    this.id,
    this.text,
    this.user,
    this.date,
    this.reactions,
    this.replies = const [],
  }) {
    this.reactions = reactions ?? [];
  }

  List<Reaction> getSortedReactions() {
    reactions.removeWhere((e) => e.userIds.isEmpty);
    reactions.sort((a, b) => b.count.compareTo(a.count));
    return reactions;
  }

  String get hour => DateFormat().add_jm().format(date);
}
