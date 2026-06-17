import 'package:flutter/material.dart';
import '../models/widget_info.dart';
import '../data/widget_data.dart';
import 'widget_detail_screen.dart';

class CategoryScreen extends StatelessWidget {
  final WidgetCategory category;

  const CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final widgets = WidgetData.getWidgetsByCategory(category);

    return Scaffold(
      appBar: AppBar(title: Text(category.name.toUpperCase())),
      body: widgets.isEmpty
          ? const Center(child: Text('No widgets in this category yet.'))
          : ListView.builder(
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            WidgetDetailScreen(widgetInfo: widgetInfo),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
