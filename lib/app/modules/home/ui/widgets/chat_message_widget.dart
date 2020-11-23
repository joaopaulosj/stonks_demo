import 'package:demo_stonks/app/base/app_dimens.dart';
import 'package:demo_stonks/app/base/app_strings.dart';
import 'package:demo_stonks/app/modules/home/domain/models/message.dart';
import 'package:demo_stonks/app/modules/home/domain/models/reaction.dart';
import 'package:demo_stonks/app/modules/home/ui/controllers/chat_controller.dart';
import 'package:emoji_keyboard/emoji_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ChatMessageWidget extends StatelessWidget {
  final Message message;

  ChatMessageWidget(this.message);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        showDialog(
          context: context,
          builder: (_) => Dialog(
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(kMarginDefault),
              child: EmojiKeyboard(
                onEmojiPressed: (emoji) {
                  Modular.get<ChatController>().addReaction(
                    message,
                    emoji.emoji,
                  );
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kMarginDefault,
          vertical: kMarginSmall,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipOval(
              child: Image.asset(
                message.user.picture,
                height: 32.0,
                width: 32.0,
              ),
            ),
            SizedBox(width: kMarginDefault),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        message.user.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(width: kMarginDetail),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 1.0),
                        child: Text(
                          message.hour,
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 10.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    message.text,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: kMarginSmall),
                  if (message.reactions?.isNotEmpty ?? false)
                    _Reactions(message: message),
                  if (message.replies.isNotEmpty) _Replies(message: message)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Replies extends StatelessWidget {
  const _Replies({
    Key key,
    @required this.message,
  }) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    var index = 0;
    return Row(
      children: [
        Container(
          height: 36.0,
          width: message.replies.length == 1
              ? 36.0
              : message.replies.length * 28.0,
          child: Stack(
            children: message.replies
                .map(
                  (e) => _ReplyWidget(e, index++),
                )
                .toList(),
          ),
        ),
        SizedBox(width: kMarginSmall),
        Text(
          AppStrings.chatReplies(message.replies.length),
          style: TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}

class _ReplyWidget extends StatelessWidget {
  final Message reply;
  final int index;

  _ReplyWidget(this.reply, this.index);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 24.0 * index,
      child: ClipOval(
        child: Container(
          height: 36.0,
          width: 36.0,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: ClipOval(child: Image.asset(reply.user.picture)),
          ),
        ),
      ),
    );
  }
}

class _Reactions extends StatelessWidget {
  const _Reactions({
    Key key,
    @required this.message,
  }) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ...message.getSortedReactions().map((e) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
            child: ReactionWidget(
              reaction: e,
              onClick: () {
                Modular.get<ChatController>().onReactionClicked(
                  message.id,
                  e,
                );
              },
            ),
          );
        }).toList(),
        AddEmojiWidget(onClick: () {
          showDialog(
            context: context,
            builder: (_) => Dialog(
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(kMarginDefault),
                child: EmojiKeyboard(
                  onEmojiPressed: (emoji) {
                    Modular.get<ChatController>().addReaction(
                      message,
                      emoji.emoji,
                    );
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}

class ReactionWidget extends StatelessWidget {
  final Reaction reaction;
  final VoidCallback onClick;

  ReactionWidget({this.reaction, this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        decoration: BoxDecoration(
          color: reaction.isSelected
              ? Colors.blueAccent.withOpacity(0.2)
              : Colors.grey[200],
          borderRadius: const BorderRadius.all(
            Radius.circular(32.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(reaction.emoji),
              const SizedBox(width: 2),
              Text(
                reaction.count.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color:
                      reaction.isSelected ? Colors.blueAccent : Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddEmojiWidget extends StatelessWidget {
  final VoidCallback onClick;

  AddEmojiWidget({this.onClick});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: InkWell(
        onTap: onClick,
        child: Container(
          height: 30,
          width: 30,
          color: Colors.grey[200],
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(kMarginDetail),
              child: Stack(
                children: [
                  const Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Icon(
                      Icons.emoji_emotions_outlined,
                      color: Colors.black87,
                      size: 20,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: ClipOval(
                      child: Container(
                        color: Colors.grey[200],
                        child: const Icon(
                          Icons.add_outlined,
                          size: 10,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
