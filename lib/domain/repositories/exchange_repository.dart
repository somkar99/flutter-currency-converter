abstract class ExchangeRepository {
  Future<Map<String, dynamic>> getRates(String base);

  Future<Map<String, String>> getCurrencies();
}