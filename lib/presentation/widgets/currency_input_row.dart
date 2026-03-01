import 'package:flutter/material.dart';
import 'currency_dropdown.dart';
import 'amount_textfield.dart';
import '../../data/models/currency_input.dart';

class CurrencyInputRow extends StatelessWidget {
  final CurrencyInput input;
  final int index;
  final Function(double) onAmountChanged;
  final Map<String, String> currencies;

  final Function(String) onCurrencyChanged;
  final VoidCallback? onRemove;

  const CurrencyInputRow({
    super.key,
    required this.input,
    required this.index,
    required this.onAmountChanged,
    required this.currencies,

    required this.onCurrencyChanged,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [

            Expanded(
              flex: 1,
              child: AmountTextField(
                amount: input.amount,
                onChanged: onAmountChanged,
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              flex: 2,
              child: CurrencyDropdown(
                value: input.currency,
                currencies:currencies,
                onChanged: onCurrencyChanged,
              ),
            ),

            if (onRemove != null)
              IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: onRemove,
              ),
          ],
        ),
      ),
    );
  }
}