class CurrencyHistoryEntity {
  const CurrencyHistoryEntity({
    required this.name,
    required this.exchangeRate,
    required this.timestamp,
    required this.flag,
    required this.id,
  });

  final String name;
  final double exchangeRate;
  final int timestamp;
  final String flag;
  final int id;
}
