import 'media_model.dart';

class MultiSearchResponse {
  final List<MediaModel> results;
  MultiSearchResponse({required this.results});

  factory MultiSearchResponse.fromJson(Map<String, dynamic> json) {
    final list = (json['results'] as List)
        .map((e) => MediaModel.fromJson(e))
        .toList();
    return MultiSearchResponse(results: list);
  }
}