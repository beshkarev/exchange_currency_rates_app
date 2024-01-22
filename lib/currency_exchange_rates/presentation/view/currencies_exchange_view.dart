import 'package:exchange_currency_rates_app/core/di/dependencies.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/di/dependecy_injection.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/presentation/bloc/exchange/bloc.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/presentation/widgets/currencies_list_loading_widget.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/presentation/widgets/currencies_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrenciesExchangeView extends StatefulWidget {
  const CurrenciesExchangeView({super.key});

  @override
  State<StatefulWidget> createState() => _CurrenciesExchangeViewState();
}

class _CurrenciesExchangeViewState extends State<CurrenciesExchangeView> {
  @override
  void initState() {
    CurrencyExchangeDI.init();
    super.initState();
  }

  @override
  void dispose() {
    CurrencyExchangeDI.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CurrencyExchangeBloc>.value(
      value: locator()..add(const FetchCurrenciesEvent()),
      child: BlocBuilder<CurrencyExchangeBloc, CurrencyExchangeState>(
        builder: (context, state) {
          switch (state) {
            case CurrencyLoadingState():
              return const CurrenciesListLoadingWidget();

            case CurrencyLoadedState():
              return CurrenciesListWidget(currencies: state.currencies);
          }
        },
      ),
    );
  }
}
