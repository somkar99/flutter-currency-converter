class ExchangeRatesResponse {
  final bool success;
  final String base;
  final Map<String, dynamic> rates;

  ExchangeRatesResponse({
    required this.success,
    required this.base,
    required this.rates,
  });

  factory ExchangeRatesResponse.fromJson(Map<String, dynamic> json) {
    return ExchangeRatesResponse(
      success: json["success"],
      base: json["base"],
      rates: Map<String, dynamic>.from(json["rates"]),
    );
  }
}