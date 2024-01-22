import 'package:exchange_currency_rates_app/core/config/environment.dart';
import 'package:exchange_currency_rates_app/core/usecase.dart';

final class CalculatePeriodicRequestsIntervalUseCase extends UseCase<int, int> {
  @override
  int call(int params) {
    final seconds = DateTime.fromMillisecondsSinceEpoch(params)
        .add(const Duration(seconds: Env.currencyRequestsIntervalSec))
        .difference(DateTime.now())
        .inSeconds;

    return seconds > 5 ? seconds : 5;
  }
}
