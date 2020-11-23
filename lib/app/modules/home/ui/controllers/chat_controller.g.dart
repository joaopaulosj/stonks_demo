// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ChatController = BindInject(
  (i) => ChatController(
      portfolio: i<Portfolio>(), getUserUsecase: i<GetUserUsecase>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatController on _ChatControllerBase, Store {
  final _$messagesStateAtom = Atom(name: '_ChatControllerBase.messagesState');

  @override
  UIState get messagesState {
    _$messagesStateAtom.reportRead();
    return super.messagesState;
  }

  @override
  set messagesState(UIState value) {
    _$messagesStateAtom.reportWrite(value, super.messagesState, () {
      super.messagesState = value;
    });
  }

  @override
  String toString() {
    return '''
messagesState: ${messagesState}
    ''';
  }
}
