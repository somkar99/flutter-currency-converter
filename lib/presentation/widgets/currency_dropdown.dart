import 'package:flutter/material.dart';

class CurrencyDropdown extends StatelessWidget {
  final String value;
  final Map<String, String> currencies;
  final Function(String) onChanged;

  const CurrencyDropdown({
    super.key,
    required this.value,
    required this.currencies,
    required this.onChanged,
  });

 /* static const currencies = [
    "USD","EUR","INR","JPY","GBP",
    "AUD","CAD","CHF","CNY","SGD",
    "NZD","HKD","SEK","KRW","NOK",
    "MXN","BRL","ZAR","RUB","TRY"
  ];
*/
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      isExpanded: true,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
      items: currencies.entries.map((entry) {
        return DropdownMenuItem<String>(
          value: entry.key,
          child: Text("${entry.key} - ${entry.value}", overflow: TextOverflow.ellipsis,
          ),
        );
      }).toList(),
      onChanged: (v) {
        if (v != null) {
          onChanged(v);
        }
      },
    );
  }
}