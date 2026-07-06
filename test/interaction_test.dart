import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_widget_samples/data/widget_data.dart';
import 'package:flutter_widget_samples/models/widget_info.dart';

/// Interaction tests: they drive real gestures against the *live* sample
/// builders and assert an observable state change, section by section.
///
/// Two layers:
///  1. A catalog-wide sweep (one test per category) guarding against the
///     escaped-`$` bug class — no live sample may render a literal `${…}`.
///  2. Targeted interaction tests for each interactive control, preferring to
///     read a public property off the rendered widget (robust) over matching
///     on labels.
///
/// A test here fails on the exact regressions we've hit: a "controlled" widget
/// with an empty `onChanged` (value never changes) or a leaked `\$` (literal
/// text shown). Both would pass a plain "does it render" check.
void main() {
  // Enable mouse/trackpad drag in tests, mirroring the app's ScrollBehavior, so
  // drag-driven widgets (RefreshIndicator, scroll notifications) behave here as
  // they do on web.
  Widget host(WidgetInfo info) => MaterialApp(
    scrollBehavior: _TestScrollBehavior(),
    home: Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 360, maxWidth: 480),
          child: Builder(builder: info.builder),
        ),
      ),
    ),
  );

  /// Pumps a sample by catalog name and settles one-shot animations.
  Future<void> pump(WidgetTester tester, String name) async {
    final info = WidgetData.getByName(name);
    expect(info, isNotNull, reason: 'No catalog entry named "$name"');
    await tester.pumpWidget(host(info!));
    await tester.pumpAndSettle();
  }

  // ---------------------------------------------------------------------------
  // Layer 1 — catalog-wide regression sweep, one group per category.
  // ---------------------------------------------------------------------------
  group('No sample renders literal \${…} interpolation', () {
    for (final category in WidgetCategory.values) {
      testWidgets(category.name, (tester) async {
        final offenders = <String>[];
        for (final w in WidgetData.getWidgetsByCategory(category)) {
          // Rendering correctness is covered by catalog_test; here we only
          // care about the text output, so swallow framework errors (missing
          // network images, overflow on the fixed surface, etc.).
          final previous = FlutterError.onError;
          FlutterError.onError = (_) {};
          try {
            await tester.pumpWidget(host(w));
            await tester.pump(const Duration(milliseconds: 200));
          } catch (_) {
            // ignore — not this test's concern
          } finally {
            FlutterError.onError = previous;
          }
          if (find.textContaining(r'${').evaluate().isNotEmpty) {
            offenders.add(w.name);
          }
        }
        // Dispose the last sample, then advance the clock so any lingering
        // timers (e.g. FutureBuilder's `Future.delayed` in `async`) fire and
        // don't trip the pending-timer check at teardown.
        await tester.pumpWidget(const SizedBox());
        await tester.pump(const Duration(seconds: 3));
        expect(
          offenders,
          isEmpty,
          reason:
              'These samples show a literal "\${…}" (an un-interpolated '
              'string): ${offenders.join(', ')}',
        );
      });
    }
  });

  // ---------------------------------------------------------------------------
  // Layer 2 — targeted interaction tests, grouped by section.
  // ---------------------------------------------------------------------------

  group('Input · toggles flip on tap', () {
    testWidgets('Checkbox', (tester) async {
      await pump(tester, 'Checkbox');
      bool value() => tester.widget<Checkbox>(find.byType(Checkbox)).value!;
      final before = value();
      await tester.tap(find.byType(Checkbox));
      await tester.pumpAndSettle();
      expect(value(), isNot(before));
    });

    testWidgets('Switch', (tester) async {
      await pump(tester, 'Switch');
      bool value() => tester.widget<Switch>(find.byType(Switch)).value;
      final before = value();
      await tester.tap(find.byType(Switch));
      await tester.pumpAndSettle();
      expect(value(), isNot(before));
    });

    testWidgets('SwitchListTile', (tester) async {
      await pump(tester, 'SwitchListTile');
      bool value() =>
          tester.widget<SwitchListTile>(find.byType(SwitchListTile)).value;
      final before = value();
      await tester.tap(find.byType(SwitchListTile));
      await tester.pumpAndSettle();
      expect(value(), isNot(before));
    });

    testWidgets('CheckboxListTile', (tester) async {
      await pump(tester, 'CheckboxListTile');
      bool? value() =>
          tester.widget<CheckboxListTile>(find.byType(CheckboxListTile)).value;
      final before = value();
      await tester.tap(find.byType(CheckboxListTile));
      await tester.pumpAndSettle();
      expect(value(), isNot(before));
    });

    testWidgets('FilterChip', (tester) async {
      await pump(tester, 'FilterChip');
      bool selected() =>
          tester.widget<FilterChip>(find.byType(FilterChip)).selected;
      final before = selected();
      await tester.tap(find.byType(FilterChip));
      await tester.pumpAndSettle();
      expect(selected(), isNot(before));
    });
  });

  group('Input · value pickers respond', () {
    testWidgets('Slider drag changes value', (tester) async {
      await pump(tester, 'Slider');
      double value() => tester.widget<Slider>(find.byType(Slider)).value;
      final before = value();
      await tester.drag(find.byType(Slider), const Offset(-120, 0));
      await tester.pumpAndSettle();
      expect(value(), isNot(before));
    });

    testWidgets('RangeSlider drag changes values', (tester) async {
      await pump(tester, 'RangeSlider');
      RangeValues values() =>
          tester.widget<RangeSlider>(find.byType(RangeSlider)).values;
      final before = values();
      await tester.drag(find.byType(RangeSlider), const Offset(-80, 0));
      await tester.pumpAndSettle();
      expect(values(), isNot(before));
    });

    testWidgets('DropdownButton selection changes', (tester) async {
      await pump(tester, 'DropdownButton');
      String value() => tester
          .widget<DropdownButton<String>>(find.byType(DropdownButton<String>))
          .value!;
      final before = value();
      await tester.tap(find.byType(DropdownButton<String>));
      await tester.pumpAndSettle();
      // Pick an item different from the current one.
      final target = before == 'Two' ? 'Three' : 'Two';
      await tester.tap(find.text(target).last);
      await tester.pumpAndSettle();
      expect(value(), target);
    });
  });

  group('Input · grouped selection', () {
    testWidgets('SegmentedButton selection changes', (tester) async {
      await pump(tester, 'SegmentedButton');
      final finder = find.byWidgetPredicate((w) => w is SegmentedButton);
      Set<Object?> selected() =>
          ((tester.widget(finder) as dynamic).selected as Set).cast<Object?>();
      final before = Set<Object?>.of(selected());
      await tester.tap(find.text('Week'));
      await tester.pumpAndSettle();
      expect(selected(), isNot(before));
    });

    testWidgets('ToggleButtons selection changes', (tester) async {
      await pump(tester, 'ToggleButtons');
      List<bool> selected() =>
          tester.widget<ToggleButtons>(find.byType(ToggleButtons)).isSelected;
      final before = List<bool>.of(selected());
      await tester.tap(find.byIcon(Icons.cloud));
      await tester.pumpAndSettle();
      expect(selected(), isNot(before));
    });

    testWidgets('Radio selects the tapped option', (tester) async {
      await pump(tester, 'Radio');
      // RadioGroup owns the selection in the current API; read it directly.
      int? groupValue() => tester
          .widget<RadioGroup<int>>(find.byType(RadioGroup<int>))
          .groupValue;
      final before = groupValue();
      await tester.tap(find.byType(Radio<int>).at(1)); // Option 2
      await tester.pumpAndSettle();
      expect(groupValue(), isNot(before));
    });
  });

  group('Cupertino · controls respond', () {
    testWidgets('CupertinoSwitch flips on tap', (tester) async {
      await pump(tester, 'CupertinoSwitch');
      bool value() =>
          tester.widget<CupertinoSwitch>(find.byType(CupertinoSwitch)).value;
      final before = value();
      await tester.tap(find.byType(CupertinoSwitch));
      await tester.pumpAndSettle();
      expect(value(), isNot(before));
    });

    testWidgets('CupertinoSlider drag changes value', (tester) async {
      await pump(tester, 'CupertinoSlider');
      double value() =>
          tester.widget<CupertinoSlider>(find.byType(CupertinoSlider)).value;
      final before = value();
      // The thumb sits at the far left (value 0.0); start the drag on it.
      final rect = tester.getRect(find.byType(CupertinoSlider));
      await tester.dragFrom(
        rect.centerLeft + const Offset(10, 0),
        const Offset(150, 0),
      );
      await tester.pumpAndSettle();
      expect(value(), isNot(before));
    });
  });

  group('Material · expansion', () {
    testWidgets('ExpansionTile reveals children when tapped', (tester) async {
      await pump(tester, 'ExpansionTile');
      expect(find.text('Child 1'), findsNothing);
      await tester.tap(find.text('Expand me'));
      await tester.pumpAndSettle();
      expect(find.text('Child 1'), findsOneWidget);
    });
  });

  group('Scrolling · drag-driven widgets', () {
    testWidgets('NotificationListener reacts to scrolling', (tester) async {
      await pump(tester, 'NotificationListener');
      expect(find.text('Scroll to see notifications'), findsOneWidget);
      await tester.drag(find.byType(ListView), const Offset(0, -200));
      await tester.pumpAndSettle();
      // The status text must have moved off its initial value.
      expect(find.text('Scroll to see notifications'), findsNothing);
    });

    testWidgets('RefreshIndicator fires on pull-to-refresh', (tester) async {
      await pump(tester, 'RefreshIndicator');
      // Pull down from the top of the list; the refresh spinner appearing
      // proves the gesture triggered onRefresh.
      await tester.fling(find.byType(ListView), const Offset(0, 300), 1000);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.byType(RefreshProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('DraggableScrollableSheet is draggable (smoke)', (
      tester,
    ) async {
      // A full resize assertion is integration-level; here we confirm the sheet
      // renders a scrollable and a drag completes without throwing.
      await pump(tester, 'DraggableScrollableSheet');
      expect(find.byType(DraggableScrollableSheet), findsOneWidget);
      await tester.drag(find.byType(ListView).first, const Offset(0, -120));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });
  });
}

/// Allows mouse/trackpad drags in tests, matching the app's scroll behavior.
class _TestScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => PointerDeviceKind.values.toSet();
}
