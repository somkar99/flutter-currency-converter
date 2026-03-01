import 'package:currency_converter/presentation/state/exchange_state.dart';
import '../../core/utils/currency_calculator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../data/models/currency_input.dart';
import '../../domain/repositories/exchange_repository.dart';

class ExchangeViewModel extends StateNotifier<ExchangeState> {
  final ExchangeRepository repository;

  ExchangeViewModel(this.repository) : super(ExchangeState.initial());

  Future<void> loadRates() async {
    try {
      state = state.copyWith(isLoading: true);

      final rates = await repository.getRates(state.baseCurrency);

      state = state.copyWith(
        isLoading: false,
        rates: rates,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> loadCurrencies() async {
    try {
      final currencies = await repository.getCurrencies();

      state = state.copyWith(
        currencies: currencies,
      );
    } catch (e) {
      state = state.copyWith(
        error: e.toString(),
      );
    }
  }

  /// Calculate Total in Base Currency
  void calculateTotal() {
    final total = CurrencyCalculator.calculateTotal(
      inputs: state.inputs,
      rates: state.rates ?? {},
    );

    state = state.copyWith(total: total);
  }

  /// Update Base Currency
  void updateBaseCurrency(String currency) {
    state = state.copyWith(baseCurrency: currency);
  }

  /// Add new currency row
  void addCurrency() {
    final updatedInputs = [...state.inputs, CurrencyInput()];
    state = state.copyWith(inputs: updatedInputs);
  }

  /// Remove currency row
  void removeCurrency(int index) {
    final updatedInputs = [...state.inputs];
    updatedInputs.removeAt(index);

    state = state.copyWith(inputs: updatedInputs);
  }

  /// Update amount
  void updateAmount(int index, double amount) {
    final updatedInputs = [...state.inputs];

    updatedInputs[index] =
        updatedInputs[index].copyWith(amount: amount);

    state = state.copyWith(inputs: updatedInputs);
  }

  /// Update selected currency
  void updateCurrency(int index, String currency) {
    final updatedInputs = [...state.inputs];

    updatedInputs[index] =
        updatedInputs[index].copyWith(currency: currency);

    state = state.copyWith(inputs: updatedInputs);
  }
}