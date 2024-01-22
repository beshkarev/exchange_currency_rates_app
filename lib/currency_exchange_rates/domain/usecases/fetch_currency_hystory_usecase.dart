import 'package:exchange_currency_rates_app/core/usecase.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/domain/entities/currency_history_entity.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/domain/repository/currency_repository_contract.dart';

class FetchCurrencyHistoryParams {
  const FetchCurrencyHistoryParams({
    required this.limit,
    required this.offset,
    required this.key,
  });

  final int limit;
  final int? offset;
  final String key;
}

final class FetchCurrencyHistoryUseCase
    extends UseCase<Future<List<CurrencyHistoryEntity>>, FetchCurrencyHistoryParams> {
  const FetchCurrencyHistoryUseCase({required this.repository});

  final ICurrencyRepository repository;

  @override
  Future<List<CurrencyHistoryEntity>> call(FetchCurrencyHistoryParams params) {
    return repository.fetchCurrenciesHistoryLimited(params.limit, offset: params.offset, key: params.key);
  }
}
