import 'package:dartz/dartz.dart';
import 'package:exchange_currency_rates_app/core/failure.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/data/datasource/currency_datasource.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/data/model/currencies_model.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/domain/entities/currencies_entity.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/domain/entities/currency_history_entity.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/domain/repository/currency_repository_contract.dart';

class CurrencyRepository implements ICurrencyRepository {
  const CurrencyRepository({
    required this.remoteDatasource,
    required this.localDatasource,
  });

  final IRemoteCurrencyDatasource remoteDatasource;
  final ILocalCurrencyDatasource localDatasource;

  @override
  Future<Either<Failure, CurrenciesEntity>> fetchCurrencies() {
    return remoteDatasource.fetchCurrencies();
  }

  @override
  void saveCurrencyDataLocally(CurrenciesEntity currencies) {
    localDatasource.saveCurrencyLocally(currencies as CurrenciesModel);
  }

  @override
  Future<List<CurrencyHistoryEntity>> fetchCurrenciesHistoryLimited(int limit, {int? offset, required String key}) {
    return localDatasource.fetchCurrenciesHistoryLimited(limit, offset: offset, key: key);
  }
}
