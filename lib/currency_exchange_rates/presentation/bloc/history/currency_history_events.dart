import 'package:equatable/equatable.dart';

sealed class CurrencyHistoryEvent extends Equatable {
  const CurrencyHistoryEvent();

  @override
  List<Object?> get props => [];
}

class CurrencyHistoryFetch extends CurrencyHistoryEvent {
  const CurrencyHistoryFetch(this.limit, {required this.offset, required this.key});

  final int limit;
  final int? offset;
  final String key;

  @override
  List<Object?> get props => [limit, offset, key];
}
