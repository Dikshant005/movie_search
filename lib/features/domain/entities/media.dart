import 'package:equatable/equatable.dart';

class Media extends Equatable {
  final int id;
  final String title;
  final String? posterUrl;
  final String? backdropUrl;
  final String overview;
  final double voteAverage;
  final String releaseDate;
  final String type;
  final int? runtime;
  final List<String> genres;
  final String? certification;

  const Media({
    required this.id,
    required this.title,
    this.posterUrl,
    this.backdropUrl,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
    required this.type,
    this.runtime,
    this.genres = const [],
    this.certification,
  });

  const Media.empty()
      : id = 0,
        title = '',
        posterUrl = null,
        backdropUrl = null,
        overview = '',
        voteAverage = 0.0,
        releaseDate = '',
        type = '',
        runtime = null,
        genres = const [],
        certification = null;

  @override
  List<Object?> get props => [
        id,
        title,
        posterUrl,
        backdropUrl,
        overview,
        voteAverage,
        releaseDate,
        type,
        runtime,
        genres,
        certification,
      ];
}