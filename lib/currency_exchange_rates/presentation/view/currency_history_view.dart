import 'package:exchange_currency_rates_app/core/di/dependencies.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/presentation/bloc/history/currency_history_bloc.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/presentation/widgets/currency_history_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyHistoryView extends StatelessWidget {
  const CurrencyHistoryView({required this.currencyKey, super.key});

  final String currencyKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('History'),
      ),
      body: BlocProvider<CurrencyHistoryBloc>.value(
        value: locator(),
        child: CurrencyHistoryWidget(currencyKey: currencyKey),
      ),
    );
  }
}
