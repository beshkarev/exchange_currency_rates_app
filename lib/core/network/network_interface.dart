typedef JsonMap = Map<String, dynamic>;

abstract class INetwork {
  Future<JsonMap> fetchCurrencies();
}
