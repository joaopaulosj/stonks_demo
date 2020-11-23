import 'package:demo_stonks/app/base/app_states.dart';
import 'package:demo_stonks/app/modules/home/domain/models/message.dart';
import 'package:demo_stonks/app/modules/home/domain/models/portfolio.dart';
import 'package:demo_stonks/app/modules/home/domain/usecases/get_user_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

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
    final message = Message(text: text, user: getUserUsecase(), hour: 'XXX');
    portfolio.messages.add(message);
    portfolio.unreadCount = 0;
    _updateState();
  }

  void _updateState() {
    messagesState = MessagesState(portfolio.messages);
  }
}

class MessagesState implements UIState {
  final List<Message> messages;

  MessagesState(this.messages);
}
