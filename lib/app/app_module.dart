import 'package:demo_stonks/app/app_widget.dart';
import 'package:demo_stonks/app/modules/home/home_module.dart';
import 'package:demo_stonks/app/modules/home/ui/pages/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
        ModularRouter(
          ChatPage.routeName,
          child: (_, args) => ChatPage(),
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
