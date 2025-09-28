import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_search/features/domain/repositories/search_repository.dart';
import 'package:movie_search/features/domain/repositories/search_repository_impl.dart';
import 'package:movie_search/features/presentation/cubit/search_cubit.dart';
import 'core/network/dio_client.dart';
import 'features/search/data/datasources/search_remote_data_source.dart';

final sl = GetIt.instance;

void init() {
  // Core
  sl.registerLazySingleton<Dio>(() => buildDioClient());

  // Data sources
  sl.registerLazySingleton<SearchRemoteDataSource>(
      () => SearchRemoteDataSourceImpl(sl()));

  // Repositories
  sl.registerLazySingleton<SearchRepository>(
      () => SearchRepositoryImpl(sl()));

  // Cubit
  sl.registerFactory(() => SearchCubit(sl()));
}