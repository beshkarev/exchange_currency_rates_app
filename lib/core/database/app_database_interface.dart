import 'package:exchange_currency_rates_app/currency_exchange_rates/data/model/currencies_model.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/data/model/currency_history_model.dart';

abstract interface class IAppDatabase {
  void insertCurrenciesData(CurrenciesModel currencies);

  Future<List<CurrencyHistoryModel>> fetchCurrenciesHistoryLimited(int limit, {int? offset, required String key});
}
