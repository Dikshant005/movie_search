import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_search/features/domain/repositories/search_repository.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepository repo;
  SearchCubit(this.repo) : super(SearchInitial());

  Future<void> search(String query) async {
    if (query.trim().isEmpty) {
      emit(SearchInitial());
      return;
    }
    emit(SearchLoading());
    final result = await repo.searchMedia(query);
    result.fold(
      (failure) => emit(SearchError(failure.message)),
      (media) => emit(SearchLoaded(media)),
    );
  }
  Future<void> getMediaDetails(int id, String type) async {
    emit(SearchLoading());
    final result = await repo.getMediaDetails(id, type);
    result.fold(
      (failure) => emit(SearchError(failure.message)),
      (media) => emit(SearchLoaded([media])), 
    );
  }
}