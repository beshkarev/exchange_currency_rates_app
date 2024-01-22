import 'package:exchange_currency_rates_app/currency_exchange_rates/domain/entities/currency_entity.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/presentation/widgets/currencies_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CurrenciesListLoadingWidget extends StatelessWidget {
  const CurrenciesListLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.grey,
      child: const CurrenciesListWidget(
        currencies: [
          CurrencyEntity(
            key: '',
            name: 'US Dollar',
            flag: '🇺🇸',
            exchange: 3.650125948841588,
          ),
          CurrencyEntity(
            key: '',
            name: 'Euro',
            flag: '🇪🇺',
            exchange: 4.123046100484634,
          ),
          CurrencyEntity(
            key: '',
            name: 'British Pound',
            flag: '🇬🇧',
            exchange: 4.227572489348983,
          ),
          CurrencyEntity(
            key: '',
            name: 'Japanese Yen',
            flag: '🇯🇵',
            exchange: 0.027931576700841676,
          ),
        ],
      ),
    );
  }
}
