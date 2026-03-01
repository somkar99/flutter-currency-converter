class CurrencyCalculator {
  static double calculateTotal({
    required List inputs,
    required Map<String, dynamic> rates,
  }) {
    double total = 0;

    for (final input in inputs) {
      final rate = rates[input.currency] ?? 0;
      total += input.amount * rate;
    }

    return total;
  }
}