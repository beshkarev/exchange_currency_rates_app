import 'package:dio/dio.dart';
import 'package:exchange_currency_rates_app/core/database/drift/database.dart';
import 'package:exchange_currency_rates_app/core/network/dio_client.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

class CoreDI {
  static void init() {
    locator.registerLazySingleton(() => Database());
    locator.registerLazySingleton(() => Dio());
    locator.registerLazySingleton(() => DioClient(dio: locator()));
  }
}
