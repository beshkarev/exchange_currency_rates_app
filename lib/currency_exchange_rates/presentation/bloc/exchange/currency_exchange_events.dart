import 'package:equatable/equatable.dart';

sealed class CurrencyExchangeEvent extends Equatable {
  const CurrencyExchangeEvent();

  @override
  List<Object?> get props => [];
}

class FetchCurrenciesEvent extends CurrencyExchangeEvent {
  const FetchCurrenciesEvent();
}
