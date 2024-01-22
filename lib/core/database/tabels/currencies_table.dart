import 'package:drift/drift.dart';

class CurrenciesTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get key => text().unique()();

  TextColumn get name => text()();

  TextColumn get flag => text()();
}
