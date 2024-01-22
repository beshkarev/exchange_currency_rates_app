import 'package:exchange_currency_rates_app/currency_exchange_rates/domain/entities/currency_entity.dart';

class CurrenciesEntity {
  const CurrenciesEntity({
    required this.currencies,
    required this.timestamp,
  });

  final List<CurrencyEntity> currencies;
  final int timestamp;
}
