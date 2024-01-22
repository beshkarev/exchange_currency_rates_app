import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:exchange_currency_rates_app/core/failure.dart';
import 'package:exchange_currency_rates_app/core/usecase.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/domain/entities/currencies_entity.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/domain/repository/currency_repository_contract.dart';

final class FetchCurrenciesUseCase extends UseCase<Future<Either<Failure, CurrenciesEntity>>, NoParams> {
  const FetchCurrenciesUseCase({required this.currencyRepository});

  final ICurrencyRepository currencyRepository;

  @override
  Future<Either<Failure, CurrenciesEntity>> call(params) async {
    final currencies = await currencyRepository.fetchCurrencies();
    return currencies.fold(
      (failure) => Left(failure),
      (result) => Right(result),
    );
  }
}
