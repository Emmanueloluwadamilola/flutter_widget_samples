import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../data/widget_data.dart';
import '../models/widget_info.dart';

/// Full-catalog search over widget names, descriptions, and tags.
class CatalogSearchDelegate extends SearchDelegate<WidgetInfo?> {
  CatalogSearchDelegate() : super(searchFieldLabel: 'Search widgets…');

  @override
  List<Widget> buildActions(BuildContext context) => [
    if (query.isNotEmpty)
      IconButton(
        icon: const Icon(Icons.clear),
        tooltip: 'Clear',
        onPressed: () => query = '',
      ),
  ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
    icon: const Icon(Icons.arrow_back),
    tooltip: 'Back',
    onPressed: () => close(context, null),
  );

  @override
  Widget buildResults(BuildContext context) => _resultsList(context);

  @override
  Widget buildSuggestions(BuildContext context) => _resultsList(context);

  Widget _resultsList(BuildContext context) {
    final results = WidgetData.search(query);
    if (query.trim().isEmpty) {
      return const Center(child: Text('Type to search the catalog.'));
    }
    if (results.isEmpty) {
      return Center(child: Text('No widgets match "$query".'));
    }
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final w = results[index];
        return ListTile(
          title: Text(w.name),
          subtitle: Text(
            w.description,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Text(
            w.category.name,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          onTap: () {
            // Capture the router before closing search, since `close` disposes
            // this route's context.
            final router = GoRouter.of(context);
            close(context, w);
            router.push('/widget/${Uri.encodeComponent(w.name)}');
          },
        );
      },
    );
  }
}
