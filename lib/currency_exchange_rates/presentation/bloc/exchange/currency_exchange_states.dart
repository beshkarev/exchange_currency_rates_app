import 'package:equatable/equatable.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/domain/entities/currency_entity.dart';

sealed class CurrencyExchangeState extends Equatable {
  const CurrencyExchangeState();

  @override
  List<Object?> get props => [];
}

class CurrencyLoadingState extends CurrencyExchangeState {
  const CurrencyLoadingState();
}

class CurrencyLoadedState extends CurrencyExchangeState {
  const CurrencyLoadedState({required this.currencies});

  final List<CurrencyEntity> currencies;

  @override
  List<Object?> get props => [currencies];
}
