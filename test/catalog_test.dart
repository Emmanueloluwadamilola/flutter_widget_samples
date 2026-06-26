import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_widget_samples/data/widget_data.dart';
import 'package:flutter_widget_samples/models/widget_info.dart';

/// Integrity tests for the widget catalog itself.
///
/// These guard the catalog as data: every sample must render, names must be
/// unique, and cross-references between widgets must point at real entries.
/// With hundreds of entries this is the cheapest, highest-value safety net we
/// have — a single malformed `WidgetInfo` is caught here instead of crashing
/// the app at runtime.
void main() {
  final widgets = WidgetData.allWidgets;

  group('Catalog structure', () {
    test('catalog is non-empty', () {
      expect(widgets, isNotEmpty);
    });

    test('every widget has a non-empty name and description', () {
      for (final w in widgets) {
        expect(w.name.trim(), isNotEmpty, reason: 'A widget has an empty name');
        expect(
          w.description.trim(),
          isNotEmpty,
          reason: 'Widget "${w.name}" has an empty description',
        );
      }
    });

    test('widget names are unique', () {
      final seen = <String, int>{};
      for (final w in widgets) {
        seen.update(w.name, (c) => c + 1, ifAbsent: () => 1);
      }
      final duplicates = seen.entries
          .where((e) => e.value > 1)
          .map((e) => '${e.key} (x${e.value})')
          .toList();
      expect(
        duplicates,
        isEmpty,
        reason: 'Duplicate widget names found: ${duplicates.join(', ')}',
      );
    });

    test('every category resolves through getWidgetsByCategory', () {
      var total = 0;
      for (final category in WidgetCategory.values) {
        final inCategory = WidgetData.getWidgetsByCategory(category);
        for (final w in inCategory) {
          expect(w.category, category);
        }
        total += inCategory.length;
      }
      expect(
        total,
        widgets.length,
        reason: 'Sum of per-category widgets must equal the full catalog',
      );
    });

    test('relatedWidgets references point at real catalog entries', () {
      final names = widgets.map((w) => w.name).toSet();
      final broken = <String>[];
      for (final w in widgets) {
        for (final related in w.relatedWidgets) {
          if (!names.contains(related)) {
            broken.add('${w.name} -> $related');
          }
        }
      }
      expect(
        broken,
        isEmpty,
        reason:
            'relatedWidgets pointing at unknown entries: '
            '${broken.join(', ')}',
      );
    });
  });

  group('Catalog rendering', () {
    // Errors that are caused by the test sandbox rather than the widget itself
    // and must not fail the suite.
    bool isEnvironmentalError(FlutterErrorDetails details) {
      final text = details.exceptionAsString();
      // No real network in `flutter test`, so Image.network always fails here
      // even though it works fine in the running app.
      if (text.contains('NetworkImageLoadException') ||
          text.contains('HttpClient') ||
          text.contains('HTTP request failed') ||
          text.contains('assets-for-api-docs') ||
          text.contains('Failed host lookup')) {
        return true;
      }
      // A fixed test surface can clip wide/tall samples; overflow is cosmetic,
      // not a crash, and is irrelevant to whether the sample is valid.
      if (text.contains('A RenderFlex overflowed') ||
          text.contains('overflowed by')) {
        return true;
      }
      return false;
    }

    testWidgets('every widget sample builds without throwing', (tester) async {
      final failures = <String>[];

      for (final w in widgets) {
        final errors = <FlutterErrorDetails>[];
        final previousOnError = FlutterError.onError;
        FlutterError.onError = (details) {
          if (!isEnvironmentalError(details)) errors.add(details);
        };

        try {
          await tester.pumpWidget(
            // Mirrors the detail screen's preview area: a bounded box that
            // gives full-height widgets (NavigationRail, BottomAppBar, …)
            // finite constraints. Keep this in sync with kPreviewMaxHeight in
            // widget_detail_screen.dart.
            MaterialApp(
              home: Scaffold(
                body: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 360),
                    child: Builder(builder: w.builder),
                  ),
                ),
              ),
            ),
          );
          // Let one-shot animations settle; repeating animations are pumped
          // a fixed amount rather than awaited to avoid timeouts.
          await tester.pump(const Duration(milliseconds: 100));
        } catch (e) {
          errors.add(
            FlutterErrorDetails(
              exception: e is FlutterError ? e : Exception('$e'),
            ),
          );
        } finally {
          FlutterError.onError = previousOnError;
        }

        if (errors.isNotEmpty) {
          failures.add(
            '${w.name}: ${errors.first.exceptionAsString().split('\n').first}',
          );
        }
      }

      expect(
        failures,
        isEmpty,
        reason:
            '${failures.length} widget sample(s) failed to render:\n'
            '${failures.join('\n')}',
      );
    });
  });
}
