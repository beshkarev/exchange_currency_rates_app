import 'package:exchange_currency_rates_app/core/constants/route_paths.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/domain/entities/currency_entity.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/presentation/widgets/currency_widget.dart';
import 'package:flutter/material.dart';

class CurrenciesListWidget extends StatelessWidget {
  const CurrenciesListWidget({required this.currencies, super.key});

  final List<CurrencyEntity> currencies;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => InkWell(
        onTap: () => Navigator.of(context).pushNamed(
          RoutePaths.currencyHistoryScreen,
          arguments: currencies[index].key,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CurrencyWidget(currency: currencies[index]),
        ),
      ),
      separatorBuilder: (_, __) => Divider(
        indent: 10,
        endIndent: 10,
        color: Colors.grey.withOpacity(0.3),
      ),
      itemCount: currencies.length,
    );
  }
}
