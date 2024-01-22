import 'package:dio/dio.dart';
import 'package:exchange_currency_rates_app/core/config/environment.dart';
import 'package:exchange_currency_rates_app/core/network/network_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient implements INetwork {
  DioClient({required this.dio}) {
    dio.options.baseUrl = Env.endpoint;

    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger());
    }
  }

  final Dio dio;

  @override
  Future<JsonMap> fetchCurrencies() async {
    final response = await dio.get(
      '/fx/current',
      options: Options(headers: {'api-key': Env.apiKey}),
    );

    return response.data;
  }
}
