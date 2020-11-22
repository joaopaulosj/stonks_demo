import 'package:demo_stonks/app/app_widget.dart';
import 'package:demo_stonks/app/modules/home/data/datasources/home_local_data_source.dart';
import 'package:demo_stonks/app/modules/home/data/repositories/home_repository_impl.dart';
import 'package:demo_stonks/app/modules/home/domain/usecases/get_balance_usecase.dart';
import 'package:demo_stonks/app/modules/home/home_module.dart';
import 'package:demo_stonks/app/modules/home/ui/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeLocalDataSource()),
        Bind((i) => HomeRepositoryImpl(dataSource: i.get())),
        Bind((i) => GetBalanceUsecase(repository: i.get())),
        Bind((i) => HomeController(getBalanceUsecase: i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
