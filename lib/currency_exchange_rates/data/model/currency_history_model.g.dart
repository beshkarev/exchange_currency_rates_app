// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyHistoryModel _$CurrencyHistoryModelFromJson(
        Map<String, dynamic> json) =>
    CurrencyHistoryModel(
      name: json['name'] as String,
      exchangeRate: (json['exchangeRate'] as num).toDouble(),
      timestamp: json['timestamp'] as int,
      flag: json['flag'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$CurrencyHistoryModelToJson(
        CurrencyHistoryModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'exchangeRate': instance.exchangeRate,
      'timestamp': instance.timestamp,
      'flag': instance.flag,
      'id': instance.id,
    };
