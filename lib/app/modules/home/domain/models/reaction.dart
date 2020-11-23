class Reaction {
  final String emoji;
  List<int> userIds;

  Reaction(this.emoji, this.userIds);

  int get count => userIds.length;

  bool get isSelected => userIds.contains(8);
}
