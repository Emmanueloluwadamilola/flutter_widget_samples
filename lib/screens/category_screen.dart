import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/widget_info.dart';
import '../data/widget_data.dart';
import '../routing/app_router.dart';
import '../widgets/difficulty_badge.dart';

class CategoryScreen extends StatelessWidget {
  final WidgetCategory category;

  const CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final widgets = WidgetData.getWidgetsByCategory(category);

    return Scaffold(
      appBar: AppBar(
        title: Text(category.name.toUpperCase()),
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
          : Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final wide = constraints.maxWidth >= 720;
                    if (wide) {
                      return GridView.builder(
                        padding: const EdgeInsets.all(16),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 400,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                              childAspectRatio: 1.5,
                            ),
                        itemCount: widgets.length,
                        itemBuilder: (context, index) {
                          final widgetInfo = widgets[index];
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            child: InkWell(
                              onTap: () => context.goToWidget(widgetInfo.name),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            widgetInfo.name,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        DifficultyBadge(
                                          difficulty: widgetInfo.difficulty,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Expanded(
                                      child: Text(
                                        widgetInfo.description,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodyMedium,
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
                                          style: TextStyle(
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.primary,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        Icon(
                                          Icons.arrow_forward,
                                          size: 16,
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.primary,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return ListView.builder(
                        itemCount: widgets.length,
                        itemBuilder: (context, index) {
                          final widgetInfo = widgets[index];
                          return ListTile(
                            title: Text(widgetInfo.name),
                            subtitle: Text(
                              widgetInfo.description,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: DifficultyBadge(
                              difficulty: widgetInfo.difficulty,
                            ),
                            onTap: () => context.goToWidget(widgetInfo.name),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
    );
  }
}
