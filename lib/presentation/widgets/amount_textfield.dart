import 'package:flutter/material.dart';

class AmountTextField extends StatelessWidget {
  final double amount;
  final Function(double) onChanged;

  const AmountTextField({
    super.key,
    required this.amount,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: amount == 0 ? "" : amount.toString(),
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        hintText: "Amount",
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {
        final parsed = double.tryParse(value) ?? 0;
        onChanged(parsed);
      },
    );
  }
}