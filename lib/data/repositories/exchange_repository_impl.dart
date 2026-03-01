import 'package:dio/dio.dart';

import '../../core/errors/app_exception.dart';
import '../../domain/repositories/exchange_repository.dart';
import '../datasources/remote/exchange_remote_datasource.dart';

class ExchangeRepositoryImpl implements ExchangeRepository {
  final ExchangeRemoteDatasource remote;

  ExchangeRepositoryImpl(this.remote);

  @override
  Future<Map<String, dynamic>> getRates(String base) async {
    try {
      final response = await remote.getLatestRates(base);

      if (response.rates.isEmpty) {
        throw FetchDataException("No exchange rates found");
      }

      return response.rates;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw FetchDataException(e.toString());
    }


  }

  @override
  Future<Map<String, String>> getCurrencies() async {
    try {
      final response = await remote.getCurrencies();

      if (response.symbols.isEmpty) {
        throw FetchDataException("No currencies available");
      }

      return response.symbols;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw FetchDataException(e.toString());
    }
  }

  AppException _handleDioError(DioException error) {
    switch (error.response?.statusCode) {
      case 400:
        return BadRequestException();
      case 401:
      case 403:
        return UnauthorizedException();
      case 404:
        return NotFoundException();
      case 500:
        return ServerException();
      default:
        return FetchDataException("Network error occurred");
    }
  }
}