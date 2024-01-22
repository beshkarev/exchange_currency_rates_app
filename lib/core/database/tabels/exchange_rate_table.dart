import 'package:drift/drift.dart';
import 'package:exchange_currency_rates_app/core/database/tabels/currencies_table.dart';

class ExchangeRateTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get key => text().references(CurrenciesTable, #key)();

  RealColumn get exchangeRate => real()();

  IntColumn get timestamp => integer()();
}
