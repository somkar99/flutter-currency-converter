import 'package:flutter/material.dart';

class CurrenciesListScreen extends StatelessWidget {
  final Map<String,String> currencies;

  const CurrenciesListScreen({
    super.key,
    required this.currencies,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Currencies"),
      ),
      body: ListView(
        children: currencies.entries.map((e) {

          return ListTile(
            title: Text(e.key),
            subtitle: Text(e.value),
          );

        }).toList(),
      ),
    );
  }
}