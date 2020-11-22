// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(
      getBalanceUsecase: i<GetBalanceUsecase>(),
      getUserUsecase: i<GetUserUsecase>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$balanceStateAtom = Atom(name: '_HomeControllerBase.balanceState');

  @override
  UIState get balanceState {
    _$balanceStateAtom.reportRead();
    return super.balanceState;
  }

  @override
  set balanceState(UIState value) {
    _$balanceStateAtom.reportWrite(value, super.balanceState, () {
      super.balanceState = value;
    });
  }

  final _$userStateAtom = Atom(name: '_HomeControllerBase.userState');

  @override
  UIState get userState {
    _$userStateAtom.reportRead();
    return super.userState;
  }

  @override
  set userState(UIState value) {
    _$userStateAtom.reportWrite(value, super.userState, () {
      super.userState = value;
    });
  }

  @override
  String toString() {
    return '''
balanceState: ${balanceState},
userState: ${userState}
    ''';
  }
}
