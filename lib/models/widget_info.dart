import 'package:flutter/material.dart';
import 'knobs.dart';

/// The top-level groupings shown on the home screen.
///
/// Each [WidgetInfo] belongs to exactly one category. Adding a value here
/// automatically adds a new section to the home screen — no other wiring is
/// required.
enum WidgetCategory {
  layout,
  text,
  input,
  assets,
  material,
  cupertino,
  interaction,
  styling,
  scrolling,
  async,
  animation,
  painting,
  effects,
  accessibility,
  utility,
}

/// How much Flutter experience a sample assumes, used to help newcomers find
/// approachable widgets and to let experienced users skip the basics.
enum WidgetDifficulty { beginner, intermediate, advanced }

/// A single catalog entry describing one Flutter widget.
///
/// A [WidgetInfo] is pure data: it pairs a short explanation with a live
/// [builder] that renders the real widget, plus optional teaching context.
/// The screens render whatever fields are present, so older entries that only
/// set the required fields continue to work unchanged.
///
/// To add a widget, append a `WidgetInfo` to the relevant list under
/// `lib/data/widgets/`. See `CONTRIBUTING.md` for the full template.
class WidgetInfo {
  /// The widget's class name as it appears in the Flutter SDK (e.g. `Padding`).
  /// Must be unique across the whole catalog.
  final String name;

  /// One- or two-sentence summary of what the widget does.
  final String description;

  /// The category this widget is filed under on the home screen.
  final WidgetCategory category;

  /// Builds a live, interactive sample of the widget for the detail screen.
  final WidgetBuilder builder;

  /// Optional copy-pasteable source that produces the live sample.
  final String? codeSnippet;

  /// Optional guidance on *when* to reach for this widget over alternatives.
  final String? whenToUse;

  /// Optional list of common mistakes or gotchas to watch out for.
  final List<String> commonPitfalls;

  /// Optional names of related catalog entries. Each value should match the
  /// [name] of another [WidgetInfo]; this is enforced by the catalog tests.
  final List<String> relatedWidgets;

  /// Optional link to the official Flutter API documentation.
  final String? docsUrl;

  /// Free-form use-case keywords that power search (e.g. `['rounded corners']`).
  final List<String> tags;

  /// How much experience the sample assumes. Defaults to [WidgetDifficulty.beginner].
  final WidgetDifficulty difficulty;

  /// Optional interactive playground with live-editable knobs. When present,
  /// the detail screen renders tweakable controls alongside the preview.
  final WidgetPlayground? playground;

  const WidgetInfo({
    required this.name,
    required this.description,
    required this.category,
    required this.builder,
    this.codeSnippet,
    this.whenToUse,
    this.commonPitfalls = const [],
    this.relatedWidgets = const [],
    this.docsUrl,
    this.tags = const [],
    this.difficulty = WidgetDifficulty.beginner,
    this.playground,
  });

  /// Whether this entry carries any of the richer teaching fields beyond the
  /// basic description + sample. Used by screens to decide what to show.
  bool get hasTeachingContent =>
      whenToUse != null ||
      commonPitfalls.isNotEmpty ||
      relatedWidgets.isNotEmpty ||
      docsUrl != null;

  /// Lowercased haystack used by the search feature.
  String get searchText => [name, description, ...tags].join(' ').toLowerCase();
}
