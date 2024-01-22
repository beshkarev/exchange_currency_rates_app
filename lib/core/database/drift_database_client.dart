import 'package:drift/drift.dart';
import 'package:exchange_currency_rates_app/core/database/app_database_interface.dart';
import 'package:exchange_currency_rates_app/core/database/dao/currency_history/currency_history_dao.dart';
import 'package:exchange_currency_rates_app/core/database/drift/database.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/data/model/currencies_model.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/data/model/currency_history_model.dart';

class DriftDatabaseClient implements IAppDatabase {
  DriftDatabaseClient({
    required this.database,
    required this.currencyHistoryDao,
  });

  final Database database;
  final CurrencyHistoryDao currencyHistoryDao;

  @override
  void insertCurrenciesData(CurrenciesModel currencies) async {
    await database.transaction(() async {
      await database.batch(
        (batch) => batch.insertAll(
          database.currenciesTable,
          currencies.currencies
              .map(
                (e) => CurrenciesTableCompanion.insert(
                  key: e.key,
                  name: e.name,
                  flag: e.flag,
                ),
              )
              .toList(),
          mode: InsertMode.insertOrIgnore,
        ),
      );

      await database.batch(
        (batch) => batch.insertAll(
          database.exchangeRateTable,
          currencies.currencies.map(
            (e) => ExchangeRateTableCompanion.insert(
              exchangeRate: e.exchange,
              timestamp: currencies.timestamp,
              key: e.key,
            ),
          ),
        ),
      );
    });
  }

  @override
  Future<List<CurrencyHistoryModel>> fetchCurrenciesHistoryLimited(int limit, {int? offset, required String key}) {
    return currencyHistoryDao.fetchHistoryLimited(limit, offset: offset, key: key);
  }
}
