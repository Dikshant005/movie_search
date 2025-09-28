import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_search/features/search/data/datasources/search_remote_data_source.dart';
import 'package:movie_search/features/search/data/models/media_model.dart';
import '../../../core/error/failures.dart';
import '../../domain/entities/media.dart';
import '../../domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource remote;
  SearchRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, List<Media>>> searchMedia(String query, {int page = 1}) async {
    try {
      final response = await remote.searchMulti(query, page: page);
      return Right(response.results);
    } on DioError catch (e) {
      return handleDioError(e, List<Media>.empty());
    }
  }

  Future<Either<Failure, Media>> getMediaDetails(int id, String type) async {
    try {
      final response = await remote.getMediaDetailsById(id, type);
      return Right(MediaModel.fromJson(response));
    } on DioError catch (e) {
      return handleDioError(e, const Media.empty());
    }
  }

  // Helper method to handle Dio errors
  Either<Failure, T> handleDioError<T>(DioError error, T defaultReturnValue) {
    if (error.type == DioErrorType.receiveTimeout || error.type == DioErrorType.sendTimeout) {
      return Left(NetworkFailure('Connection timeout. Please try again later.'));
    }
    // Handle other types of Dio errors or rethrow the error
    return Left(NetworkFailure(error.message ?? 'An unknown error occurred.'));
  }
}