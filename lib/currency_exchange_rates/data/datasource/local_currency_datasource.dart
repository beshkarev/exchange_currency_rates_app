import 'package:exchange_currency_rates_app/core/database/app_database_interface.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/data/datasource/currency_datasource.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/data/model/currencies_model.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/data/model/currency_history_model.dart';

class LocalCurrencyDatasource implements ILocalCurrencyDatasource {
  const LocalCurrencyDatasource({required this.database});

  final IAppDatabase database;

  @override
  void saveCurrencyLocally(CurrenciesModel currencies) {
    database.insertCurrenciesData(currencies);
  }

  @override
  Future<List<CurrencyHistoryModel>> fetchCurrenciesHistoryLimited(int limit, {int? offset, required String key}) {
    return database.fetchCurrenciesHistoryLimited(limit, offset: offset, key: key);
  }
}
