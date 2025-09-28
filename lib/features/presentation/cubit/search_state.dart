import 'package:equatable/equatable.dart';
import '../../domain/entities/media.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<Media> media;
  const SearchLoaded(this.media);

  @override
  List<Object?> get props => [media];
}

class SearchError extends SearchState {
  final String message;
  const SearchError(this.message);

  @override
  List<Object?> get props => [message];
}