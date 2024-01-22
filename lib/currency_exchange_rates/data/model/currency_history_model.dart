import 'package:exchange_currency_rates_app/currency_exchange_rates/domain/entities/currency_history_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'currency_history_model.g.dart';

@JsonSerializable()
class CurrencyHistoryModel extends CurrencyHistoryEntity {
  CurrencyHistoryModel({
    required super.name,
    required super.exchangeRate,
    required super.timestamp,
    required super.flag,
    required super.id,
  });
}
