import 'package:currency_converter/presentation/viewmodels/exchange_viewmodel.dart';

import '../../core/network/dio_client.dart';
import '../../data/datasources/remote/exchange_remote_datasource.dart';
import '../../data/repositories/exchange_repository_impl.dart';
import '../../domain/repositories/exchange_repository.dart';
import '../state/exchange_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final dioProvider = Provider((ref) {
  return DioClient().dio;
});

final remoteDatasourceProvider = Provider((ref) {
  return ExchangeRemoteDatasource(ref.read(dioProvider));
});

final repositoryProvider = Provider<ExchangeRepository>((ref) {
  return ExchangeRepositoryImpl(
    ref.read(remoteDatasourceProvider),
  );
});

final exchangeViewModelProvider =
StateNotifierProvider<ExchangeViewModel, ExchangeState>((ref) {
  return ExchangeViewModel(ref.read(repositoryProvider));
});