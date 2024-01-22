import 'package:dartz/dartz.dart';
import 'package:exchange_currency_rates_app/core/failure.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/data/model/currencies_model.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/data/model/currency_history_model.dart';

abstract interface class ICurrencyDatasource {}

abstract interface class ILocalCurrencyDatasource extends ICurrencyDatasource {
  void saveCurrencyLocally(CurrenciesModel currencies);

  Future<List<CurrencyHistoryModel>> fetchCurrenciesHistoryLimited(int limit, {int? offset, required String key});
}

abstract interface class IRemoteCurrencyDatasource extends ICurrencyDatasource {
  Future<Either<Failure, CurrenciesModel>> fetchCurrencies();
}
