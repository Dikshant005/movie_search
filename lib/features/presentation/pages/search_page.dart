import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/search_cubit.dart';
import '../cubit/search_state.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/media_card.dart';
import '../../../core/widgets/error_view.dart';
import '../../../core/widgets/adaptive_grid.dart';
import 'details_page.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover Movies & Shows'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SearchBarWidget(
            onQuery: (q) => context.read<SearchCubit>().search(q),
          ),
          Expanded(child: _buildBody()),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchInitial) {
          return const Center(child: Text('Start typing to search'));
        }
        if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is SearchError) {
          return ErrorView(
            message: state.message,
            onRetry: () => context.read<SearchCubit>().search(''),
          );
        }
        if (state is SearchLoaded) {
          final media = state.media;
          if (media.isEmpty) {
            return const Center(child: Text('No results found'));
          }
          return AdaptiveGrid(
            itemCount: media.length,
            itemBuilder: (_, i) => MediaCard(
              media: media[i],
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailsPage(media: media[i]),
                ),
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}