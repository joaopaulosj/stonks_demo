import 'package:demo_stonks/app/modules/home/domain/models/portfolio.dart';
import 'package:demo_stonks/app/modules/home/domain/repositories/home_repository.dart';

class GetPortfolioUsecase {
  final HomeRepository repository;

  GetPortfolioUsecase({this.repository});

  List<Portfolio> call() => repository.getPortfolio();
}
