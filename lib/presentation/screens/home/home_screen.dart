import 'package:currency_converter/presentation/providers/app_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/routes/app_router.dart';
import '../../widgets/currency_input_row.dart';
import '../settings/settings_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(exchangeViewModelProvider);
    final vm = ref.read(exchangeViewModelProvider.notifier);


    return Scaffold(
      appBar: AppBar(
        title: const Text("Currency Converter"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppRouter.settings,
              );
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await  vm.loadCurrencies();

          vm.addCurrency();
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            Expanded(
              child: ListView.builder(
                itemCount: state.inputs.length,
                itemBuilder: (_, i) {
                  final input = state.inputs[i];

                  return CurrencyInputRow(
                      input: input,
                      index: i,
                      currencies: state.currencies,
                      onAmountChanged: (v) => vm.updateAmount(i,v),
                      onCurrencyChanged: (c) => vm.updateCurrency(i,c),);
                },
              ),
            ),

            const SizedBox(height: 20),

            FilledButton(
              onPressed: () async {
                await vm.loadRates();
                vm.calculateTotal();
              },
              child: const Text("Calculate Total"),
            ),

            const SizedBox(height: 20),

            Text(
              "Total: ${state.total.toStringAsFixed(2)} ${state.baseCurrency}",
              style: Theme.of(context).textTheme.headlineSmall,
            )
          ],
        ),
      ),
    );
  }
}