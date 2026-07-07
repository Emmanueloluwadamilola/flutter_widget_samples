import 'package:flutter/material.dart';
import '../data/widget_data.dart';
import '../models/widget_info.dart';
import '../routing/app_router.dart';
import '../services/catalog_prefs.dart';
import '../theme/category_visuals.dart';
import '../theme/catalog_theme.dart';
import 'catalog_search_delegate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = CatalogScope.of(context);
    final favorites = prefs.favorites
        .map(WidgetData.getByName)
        .whereType<WidgetInfo>()
        .toList();
    final recents = prefs.recents
        .map(WidgetData.getByName)
        .whereType<WidgetInfo>()
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Widget Catalog'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Search widgets',
            onPressed: () =>
                showSearch(context: context, delegate: CatalogSearchDelegate()),
          ),
          IconButton(
            icon: Icon(_themeIcon(prefs.themeMode)),
            tooltip: 'Theme: ${prefs.themeMode.name}',
            onPressed: prefs.cycleThemeMode,
          ),
        ],
      ),
      body: FlutterPageFrame(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final wide = constraints.maxWidth >= 720;
            return ListView(
              padding: const EdgeInsets.fromLTRB(16, 18, 16, 40),
              children: [
                _HomeHeader(
                  widgetCount: WidgetData.allWidgets.length,
                  categoryCount: WidgetCategory.values.length,
                  favoriteCount: favorites.length,
                  recentCount: recents.length,
                ),
                if (favorites.isNotEmpty)
                  _WidgetStrip(title: 'Favorites', widgets: favorites),
                if (recents.isNotEmpty)
                  _WidgetStrip(title: 'Recently viewed', widgets: recents),
                const _SectionHeading(
                  title: 'Categories',
                  subtitle: 'Browse by the kind of interface you are building.',
                ),
                if (wide)
                  _CategoryGrid(
                    crossAxisCount: constraints.maxWidth >= 1080 ? 4 : 3,
                  )
                else
                  ..._categoryTiles(context),
              ],
            );
          },
        ),
      ),
    );
  }

  IconData _themeIcon(ThemeMode mode) => switch (mode) {
    ThemeMode.system => Icons.brightness_auto,
    ThemeMode.light => Icons.light_mode,
    ThemeMode.dark => Icons.dark_mode,
  };

  List<Widget> _categoryTiles(BuildContext context) {
    return [
      for (final category in WidgetCategory.values)
        ListTile(
          leading: CategoryIconBadge(category: category),
          title: Text(categoryLabel(category)),
          subtitle: Text(
            '${WidgetData.getWidgetsByCategory(category).length} widgets',
          ),
          trailing: const Icon(Icons.arrow_forward, size: 17),
          onTap: () => _openCategory(context, category),
        ),
    ];
  }
}

void _openCategory(BuildContext context, WidgetCategory category) {
  context.goToCategory(category);
}

void _openWidget(BuildContext context, WidgetInfo info) {
  context.goToWidget(info.name);
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader({
    required this.widgetCount,
    required this.categoryCount,
    required this.favoriteCount,
    required this.recentCount,
  });

  final int widgetCount;
  final int categoryCount;
  final int favoriteCount;
  final int recentCount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(24),
      decoration: flutterCardDecoration(context, elevated: true),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final wide = constraints.maxWidth >= 720;
          final copy = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Build with sharper Flutter intuition',
                style: theme.textTheme.headlineMedium?.copyWith(fontSize: 34),
              ),
              const SizedBox(height: 8),
              Text(
                'A practical library of live widget examples and teaching notes',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: scheme.onSurfaceVariant,
                ),
              ),
            ],
          );
          final stats = Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _StatPill(
                icon: Icons.widgets_outlined,
                label: '$widgetCount widgets',
              ),
              _StatPill(
                icon: Icons.category_outlined,
                label: '$categoryCount categories',
              ),
              _StatPill(
                icon: Icons.favorite_border,
                label: '$favoriteCount saved',
              ),
              _StatPill(icon: Icons.history, label: '$recentCount recent'),
            ],
          );
          final search = FilledButton.icon(
            icon: const Icon(Icons.manage_search),
            label: const Text('Search catalog'),
            onPressed: () =>
                showSearch(context: context, delegate: CatalogSearchDelegate()),
          );

          if (wide) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(child: copy),
                const SizedBox(width: 24),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 360),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [stats, const SizedBox(height: 16), search],
                  ),
                ),
              ],
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              copy,
              const SizedBox(height: 16),
              stats,
              const SizedBox(height: 16),
              search,
            ],
          );
        },
      ),
    );
  }
}

class _StatPill extends StatelessWidget {
  const _StatPill({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: scheme.outlineVariant.withValues(alpha: 0.65),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: scheme.primary),
          const SizedBox(width: 6),
          Text(label, style: Theme.of(context).textTheme.labelMedium),
        ],
      ),
    );
  }
}

class _SectionHeading extends StatelessWidget {
  const _SectionHeading({required this.title, this.subtitle});

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 22, 0, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: theme.textTheme.titleLarge),
          if (subtitle != null) ...[
            const SizedBox(height: 4),
            Text(
              subtitle!,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// A horizontally-scrolling strip of widget cards (favorites / recents).
class _WidgetStrip extends StatelessWidget {
  const _WidgetStrip({required this.title, required this.widgets});

  final String title;
  final List<WidgetInfo> widgets;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeading(title: title),
        SizedBox(
          height: 132,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            itemCount: widgets.length,
            separatorBuilder: (_, _) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final w = widgets[index];
              return SizedBox(
                width: 220,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 0,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(CatalogTheme.radius),
                    onTap: () => _openWidget(context, w),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CategoryIconBadge(category: w.category),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  w.name,
                                  style: Theme.of(context).textTheme.titleSmall,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
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
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

/// A responsive grid of category cards used on wide screens.
class _CategoryGrid extends StatelessWidget {
  const _CategoryGrid({required this.crossAxisCount});

  final int crossAxisCount;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: crossAxisCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 2.35,
      children: [
        for (final category in WidgetCategory.values)
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: flutterCardDecoration(context),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(CatalogTheme.radius),
                onTap: () => _openCategory(context, category),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 2,
                      color: categoryAccent(context, category),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            CategoryIconBadge(category: category),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    categoryLabel(category),
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleMedium,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    '${WidgetData.getWidgetsByCategory(category).length} widgets',
                                    style: Theme.of(context).textTheme.bodySmall
                                        ?.copyWith(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.onSurfaceVariant,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurfaceVariant,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
