import 'package:demo_stonks/app/modules/home/domain/usecases/get_portfolio_usecase.dart';
import 'package:demo_stonks/app/modules/home/domain/usecases/get_top_posts_usecase.dart';
import 'package:demo_stonks/app/modules/home/domain/usecases/get_user_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasources/home_local_data_source.dart';
import 'data/repositories/home_repository_impl.dart';
import 'domain/usecases/get_balance_usecase.dart';
import 'ui/controllers/home_controller.dart';
import 'ui/pages/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeLocalDataSource()),
        Bind((i) => HomeRepositoryImpl(dataSource: i.get())),
        Bind((i) => GetBalanceUsecase(repository: i.get())),
        Bind((i) => GetUserUsecase(repository: i.get())),
        Bind((i) => GetPortfolioUsecase(repository: i.get())),
        Bind((i) => GetTopPostsUsecase(repository: i.get())),
        Bind(
          (i) => HomeController(
            getBalanceUsecase: i.get(),
            getUserUsecase: i.get(),
            getPortfolioUsecase: i.get(),
            getTopPostsUsecase: i.get(),
          ),
        ),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
