import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_dev/api/migrations.dart';
import 'package:exchange_currency_rates_app/core/database/dao/currency_history/currency_history_dao.dart';
import 'package:exchange_currency_rates_app/core/database/tabels/currencies_table.dart';
import 'package:exchange_currency_rates_app/core/database/tabels/exchange_rate_table.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'database.g.dart';

@DriftDatabase(tables: [CurrenciesTable, ExchangeRateTable], daos: [CurrencyHistoryDao])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async => await m.createAll(),
      beforeOpen: (details) async {
        // Make sure that foreign keys are enabled
        await customStatement('PRAGMA foreign_keys = ON');

        // This follows the recommendation to validate that the database schema
        // matches what drift expects (https://drift.simonbinder.eu/docs/advanced-features/migrations/#verifying-a-database-schema-at-runtime).
        // It allows catching bugs in the migration logic early.
        if (kDebugMode) {
          // This check pulls in a fair amount of code that's not needed
          // anywhere else, so we recommend only doing it in debug builds.
          await validateDatabaseSchema();
        }
      },
    );
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(join(dbFolder.path, 'db.sqlite'));

    // Also work around limitations on old Android versions
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    // Make sqlite3 pick a more suitable location for temporary files - the
    // one from the system may be inaccessible due to sandboxing.
    final cachebase = (await getTemporaryDirectory()).path;
    // We can't access /tmp on Android, which sqlite3 would try by default.
    // Explicitly tell it about the correct temporary directory.
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file, logStatements: kDebugMode);
  });
}
