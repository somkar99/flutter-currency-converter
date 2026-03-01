import '../../data/models/currency_input.dart';

class ExchangeState {
  final bool isLoading;
  final Map<String, dynamic> rates;
  final List<CurrencyInput> inputs;
  final Map<String, String> currencies;
  final String baseCurrency;
  final double total;
  final String? error;


  ExchangeState({
    required this.isLoading,
    required this.rates,
    required this.inputs,
    this.total = 0,
    required this.baseCurrency,
    required this.currencies,
    this.error,
  });

  factory ExchangeState.initial() {
    return ExchangeState(
      isLoading: false,
      rates: {},
      currencies: {},
      inputs: [],
      total: 0,
      baseCurrency: "USD",
    );
  }

  ExchangeState copyWith({
    bool? isLoading,
    Map<String, dynamic>? rates,
    List<CurrencyInput>? inputs,
    String? baseCurrency,
    Map<String, String>? currencies,
    double? total,
    String? error,
  }) {
    return ExchangeState(
      isLoading: isLoading ?? this.isLoading,
      rates: rates ?? this.rates,
      inputs: inputs ?? this.inputs,
      total: total ?? this.total,
      currencies: currencies??this.currencies,
      baseCurrency: baseCurrency ?? this.baseCurrency,
      error: error ?? this.error,
    );
  }
}