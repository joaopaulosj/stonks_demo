import 'package:demo_stonks/app/base/app_states.dart';
import 'package:demo_stonks/app/modules/home/domain/models/message.dart';
import 'package:demo_stonks/app/modules/home/domain/models/portfolio.dart';
import 'package:demo_stonks/app/modules/home/domain/models/reaction.dart';
import 'package:demo_stonks/app/modules/home/domain/usecases/get_user_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart' hide Reaction;

part 'chat_controller.g.dart';

@Injectable()
class ChatController = _ChatControllerBase with _$ChatController;

abstract class _ChatControllerBase with Store {
  final Portfolio portfolio;
  final GetUserUsecase getUserUsecase;

  _ChatControllerBase({this.portfolio, this.getUserUsecase}) {
    messagesState = MessagesState(portfolio.messages);
  }

  @observable
  UIState messagesState = InitialState();

  void addMessage(String text) {
    final message = Message(
      id: portfolio.messages.length,
      text: text,
      user: getUserUsecase(),
      date: DateTime.now(),
    );
    portfolio.messages.add(message);
    portfolio.unreadCount = 0;
    _updateState();
  }

  void onReactionClicked(int messageId, Reaction reaction) {
    if (reaction.isSelected) {
      reaction.userIds.removeWhere((element) => element == getUserUsecase().id);
    } else {
      reaction.userIds.add(getUserUsecase().id);
    }

    portfolio.messages
        ?.firstWhere((e) => e.id == messageId)
        ?.reactions
        ?.firstWhere((r) => r.emoji == reaction.emoji)
        ?.userIds = reaction.userIds;

    _updateState();
  }

  void addReaction(Message message, String emoji) {
    final findReaction = message.reactions?.firstWhere(
      (element) => element.emoji == emoji,
      orElse: () => null,
    );

    if (findReaction != null) {
      onReactionClicked(message.id, findReaction);
    } else {
      final reaction = Reaction(emoji, [getUserUsecase().id]);
      portfolio.messages
          ?.firstWhere((msg) => msg.id == message.id)
          ?.reactions
          ?.add(reaction);
      _updateState();
    }
  }

  void _updateState() {
    messagesState = MessagesState(portfolio.messages);
  }
}

class MessagesState implements UIState {
  final List<Message> messages;

  MessagesState(this.messages);
}
