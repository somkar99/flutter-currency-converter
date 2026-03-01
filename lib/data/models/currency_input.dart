class CurrencyInput {
  final String currency;
  final double amount;

  CurrencyInput({
    this.currency = "USD",
    this.amount = 0.0,
  });

  CurrencyInput copyWith({
    String? currency,
    double? amount,
  }) {
    return CurrencyInput(
      currency: currency ?? this.currency,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currency': currency,
      'amount': amount,
    };
  }

  factory CurrencyInput.fromJson(Map<String, dynamic> json) {
    return CurrencyInput(
      currency: json['currency'] ?? "USD",
      amount: (json['amount'] ?? 0).toDouble(),
    );
  }

  @override
  String toString() {
    return 'CurrencyInput(currency: $currency, amount: $amount)';
  }
}