import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:currency_converter/presentation/viewmodels/exchange_viewmodel.dart';
import 'package:currency_converter/presentation/state/exchange_state.dart';
import 'package:currency_converter/domain/repositories/exchange_repository.dart';
import 'package:currency_converter/data/models/currency_input.dart';

class MockExchangeRepository extends Mock implements ExchangeRepository {}

void main() {
  late ExchangeViewModel viewModel;
  late MockExchangeRepository repository;

  setUp(() {
    repository = MockExchangeRepository();
    viewModel = ExchangeViewModel(repository);
  });

  group('ExchangeViewModel Tests', () {
    test('initial state is correct', () {
      expect(viewModel.state, isA<ExchangeState>());
      expect(viewModel.state.inputs, []);
      expect(viewModel.state.total, 0);
    });

    test('loadRates updates rates in state', () async {
      final mockRates = {"USD": 1.0, "EUR": 0.9, "INR": 83.0};

      when(() => repository.getRates(any())).thenAnswer((_) async => mockRates);

      await viewModel.loadRates();

      expect(viewModel.state.rates, mockRates);
      expect(viewModel.state.isLoading, false);
    });

    test('loadCurrencies updates currencies in state', () async {
      final currencies = {
        "USD": "United States Dollar",
        "EUR": "Euro",
        "INR": "Indian Rupee",
      };

      when(
        () => repository.getCurrencies(),
      ).thenAnswer((_) async => currencies);

      await viewModel.loadCurrencies();

      expect(viewModel.state.currencies, currencies);
    });

    test('addCurrency adds a new currency row', () {
      viewModel.addCurrency();

      expect(viewModel.state.inputs.length, 1);
      expect(viewModel.state.inputs.first, isA<CurrencyInput>());
    });

    test('removeCurrency removes currency row', () {
      viewModel.addCurrency();
      viewModel.addCurrency();

      viewModel.removeCurrency(0);

      expect(viewModel.state.inputs.length, 1);
    });

    test('updateAmount updates amount correctly', () {
      viewModel.addCurrency();

      viewModel.updateAmount(0, 200);

      expect(viewModel.state.inputs[0].amount, 200);
    });

    test('updateCurrency updates currency correctly', () {
      viewModel.addCurrency();

      viewModel.updateCurrency(0, "EUR");

      expect(viewModel.state.inputs[0].currency, "EUR");
    });

    test('calculateTotal calculates correct total', () {
      viewModel.addCurrency();

      viewModel.updateCurrency(0, "EUR");
      viewModel.updateAmount(0, 100);

      viewModel.state = viewModel.state.copyWith(rates: {"EUR": 0.9});

      viewModel.calculateTotal();

      expect(viewModel.state.total, 90);
    });
  });
}
