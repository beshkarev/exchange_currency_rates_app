import 'package:exchange_currency_rates_app/core/constants/route_paths.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/presentation/view/currency_history_view.dart';
import 'package:flutter/material.dart';

Route generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutePaths.currencyHistoryScreen:
      return MaterialPageRoute(
        settings: const RouteSettings(name: RoutePaths.currencyHistoryScreen),
        builder: (_) => CurrencyHistoryView(
          currencyKey: settings.arguments as String,
        ),
      );
    default:
      throw ArgumentError('Routes for path "${settings.name}" are not registered');
  }
}
