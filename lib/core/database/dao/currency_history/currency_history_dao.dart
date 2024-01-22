import 'package:drift/drift.dart';
import 'package:exchange_currency_rates_app/core/database/drift/database.dart';
import 'package:exchange_currency_rates_app/core/database/tabels/exchange_rate_table.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/data/model/currency_history_model.dart';

part 'currency_history_dao.g.dart';

@DriftAccessor(tables: [ExchangeRateTable])
class CurrencyHistoryDao extends DatabaseAccessor<Database> with _$CurrencyHistoryDaoMixin {
  CurrencyHistoryDao(Database db) : super(db);

  // DB exceptions are not handled. Ideally, rework to use Either as for the remote fetching
  Future<List<CurrencyHistoryModel>> fetchHistoryLimited(int limit, {int? offset, required String key}) async {
    final query = selectOnly(exchangeRateTable)
      ..addColumns([
        currenciesTable.name,
        exchangeRateTable.exchangeRate,
        exchangeRateTable.timestamp,
        currenciesTable.flag,
        exchangeRateTable.id,
      ])
      ..join([innerJoin(currenciesTable, currenciesTable.key.equalsExp(exchangeRateTable.key))])
      ..where(exchangeRateTable.key.equals(key))
      ..limit(limit, offset: offset);

    final results = await query.get();

    return results.map((r) => _typedResultToModel(r)).toList();
  }

  CurrencyHistoryModel _typedResultToModel(TypedResult result) => CurrencyHistoryModel(
        name: result.read(currenciesTable.name) ?? '',
        exchangeRate: result.read(exchangeRateTable.exchangeRate) ?? -1,
        timestamp: result.read(exchangeRateTable.timestamp) ?? -1,
        flag: result.read(currenciesTable.flag) ?? '',
        id: result.read(exchangeRateTable.id) ?? -1,
      );
}
