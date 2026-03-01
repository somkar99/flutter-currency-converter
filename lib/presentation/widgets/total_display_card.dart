import 'package:flutter/material.dart';

class TotalDisplayCard extends StatelessWidget {
  final double total;
  final String baseCurrency;

  const TotalDisplayCard({
    super.key,
    required this.total,
    required this.baseCurrency,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const Text(
              "Total Value",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 8),

            Text(
              "${total.toStringAsFixed(2)} $baseCurrency",
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}