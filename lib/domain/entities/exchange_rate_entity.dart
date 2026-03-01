import 'package:floor/floor.dart';

@Entity(tableName: 'exchange_rates')
class ExchangeRateEntity {
  @primaryKey
  final String currency;

  final double rate;

  final String base;

  ExchangeRateEntity({
    required this.currency,
    required this.rate,
    required this.base,
  });
}