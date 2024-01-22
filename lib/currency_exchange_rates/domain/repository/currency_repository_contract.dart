import 'package:dartz/dartz.dart';
import 'package:exchange_currency_rates_app/core/failure.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/domain/entities/currencies_entity.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/domain/entities/currency_history_entity.dart';

abstract interface class ICurrencyRepository {
  Future<Either<Failure, CurrenciesEntity>> fetchCurrencies();

  void saveCurrencyDataLocally(CurrenciesEntity currencies);

  Future<List<CurrencyHistoryEntity>> fetchCurrenciesHistoryLimited(int limit, {int? offset, required String key});
}
