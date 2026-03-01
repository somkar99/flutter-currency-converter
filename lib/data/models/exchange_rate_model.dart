class ExchangeRateModel {
  final String base;
  final Map<String, dynamic> rates;
  final DateTime timestamp;

  ExchangeRateModel({
    required this.base,
    required this.rates,
    required this.timestamp,
  });

  factory ExchangeRateModel.fromJson(Map<String, dynamic> json) {
    return ExchangeRateModel(
      base: json["base"],
      rates: Map<String, dynamic>.from(json["rates"]),
      timestamp: DateTime.fromMillisecondsSinceEpoch(
        json["timestamp"] * 1000,
      ),
    );
  }
}