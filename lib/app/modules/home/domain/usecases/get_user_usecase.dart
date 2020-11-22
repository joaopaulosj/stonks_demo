import 'package:demo_stonks/app/modules/home/domain/models/user.dart';
import 'package:demo_stonks/app/modules/home/domain/repositories/home_repository.dart';

class GetUserUsecase {
  final HomeRepository repository;

  GetUserUsecase({this.repository});

  User call() => repository.getUser();
}
