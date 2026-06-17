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
}
