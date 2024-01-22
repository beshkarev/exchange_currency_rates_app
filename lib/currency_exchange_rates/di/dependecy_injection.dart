import 'package:exchange_currency_rates_app/core/database/dao/currency_history/currency_history_dao.dart';
import 'package:exchange_currency_rates_app/core/database/drift_database_client.dart';
import 'package:exchange_currency_rates_app/core/di/dependencies.dart';
import 'package:exchange_currency_rates_app/core/network/dio_client.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/data/datasource/local_currency_datasource.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/data/datasource/remote_currency_datasource.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/data/repository/currency_repository.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/domain/usecases/calculate_periodic_requests_interval_usecase.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/domain/usecases/fetch_currencies_usecase.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/domain/usecases/fetch_currency_hystory_usecase.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/domain/usecases/save_currencies_locally_usecase.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/domain/usecases/timer_usecase.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/presentation/bloc/exchange/currency_exchange_bloc.dart';
import 'package:exchange_currency_rates_app/currency_exchange_rates/presentation/bloc/history/currency_history_bloc.dart';

class CurrencyExchangeDI {
  static const scopeName = 'CurrencyExchangeDI';

  static void init() {
    locator.pushNewScope(
      scopeName: scopeName,
      init: (locator) {
        locator.registerLazySingleton(
          () => CurrencyHistoryDao(locator()),
        );

        locator.registerLazySingleton(
          () => DriftDatabaseClient(
            database: locator(),
            currencyHistoryDao: locator(),
          ),
        );

        locator.registerLazySingleton(
          () => RemoteCurrencyDatasource(network: locator<DioClient>()),
        );

        locator.registerLazySingleton(
          () => LocalCurrencyDatasource(database: locator<DriftDatabaseClient>()),
        );

        locator.registerLazySingleton(
          () => CurrencyRepository(
            remoteDatasource: locator<RemoteCurrencyDatasource>(),
            localDatasource: locator<LocalCurrencyDatasource>(),
          ),
        );

        locator.registerLazySingleton(
          () => TimerUseCase(),
        );

        locator.registerLazySingleton(
          () => FetchCurrenciesUseCase(
            currencyRepository: locator<CurrencyRepository>(),
          ),
        );

        locator.registerLazySingleton(
          () => CalculatePeriodicRequestsIntervalUseCase(),
        );

        locator.registerLazySingleton(
          () => SaveCurrenciesLocallyUseCase(
            repository: locator<CurrencyRepository>(),
          ),
        );

        locator.registerLazySingleton(
          () => CurrencyExchangeBloc(
            fetchCurrenciesUseCase: locator(),
            timerUseCase: locator(),
            periodicRequestsIntervalUseCase: locator(),
            saveCurrenciesLocallyUseCase: locator(),
          ),
        );

        locator.registerLazySingleton(
          () => FetchCurrencyHistoryUseCase(
            repository: locator<CurrencyRepository>(),
          ),
        );

        locator.registerLazySingleton(
          () => CurrencyHistoryBloc(
            fetchCurrencyHistoryUseCase: locator(),
          ),
        );
      },
    );
  }

  static void dispose() {
    locator.dropScope(scopeName);
  }
}
