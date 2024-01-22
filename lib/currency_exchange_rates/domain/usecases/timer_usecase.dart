import 'dart:async';

import 'package:exchange_currency_rates_app/core/usecase.dart';
import 'package:flutter/cupertino.dart';

class PeriodicRequestsInputParam {
  const PeriodicRequestsInputParam({
    required this.seconds,
    required this.onTimer,
  });

  final int seconds;
  final VoidCallback onTimer;
}

final class TimerUseCase extends UseCase<void, PeriodicRequestsInputParam> {
  Timer? timer;

  @override
  void call(PeriodicRequestsInputParam params) {
    timer?.cancel();
    timer = Timer(Duration(seconds: params.seconds), params.onTimer);
  }

  void cancel() => timer?.cancel();
}
