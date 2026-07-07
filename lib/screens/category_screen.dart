import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/widget_info.dart';
import '../data/widget_data.dart';
import '../routing/app_router.dart';
import '../theme/category_visuals.dart';
import '../theme/catalog_theme.dart';
import '../widgets/difficulty_badge.dart';

class CategoryScreen extends StatelessWidget {
  final WidgetCategory category;

  const CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final widgets = WidgetData.getWidgetsByCategory(category);

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryLabel(category)),
        // When opened via a direct/deep link there is nothing to pop, so offer
        // a way back to the catalog home instead of a dead-end.
        leading: context.canPop()
            ? null
            : IconButton(
                icon: const Icon(Icons.home_outlined),
                tooltip: 'Home',
                onPressed: () => context.go('/'),
              ),
      ),
      body: widgets.isEmpty
          ? const Center(child: Text('No widgets in this category yet.'))
          : FlutterPageFrame(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final wide = constraints.maxWidth >= 720;
                  if (wide) {
                    return CustomScrollView(
                      slivers: [
                        SliverPadding(
                          padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
                          sliver: SliverToBoxAdapter(
                            child: _CategoryHeader(
                              category: category,
                              count: widgets.length,
                            ),
                          ),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
                          sliver: SliverGrid.builder(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 400,
                                  mainAxisSpacing: 12,
                                  crossAxisSpacing: 12,
                                  childAspectRatio: 1.55,
                                ),
                            itemCount: widgets.length,
                            itemBuilder: (context, index) {
                              return _WidgetCatalogCard(
                                widgetInfo: widgets[index],
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  } else {
                    return ListView.separated(
                      padding: const EdgeInsets.fromLTRB(16, 18, 16, 40),
                      itemCount: widgets.length + 1,
                      separatorBuilder: (_, index) =>
                          SizedBox(height: index == 0 ? 14 : 10),
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return _CategoryHeader(
                            category: category,
                            count: widgets.length,
                          );
                        }
                        return SizedBox(
                          height: 168,
                          child: _WidgetCatalogCard(
                            widgetInfo: widgets[index - 1],
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
    );
  }
}

class _CategoryHeader extends StatelessWidget {
  const _CategoryHeader({required this.category, required this.count});

  final WidgetCategory category;
  final int count;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: flutterCardDecoration(context, elevated: true),
      child: Row(
        children: [
          CategoryIconBadge(category: category, size: 54, iconSize: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  categoryLabel(category),
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  '$count focused examples with live previews and teaching notes.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WidgetCatalogCard extends StatelessWidget {
  const _WidgetCatalogCard({required this.widgetInfo});

  final WidgetInfo widgetInfo;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final accent = categoryAccent(context, widgetInfo.category);
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: flutterCardDecoration(context),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(CatalogTheme.radius),
          onTap: () => context.goToWidget(widgetInfo.name),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(height: 2, color: accent),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widgetInfo.name,
                              style: theme.textTheme.titleMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 8),
                          DifficultyBadge(difficulty: widgetInfo.difficulty),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: Text(
                          widgetInfo.description,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: scheme.onSurfaceVariant,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'View Details',
                            style: theme.textTheme.labelLarge,
                          ),
                          const SizedBox(width: 6),
                          Icon(
                            Icons.arrow_forward,
                            size: 17,
                            color: scheme.primary,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
