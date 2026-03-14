import 'package:flutter/material.dart';
import 'package:news_now/views/search_results_view.dart';

class NewsSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isNotEmpty) {
      return SearchResultsView(query: query);
    }
    return const Center(child: Text('Enter a search term'));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(child: Text('Search for breaking news...'));
  }
}
