import 'package:exchange_currency_rates_app/currency_exchange_rates/domain/entities/currency_entity.dart';
import 'package:flutter/material.dart';

class CurrencyWidget extends StatelessWidget {
  const CurrencyWidget({required this.currency, super.key});

  final CurrencyEntity currency;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          currency.flag,
          style: const TextStyle(fontSize: 50),
        ),
        Text(
          currency.name,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Text(
          currency.exchange.toStringAsFixed(2),
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ],
    );
  }
}
