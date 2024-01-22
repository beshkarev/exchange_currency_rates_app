import 'dart:async';

import 'package:exchange_currency_rates_app/core/usecase.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/domain/usecases/calculate_periodic_requests_interval_usecase.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/domain/usecases/fetch_currencies_usecase.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/domain/usecases/save_currencies_locally_usecase.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/domain/usecases/timer_usecase.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/presentation/bloc/exchange/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyExchangeBloc extends Bloc<CurrencyExchangeEvent, CurrencyExchangeState> {
  CurrencyExchangeBloc({
    required this.fetchCurrenciesUseCase,
    required this.timerUseCase,
    required this.periodicRequestsIntervalUseCase,
    required this.saveCurrenciesLocallyUseCase,
  }) : super(const CurrencyLoadingState()) {
    on(_onEvent);
  }

  final FetchCurrenciesUseCase fetchCurrenciesUseCase;
  final TimerUseCase timerUseCase;
  final CalculatePeriodicRequestsIntervalUseCase periodicRequestsIntervalUseCase;
  final SaveCurrenciesLocallyUseCase saveCurrenciesLocallyUseCase;

  Future<void> _onEvent(CurrencyExchangeEvent event, Emitter<CurrencyExchangeState> emit) async {
    switch (event) {
      case FetchCurrenciesEvent():
        final response = await fetchCurrenciesUseCase(const NoParams());

        response.fold(
          (l) => null,
          (r) {
            timerUseCase(
              PeriodicRequestsInputParam(
                seconds: periodicRequestsIntervalUseCase(r.timestamp),
                onTimer: () => add(const FetchCurrenciesEvent()),
              ),
            );

            saveCurrenciesLocallyUseCase(r);

            emit(CurrencyLoadedState(currencies: r.currencies));
          },
        );
        break;
    }
  }

  @override
  Future<void> close() {
    timerUseCase.cancel();
    return super.close();
  }
}
