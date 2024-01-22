import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:exchange_currency_rates_app/core/failure.dart';
import 'package:exchange_currency_rates_app/core/network/network_interface.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/data/datasource/currency_datasource.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/data/model/currencies_model.dart';

class RemoteCurrencyDatasource implements IRemoteCurrencyDatasource {
  const RemoteCurrencyDatasource({required this.network});

  final INetwork network;

  @override
  Future<Either<Failure, CurrenciesModel>> fetchCurrencies() async {
    try {
      final response = await network.fetchCurrencies();
      return Right(CurrenciesModel.fromJson(response));
    } on DioException catch (e) {
      return Left(FailureNetwork(error: e.toString()));
    }
  }
}
