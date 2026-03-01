import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/app_providers.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final vm = ref.read(exchangeViewModelProvider.notifier);
    final state = ref.watch(exchangeViewModelProvider);

    const currencies = [
      "USD","EUR","INR","GBP","JPY"
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: DropdownButtonFormField<String>(
          value: state.baseCurrency,
          decoration: const InputDecoration(
            labelText: "Base Currency",
            border: OutlineInputBorder(),
          ),
          items: currencies
              .map((c) => DropdownMenuItem(
            value: c,
            child: Text(c),
          ))
              .toList(),
          onChanged: (v) {
            if (v != null) {
              vm.updateBaseCurrency(v);
            }
          },
        ),
      ),
    );
  }
}