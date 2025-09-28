import 'package:dio/dio.dart';
import '../models/multi_search_response.dart';

abstract class SearchRemoteDataSource {
  Future<MultiSearchResponse> searchMulti(String query, {int page = 1});
  Future<Map<String, dynamic>> getMediaDetailsById(int id, String type);
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final Dio dio;

  SearchRemoteDataSourceImpl(this.dio);

  @override
  Future<MultiSearchResponse> searchMulti(String query, {int page = 1}) async {
    final res = await dio.get(
      '/search/multi',
      queryParameters: {
        'query': query,
        'page': page,
        'include_adult': false,
        'language': 'en-US',
      },
    );
    return MultiSearchResponse.fromJson(res.data);
  }

  @override
  Future<Map<String, dynamic>> getMediaDetailsById(int id, String type) async {
    final response = await dio.get(
      '${type == 'movie' ? 'movie' : 'tv'}/$id',
    );
    return response.data;
  }
}