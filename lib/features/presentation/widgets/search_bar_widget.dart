import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchBarWidget extends StatefulWidget {
  final ValueChanged<String> onQuery;
  const SearchBarWidget({required this.onQuery, super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final _controller = TextEditingController();
  final _focus = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focus.dispose();
    super.dispose();
  }

  void _submit() {
    final q = _controller.text.trim();
    if (q.isNotEmpty) {
      widget.onQuery(q);
      _focus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: SearchBar(
        controller: _controller,
        focusNode: _focus,
        onSubmitted: (_) => _submit(),
        leading: const Icon(Icons.search),
        trailing: [
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              _controller.clear();
              widget.onQuery('');
            },
          )
        ],
        hintText: 'Search movies & shows…',
      ),
    );
  }
}