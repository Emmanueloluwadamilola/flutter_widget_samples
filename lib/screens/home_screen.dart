import 'package:flutter/material.dart';
import '../data/widget_data.dart';
import '../models/widget_info.dart';
import '../services/catalog_prefs.dart';
import 'category_screen.dart';
import 'catalog_search_delegate.dart';
import 'widget_detail_screen.dart';

/// Icon shown for each category on the home screen.
const Map<WidgetCategory, IconData> _categoryIcons = {
  WidgetCategory.layout: Icons.dashboard_outlined,
  WidgetCategory.text: Icons.text_fields,
  WidgetCategory.input: Icons.edit_outlined,
  WidgetCategory.assets: Icons.image_outlined,
  WidgetCategory.material: Icons.android,
  WidgetCategory.cupertino: Icons.apple,
  WidgetCategory.interaction: Icons.touch_app_outlined,
  WidgetCategory.styling: Icons.palette_outlined,
  WidgetCategory.scrolling: Icons.swap_vert,
  WidgetCategory.async: Icons.sync,
  WidgetCategory.animation: Icons.animation,
  WidgetCategory.painting: Icons.brush_outlined,
  WidgetCategory.effects: Icons.auto_awesome,
  WidgetCategory.accessibility: Icons.accessibility_new,
  WidgetCategory.utility: Icons.build_outlined,
};

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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final wide = constraints.maxWidth >= 720;
              return ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                    child: Text(
                      '${WidgetData.allWidgets.length} widgets across '
                      '${WidgetCategory.values.length} categories',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  if (favorites.isNotEmpty)
                    _WidgetStrip(title: 'Favorites', widgets: favorites),
                  if (recents.isNotEmpty)
                    _WidgetStrip(title: 'Recently viewed', widgets: recents),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: Text(
                      'Categories',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
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
          leading: Icon(_categoryIcons[category]),
          title: Text(category.name.toUpperCase()),
          subtitle: Text(
            '${WidgetData.getWidgetsByCategory(category).length} widgets',
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () => _openCategory(context, category),
        ),
    ];
  }
}

void _openCategory(BuildContext context, WidgetCategory category) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => CategoryScreen(category: category)),
  );
}

void _openWidget(BuildContext context, WidgetInfo info) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => WidgetDetailScreen(widgetInfo: info)),
  );
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
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 110,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: widgets.length,
            separatorBuilder: (_, _) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final w = widgets[index];
              return SizedBox(
                width: 180,
                child: Card(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () => _openWidget(context, w),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            w.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Flexible(
                            child: Text(
                              w.description,
                              style: Theme.of(context).textTheme.bodySmall,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
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
      padding: const EdgeInsets.symmetric(horizontal: 16),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 2.4,
      children: [
        for (final category in WidgetCategory.values)
          Card(
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () => _openCategory(context, category),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(_categoryIcons[category], size: 28),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            category.name.toUpperCase(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '${WidgetData.getWidgetsByCategory(category).length} widgets',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
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
