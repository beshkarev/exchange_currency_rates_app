// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyModel _$CurrencyModelFromJson(Map<String, dynamic> json) =>
    CurrencyModel(
      key: json['key'] as String,
      name: json['name'] as String,
      exchange: (json['exchange'] as num).toDouble(),
      flag: json['flag'] as String,
    );

Map<String, dynamic> _$CurrencyModelToJson(CurrencyModel instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'exchange': instance.exchange,
      'flag': instance.flag,
    };
