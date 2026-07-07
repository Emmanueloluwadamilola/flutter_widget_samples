import 'package:flutter/material.dart';

import '../models/widget_info.dart';
import 'catalog_theme.dart';

const Map<WidgetCategory, IconData> categoryIcons = {
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

String categoryLabel(WidgetCategory category) => category.name.toUpperCase();

Color categoryAccent(BuildContext context, WidgetCategory category) {
  return Theme.of(context).colorScheme.primary;
}

class CategoryIconBadge extends StatelessWidget {
  const CategoryIconBadge({
    super.key,
    required this.category,
    this.size = 42,
    this.iconSize = 22,
  });

  final WidgetCategory category;
  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final accent = categoryAccent(context, category);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: accent.withValues(alpha: 0.09),
        borderRadius: BorderRadius.circular(CatalogTheme.radius),
        border: Border.all(color: accent.withValues(alpha: 0.2)),
      ),
      child: Icon(categoryIcons[category], color: accent, size: iconSize),
    );
  }
}
