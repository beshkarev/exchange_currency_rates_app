// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CurrenciesTableTable extends CurrenciesTable
    with TableInfo<$CurrenciesTableTable, CurrenciesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CurrenciesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _flagMeta = const VerificationMeta('flag');
  @override
  late final GeneratedColumn<String> flag = GeneratedColumn<String>(
      'flag', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, key, name, flag];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'currencies_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<CurrenciesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('flag')) {
      context.handle(
          _flagMeta, flag.isAcceptableOrUnknown(data['flag']!, _flagMeta));
    } else if (isInserting) {
      context.missing(_flagMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CurrenciesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CurrenciesTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      flag: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}flag'])!,
    );
  }

  @override
  $CurrenciesTableTable createAlias(String alias) {
    return $CurrenciesTableTable(attachedDatabase, alias);
  }
}

class CurrenciesTableData extends DataClass
    implements Insertable<CurrenciesTableData> {
  final int id;
  final String key;
  final String name;
  final String flag;
  const CurrenciesTableData(
      {required this.id,
      required this.key,
      required this.name,
      required this.flag});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['key'] = Variable<String>(key);
    map['name'] = Variable<String>(name);
    map['flag'] = Variable<String>(flag);
    return map;
  }

  CurrenciesTableCompanion toCompanion(bool nullToAbsent) {
    return CurrenciesTableCompanion(
      id: Value(id),
      key: Value(key),
      name: Value(name),
      flag: Value(flag),
    );
  }

  factory CurrenciesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CurrenciesTableData(
      id: serializer.fromJson<int>(json['id']),
      key: serializer.fromJson<String>(json['key']),
      name: serializer.fromJson<String>(json['name']),
      flag: serializer.fromJson<String>(json['flag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'key': serializer.toJson<String>(key),
      'name': serializer.toJson<String>(name),
      'flag': serializer.toJson<String>(flag),
    };
  }

  CurrenciesTableData copyWith(
          {int? id, String? key, String? name, String? flag}) =>
      CurrenciesTableData(
        id: id ?? this.id,
        key: key ?? this.key,
        name: name ?? this.name,
        flag: flag ?? this.flag,
      );
  @override
  String toString() {
    return (StringBuffer('CurrenciesTableData(')
          ..write('id: $id, ')
          ..write('key: $key, ')
          ..write('name: $name, ')
          ..write('flag: $flag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, key, name, flag);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CurrenciesTableData &&
          other.id == this.id &&
          other.key == this.key &&
          other.name == this.name &&
          other.flag == this.flag);
}

class CurrenciesTableCompanion extends UpdateCompanion<CurrenciesTableData> {
  final Value<int> id;
  final Value<String> key;
  final Value<String> name;
  final Value<String> flag;
  const CurrenciesTableCompanion({
    this.id = const Value.absent(),
    this.key = const Value.absent(),
    this.name = const Value.absent(),
    this.flag = const Value.absent(),
  });
  CurrenciesTableCompanion.insert({
    this.id = const Value.absent(),
    required String key,
    required String name,
    required String flag,
  })  : key = Value(key),
        name = Value(name),
        flag = Value(flag);
  static Insertable<CurrenciesTableData> custom({
    Expression<int>? id,
    Expression<String>? key,
    Expression<String>? name,
    Expression<String>? flag,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (key != null) 'key': key,
      if (name != null) 'name': name,
      if (flag != null) 'flag': flag,
    });
  }

  CurrenciesTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? key,
      Value<String>? name,
      Value<String>? flag}) {
    return CurrenciesTableCompanion(
      id: id ?? this.id,
      key: key ?? this.key,
      name: name ?? this.name,
      flag: flag ?? this.flag,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (flag.present) {
      map['flag'] = Variable<String>(flag.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CurrenciesTableCompanion(')
          ..write('id: $id, ')
          ..write('key: $key, ')
          ..write('name: $name, ')
          ..write('flag: $flag')
          ..write(')'))
        .toString();
  }
}

class $ExchangeRateTableTable extends ExchangeRateTable
    with TableInfo<$ExchangeRateTableTable, ExchangeRateTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExchangeRateTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES currencies_table ("key")'));
  static const VerificationMeta _exchangeRateMeta =
      const VerificationMeta('exchangeRate');
  @override
  late final GeneratedColumn<double> exchangeRate = GeneratedColumn<double>(
      'exchange_rate', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<int> timestamp = GeneratedColumn<int>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, key, exchangeRate, timestamp];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'exchange_rate_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<ExchangeRateTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('exchange_rate')) {
      context.handle(
          _exchangeRateMeta,
          exchangeRate.isAcceptableOrUnknown(
              data['exchange_rate']!, _exchangeRateMeta));
    } else if (isInserting) {
      context.missing(_exchangeRateMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExchangeRateTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExchangeRateTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      exchangeRate: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}exchange_rate'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}timestamp'])!,
    );
  }

  @override
  $ExchangeRateTableTable createAlias(String alias) {
    return $ExchangeRateTableTable(attachedDatabase, alias);
  }
}

class ExchangeRateTableData extends DataClass
    implements Insertable<ExchangeRateTableData> {
  final int id;
  final String key;
  final double exchangeRate;
  final int timestamp;
  const ExchangeRateTableData(
      {required this.id,
      required this.key,
      required this.exchangeRate,
      required this.timestamp});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['key'] = Variable<String>(key);
    map['exchange_rate'] = Variable<double>(exchangeRate);
    map['timestamp'] = Variable<int>(timestamp);
    return map;
  }

  ExchangeRateTableCompanion toCompanion(bool nullToAbsent) {
    return ExchangeRateTableCompanion(
      id: Value(id),
      key: Value(key),
      exchangeRate: Value(exchangeRate),
      timestamp: Value(timestamp),
    );
  }

  factory ExchangeRateTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExchangeRateTableData(
      id: serializer.fromJson<int>(json['id']),
      key: serializer.fromJson<String>(json['key']),
      exchangeRate: serializer.fromJson<double>(json['exchangeRate']),
      timestamp: serializer.fromJson<int>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'key': serializer.toJson<String>(key),
      'exchangeRate': serializer.toJson<double>(exchangeRate),
      'timestamp': serializer.toJson<int>(timestamp),
    };
  }

  ExchangeRateTableData copyWith(
          {int? id, String? key, double? exchangeRate, int? timestamp}) =>
      ExchangeRateTableData(
        id: id ?? this.id,
        key: key ?? this.key,
        exchangeRate: exchangeRate ?? this.exchangeRate,
        timestamp: timestamp ?? this.timestamp,
      );
  @override
  String toString() {
    return (StringBuffer('ExchangeRateTableData(')
          ..write('id: $id, ')
          ..write('key: $key, ')
          ..write('exchangeRate: $exchangeRate, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, key, exchangeRate, timestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExchangeRateTableData &&
          other.id == this.id &&
          other.key == this.key &&
          other.exchangeRate == this.exchangeRate &&
          other.timestamp == this.timestamp);
}

class ExchangeRateTableCompanion
    extends UpdateCompanion<ExchangeRateTableData> {
  final Value<int> id;
  final Value<String> key;
  final Value<double> exchangeRate;
  final Value<int> timestamp;
  const ExchangeRateTableCompanion({
    this.id = const Value.absent(),
    this.key = const Value.absent(),
    this.exchangeRate = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  ExchangeRateTableCompanion.insert({
    this.id = const Value.absent(),
    required String key,
    required double exchangeRate,
    required int timestamp,
  })  : key = Value(key),
        exchangeRate = Value(exchangeRate),
        timestamp = Value(timestamp);
  static Insertable<ExchangeRateTableData> custom({
    Expression<int>? id,
    Expression<String>? key,
    Expression<double>? exchangeRate,
    Expression<int>? timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (key != null) 'key': key,
      if (exchangeRate != null) 'exchange_rate': exchangeRate,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  ExchangeRateTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? key,
      Value<double>? exchangeRate,
      Value<int>? timestamp}) {
    return ExchangeRateTableCompanion(
      id: id ?? this.id,
      key: key ?? this.key,
      exchangeRate: exchangeRate ?? this.exchangeRate,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (exchangeRate.present) {
      map['exchange_rate'] = Variable<double>(exchangeRate.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<int>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExchangeRateTableCompanion(')
          ..write('id: $id, ')
          ..write('key: $key, ')
          ..write('exchangeRate: $exchangeRate, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  late final $CurrenciesTableTable currenciesTable =
      $CurrenciesTableTable(this);
  late final $ExchangeRateTableTable exchangeRateTable =
      $ExchangeRateTableTable(this);
  late final CurrencyHistoryDao currencyHistoryDao =
      CurrencyHistoryDao(this as Database);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [currenciesTable, exchangeRateTable];
}
