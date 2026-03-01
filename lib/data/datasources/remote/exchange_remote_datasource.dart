import 'package:dio/dio.dart';
import '../../../core/constants/api_constants.dart';
import '../../models/exchange_rate_response.dart';
import '../../models/symbols_response.dart';

class ExchangeRemoteDatasource {
  final Dio dio;

  ExchangeRemoteDatasource(this.dio);

  Future<ExchangeRatesResponse> getLatestRates(String base) async {
    final response = await dio.get(
      ApiConstants.latest,
      queryParameters: {"base": base},
    );

    return ExchangeRatesResponse.fromJson(response.data);
  }

  Future<SymbolsResponse> getCurrencies() async {
    final response = await dio.get(ApiConstants.symbols);

    return SymbolsResponse.fromJson(response.data);
  }
}