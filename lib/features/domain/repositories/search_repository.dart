import 'package:dartz/dartz.dart';
import '../../../core/error/failures.dart';
import '../entities/media.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<Media>>> searchMedia(String query, {int page});
  Future<Either<Failure, Media>> getMediaDetails(int id, String type);
}