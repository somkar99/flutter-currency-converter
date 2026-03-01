import 'package:flutter/material.dart';

class AddCurrencyButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddCurrencyButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        icon: const Icon(Icons.add),
        label: const Text("Add Currency"),
        onPressed: onPressed,
      ),
    );
  }
}