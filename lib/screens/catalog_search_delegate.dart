import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../data/widget_data.dart';
import '../models/widget_info.dart';
import '../theme/category_visuals.dart';
import '../theme/catalog_theme.dart';
import '../widgets/difficulty_badge.dart';

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
      return const _SearchEmptyState(
        icon: Icons.search,
        message: 'Type to search the catalog.',
      );
    }
    if (results.isEmpty) {
      return _SearchEmptyState(
        icon: Icons.search_off,
        message: 'No widgets match "$query".',
      );
    }
    return FlutterPageFrame(
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 18, 16, 32),
        itemCount: results.length,
        separatorBuilder: (_, _) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final w = results[index];
          return Container(
            clipBehavior: Clip.antiAlias,
            decoration: flutterCardDecoration(context),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(CatalogTheme.radius),
                onTap: () {
                  // Capture the router before closing search, since `close`
                  // disposes this route's context.
                  final router = GoRouter.of(context);
                  close(context, w);
                  router.push('/widget/${Uri.encodeComponent(w.name)}');
                },
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    children: [
                      CategoryIconBadge(category: w.category),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              w.name,
                              style: Theme.of(context).textTheme.titleMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              w.description,
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurfaceVariant,
                                  ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      DifficultyBadge(difficulty: w.difficulty),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SearchEmptyState extends StatelessWidget {
  const _SearchEmptyState({required this.icon, required this.message});

  final IconData icon;
  final String message;

  @override
  Widget build(BuildContext context) {
    return FlutterPageFrame(
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.all(22),
          decoration: flutterCardDecoration(context, elevated: true),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 42,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 12),
              Text(message, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
