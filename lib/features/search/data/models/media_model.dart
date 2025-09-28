import 'package:movie_search/features/domain/entities/media.dart';

class MediaModel extends Media {
  const MediaModel({
    required super.id,
    required super.title,
    super.posterUrl,
    super.backdropUrl, 
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
    required super.type,
    super.runtime,
    super.genres = const [],
    super.certification,
  });

  factory MediaModel.fromJson(Map<String, dynamic> json) {
    final isMovie = json['media_type'] == 'movie';
    return MediaModel(
      id: json['id'],
      title: isMovie ? json['title'] ?? '' : json['name'] ?? '',
      overview: json['overview'] ?? '',
      posterUrl: json['poster_path'] != null
          ? 'https://image.tmdb.org/t/p/w500${json['poster_path']}' 
          : null,
      backdropUrl: json['backdrop_path'] != null
          ? 'https://image.tmdb.org/t/p/w1280${json['backdrop_path']}' 
          : null,
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      releaseDate: isMovie
          ? json['release_date'] ?? ''
          : json['first_air_date'] ?? '',
      type: json['media_type'] ?? '',
      runtime: json['runtime'] ?? (json['episode_run_time']?.isNotEmpty ?? false
          ? json['episode_run_time'][0]
          : null),
      genres: (json['genres'] as List?)
          ?.map((g) => g['name'] as String)
          ?.toList() ?? [], 
      certification: json['release_dates']?['results']?.firstWhere(
        (r) => r['iso_3166_1'] == 'US',
        orElse: () =>  JsonDataObject(),
      )['release_dates']?.firstWhere(
        (rd) => rd['certification'] != null,
        orElse: () =>  JsonDataObject(),
      )['certification'],
    );
  }
}
class JsonDataObject {
  dynamic operator [](String key) => null;
}