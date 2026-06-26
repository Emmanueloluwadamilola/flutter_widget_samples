import '../models/widget_info.dart';
import 'widgets/layout_widgets.dart';
import 'widgets/text_widgets.dart';
import 'widgets/input_widgets.dart';
import 'widgets/material_widgets.dart';
import 'widgets/cupertino_widgets.dart';
import 'widgets/interaction_widgets.dart';
import 'widgets/styling_widgets.dart';
import 'widgets/scrolling_widgets.dart';
import 'widgets/async_widgets.dart';
import 'widgets/animation_widgets.dart';
import 'widgets/painting_widgets.dart';
import 'widgets/effects_widgets.dart';
import 'widgets/assets_widgets.dart';
import 'widgets/accessibility_widgets.dart';
import 'widgets/utility_widgets.dart';

class WidgetData {
  static final List<WidgetInfo> allWidgets = [
    ...layoutWidgets,
    ...textWidgets,
    ...inputWidgets,
    ...materialWidgets,
    ...materialWidgetsExtra,
    ...materialWidgetsExtra2,
    ...materialWidgetsExtra3,
    ...materialWidgetsExtra4,
    ...materialWidgetsExtra5,
    ...materialWidgetsExtra6,
    ...materialWidgetsAuditBatch1,
    ...cupertinoWidgets,
    ...cupertinoWidgetsExtra,
    ...interactionWidgets,
    ...interactionWidgetsExtra,
    ...stylingWidgets,
    ...scrollingWidgets,
    ...scrollingWidgetsExtra,
    ...asyncWidgets,
    ...animationWidgets,
    ...animationWidgetsExtra,
    ...paintingWidgets,
    ...paintingWidgetsExtra,
    ...effectsWidgets,
    ...assetsWidgets,
    ...accessibilityWidgets,
    ...utilityWidgets,
    ...utilityWidgetsExtra,
  ];

  static List<WidgetInfo> getWidgetsByCategory(WidgetCategory category) {
    return allWidgets.where((w) => w.category == category).toList();
  }

  /// Fast lookup of an entry by its (unique) [WidgetInfo.name].
  static final Map<String, WidgetInfo> _byName = {
    for (final w in allWidgets) w.name: w,
  };

  /// Returns the entry with the given [name], or null if it does not exist.
  static WidgetInfo? getByName(String name) => _byName[name];

  /// Returns entries whose name, description, or tags match [query].
  /// An empty query returns an empty list.
  static List<WidgetInfo> search(String query) {
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return const [];
    return allWidgets.where((w) => w.searchText.contains(q)).toList()
      ..sort((a, b) {
        // Prefer name-prefix matches, then name matches, then the rest.
        int rank(WidgetInfo w) {
          final name = w.name.toLowerCase();
          if (name.startsWith(q)) return 0;
          if (name.contains(q)) return 1;
          return 2;
        }

        final byRank = rank(a).compareTo(rank(b));
        return byRank != 0 ? byRank : a.name.compareTo(b.name);
      });
  }
}
