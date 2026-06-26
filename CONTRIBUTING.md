# Contributing

Thanks for helping grow the catalog! Adding a widget is a great first PR: it's a
single data entry — **no screens or navigation to touch**.

## Add a widget in 3 steps

### 1. Pick the file

Widgets live in `lib/data/widgets/`, one file per category (e.g.
`layout_widgets.dart`, `text_widgets.dart`). Open the file matching your widget's
category and find the `final List<WidgetInfo> ... = [ ... ];` list.

### 2. Append a `WidgetInfo`

Copy this template into the list. Required fields are marked; the rest are
optional teaching content — but please fill them in, they're the whole point of
the catalog.

```dart
WidgetInfo(
  // ── required ──────────────────────────────────────────────
  name: 'MyWidget',                       // exact Flutter class name, must be UNIQUE
  description: 'One sentence on what it does.',
  category: WidgetCategory.layout,        // must match the file you're in
  builder: (context) => const MyWidget(), // the LIVE sample shown in the app

  // ── teaching content (strongly encouraged) ───────────────
  whenToUse:
      'When to reach for this widget instead of the alternatives.',
  commonPitfalls: [
    'A real gotcha a newcomer would hit.',
  ],
  relatedWidgets: ['SomeOtherWidget'],    // must be names that EXIST in the catalog
  docsUrl: 'https://api.flutter.dev/flutter/widgets/MyWidget-class.html',
  tags: ['keyword', 'use-case'],          // powers search
  difficulty: WidgetDifficulty.beginner,  // beginner | intermediate | advanced

  // ── optional ──────────────────────────────────────────────
  codeSnippet: '''
MyWidget(
  // the code that produces the sample above
)
''',
),
```

**Guidelines that keep the catalog trustworthy:**

- The `builder` must render on its own inside a bounded box (max height ~360px).
  If your widget needs unbounded height (e.g. it lives in a scroll view), wrap
  the sample in a `SizedBox` + `SingleChildScrollView`.
- `name` must be unique across the **entire** catalog.
- Every value in `relatedWidgets` must be the `name` of another existing entry —
  the test suite will fail otherwise.
- Keep `whenToUse` / `commonPitfalls` accurate and concise.

### 3. Verify locally

Run the same checks CI runs. If these pass, your PR will too:

```bash
dart format .
flutter analyze
flutter test
```

The catalog tests automatically check your entry: that its sample renders, that
its name is unique, and that its `relatedWidgets` resolve.

## Adding a whole new category

1. Add a value to the `WidgetCategory` enum in `lib/models/widget_info.dart`.
   (The home screen picks it up automatically.)
2. Create `lib/data/widgets/<name>_widgets.dart` exporting a
   `final List<WidgetInfo>`.
3. Spread it into `allWidgets` in `lib/data/widget_data.dart`.
4. Add an icon for it to `_categoryIcons` in `lib/screens/home_screen.dart`.

That's it — thank you! 🎉
