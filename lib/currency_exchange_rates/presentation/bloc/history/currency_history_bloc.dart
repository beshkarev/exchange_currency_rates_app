import 'package:exchange_currency_rates_app/currency_exchange_rates/domain/usecases/fetch_currency_hystory_usecase.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/presentation/bloc/history/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyHistoryBloc extends Bloc<CurrencyHistoryEvent, CurrencyHistoryState> {
  CurrencyHistoryBloc({
    required this.fetchCurrencyHistoryUseCase,
  }) : super(const CurrencyHistoryLoadingState()) {
    on(_onEvent);
  }

  final FetchCurrencyHistoryUseCase fetchCurrencyHistoryUseCase;

  Future _onEvent(CurrencyHistoryEvent event, Emitter<CurrencyHistoryState> emit) async {
    switch (event) {
      case CurrencyHistoryFetch():
        final currencies = await fetchCurrencyHistoryUseCase(
          FetchCurrencyHistoryParams(
            limit: event.limit,
            offset: event.offset,
            key: event.key,
          ),
        );

        emit(CurrencyHistoryLoadedState(currencies: currencies));
        break;
    }
  }
}
