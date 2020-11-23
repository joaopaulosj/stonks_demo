import 'package:demo_stonks/app/modules/home/domain/models/reaction.dart';
import 'package:demo_stonks/app/modules/home/domain/models/user.dart';

class Message {
  final int id;
  final String text;
  final User user;
  final String hour;
  List<Reaction> reactions;

  Message({this.id, this.text, this.user, this.hour, this.reactions});

  List<Reaction> getSortedReactions() {
    reactions.sort((a, b) => b.count.compareTo(a.count));
    return reactions;
  }
}
