import 'package:currency_converter/data/models/exchange_rate_response.dart';
import 'package:currency_converter/data/models/symbols_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';

import 'package:currency_converter/data/repositories/exchange_repository_impl.dart';
import 'package:currency_converter/data/datasources/remote/exchange_remote_datasource.dart';
import 'package:currency_converter/core/errors/app_exception.dart';

class MockExchangeRemoteDatasource extends Mock
    implements ExchangeRemoteDatasource {}

class FakeRatesResponse extends Mock implements ExchangeRatesResponse{
  final Map<String, dynamic> rates;

  FakeRatesResponse(this.rates);
}

class FakeSymbolsResponse   extends Mock implements SymbolsResponse {
  final Map<String, String> symbols;

  FakeSymbolsResponse(this.symbols);
}

void main() {
  late ExchangeRepositoryImpl repository;
  late MockExchangeRemoteDatasource remote;

  setUp(() {
    remote = MockExchangeRemoteDatasource();
    repository = ExchangeRepositoryImpl(remote);
  });

  group('ExchangeRepositoryImpl Tests', () {
    test('getRates returns rates when API call succeeds', () async {
      final rates = {"USD": 1.0, "EUR": 0.9};

      when(
        () => remote.getLatestRates(any()),
      ).thenAnswer((_) async => FakeRatesResponse(rates));

      final result = await repository.getRates("USD");

      expect(result, rates);
      verify(() => remote.getLatestRates("USD")).called(1);
    });

    test('getRates throws FetchDataException when rates are empty', () async {
      when(
        () => remote.getLatestRates(any()),
      ).thenAnswer((_) async => FakeRatesResponse({}));

      expect(
        () => repository.getRates("USD"),
        throwsA(isA<FetchDataException>()),
      );
    });

    test('getCurrencies returns currencies when API succeeds', () async {
      final currencies = {"USD": "United States Dollar", "EUR": "Euro"};

      when(
        () => remote.getCurrencies(),
      ).thenAnswer((_) async => FakeSymbolsResponse(currencies));

      final result = await repository.getCurrencies();

      expect(result, currencies);
      verify(() => remote.getCurrencies()).called(1);
    });

    test(
      'getCurrencies throws FetchDataException when symbols are empty',
      () async {
        when(
          () => remote.getCurrencies(),
        ).thenAnswer((_) async => FakeSymbolsResponse({}));

        expect(
          () => repository.getCurrencies(),
          throwsA(isA<FetchDataException>()),
        );
      },
    );

    test('getRates maps DioException 404 to NotFoundException', () async {
      final dioError = DioException(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 404,
        ),
      );

      when(() => remote.getLatestRates(any())).thenThrow(dioError);

      expect(
        () => repository.getRates("USD"),
        throwsA(isA<NotFoundException>()),
      );
    });

    test('getRates maps DioException 500 to ServerException', () async {
      final dioError = DioException(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 500,
        ),
      );

      when(() => remote.getLatestRates(any())).thenThrow(dioError);

      expect(() => repository.getRates("USD"), throwsA(isA<ServerException>()));
    });
  });
}
