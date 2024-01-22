// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currencies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrenciesModel _$CurrenciesModelFromJson(Map<String, dynamic> json) =>
    CurrenciesModel(
      currencies: const CustomCurrenciesModelConverter()
          .fromJson(json['currencies'] as List),
      timestamp: json['timestamp'] as int,
    );
