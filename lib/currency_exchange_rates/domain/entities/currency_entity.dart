class CurrencyEntity {
  const CurrencyEntity({
    required this.key,
    required this.name,
    required this.exchange,
    required this.flag,
  });

  final String key;
  final String name;
  final double exchange;
  final String flag;
}
