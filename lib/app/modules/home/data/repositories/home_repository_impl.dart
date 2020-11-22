import 'package:demo_stonks/app/modules/home/data/datasources/home_local_data_source.dart';
import 'package:demo_stonks/app/modules/home/domain/models/balance.dart';
import 'package:demo_stonks/app/modules/home/domain/repositories/home_repository.dart';
import 'package:flutter/foundation.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeLocalDataSource dataSource;

  HomeRepositoryImpl({@required this.dataSource});

  @override
  Balance getBalance() => dataSource.getBalance();
}
