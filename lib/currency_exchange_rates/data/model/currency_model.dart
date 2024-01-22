import 'package:exchange_currency_rates_app/core/network/network_interface.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/domain/entities/currency_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'currency_model.g.dart';

@JsonSerializable()
class CurrencyModel extends CurrencyEntity {
  CurrencyModel({
    required super.key,
    required super.name,
    required super.exchange,
    required super.flag,
  });

  factory CurrencyModel.fromJson(JsonMap json) => _$CurrencyModelFromJson(json);
}
