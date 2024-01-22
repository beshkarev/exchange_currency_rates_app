import 'package:equatable/equatable.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/domain/entities/currency_history_entity.dart';

sealed class CurrencyHistoryState extends Equatable {
  const CurrencyHistoryState();

  @override
  List<Object?> get props => [];
}

class CurrencyHistoryLoadingState extends CurrencyHistoryState {
  const CurrencyHistoryLoadingState();
}

class CurrencyHistoryLoadedState extends CurrencyHistoryLoadingState {
  const CurrencyHistoryLoadedState({required this.currencies});

  final List<CurrencyHistoryEntity> currencies;

  @override
  List<Object?> get props => [currencies];
}
