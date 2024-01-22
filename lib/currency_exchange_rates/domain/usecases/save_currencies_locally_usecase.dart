import 'package:exchange_currency_rates_app/core/usecase.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/domain/entities/currencies_entity.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/domain/repository/currency_repository_contract.dart';

final class SaveCurrenciesLocallyUseCase extends UseCase<void, CurrenciesEntity> {
  const SaveCurrenciesLocallyUseCase({required this.repository});

  final ICurrencyRepository repository;

  @override
  void call(CurrenciesEntity params) {
    repository.saveCurrencyDataLocally(params);
  }
}
