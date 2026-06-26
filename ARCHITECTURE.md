# Architecture

The app is small and deliberately **data-driven**: the catalog is data, the
screens are thin renderers. Adding content never requires touching UI code.

## Layers

```
lib/
├── main.dart                  App root: theme (light/dark/system) + CatalogScope
├── models/
│   └── widget_info.dart       WidgetInfo data class + WidgetCategory/Difficulty enums
├── data/
│   ├── widget_data.dart       Aggregates all entries; lookup + search helpers
│   └── widgets/               One file per category, each a List<WidgetInfo>
├── screens/
│   ├── home_screen.dart       Categories, favorites, recents, responsive layout
│   ├── category_screen.dart   The widgets within one category
│   ├── widget_detail_screen.dart   Live sample + teaching content + code
│   └── catalog_search_delegate.dart   Full-catalog search
├── services/
│   └── catalog_prefs.dart     Favorites/recents/theme persistence (ChangeNotifier)
└── widgets/
    └── difficulty_badge.dart  Small shared UI piece
```

## Data model

The heart of the app is [`WidgetInfo`](lib/models/widget_info.dart) — an immutable
record describing one widget:

| Field            | Purpose                                              |
| ---------------- | ---------------------------------------------------- |
| `name`           | Unique class name (also the search/lookup key)       |
| `description`    | One-line summary                                     |
| `category`       | Which `WidgetCategory` section it belongs to         |
| `builder`        | Builds the **live** sample shown in the detail view  |
| `codeSnippet`    | Copy-paste source for the sample                     |
| `whenToUse`      | Decision guidance                                    |
| `commonPitfalls` | Gotchas                                              |
| `relatedWidgets` | Names of related entries (rendered as nav chips)     |
| `docsUrl`        | Official API docs link                               |
| `tags`           | Use-case keywords powering search                    |
| `difficulty`     | beginner / intermediate / advanced                   |

All teaching fields are optional, so older minimal entries keep working; screens
check what's present and render accordingly (`WidgetInfo.hasTeachingContent`).

## Aggregation & lookup

[`WidgetData`](lib/data/widget_data.dart) spreads every per-category list into a
single `allWidgets`, and exposes:

- `getWidgetsByCategory(category)` — for the category screen.
- `getByName(name)` — O(1) lookup, used by related-widget navigation.
- `search(query)` — name/description/tag matching, ranked by name-prefix first.

## State & persistence

[`CatalogPrefs`](lib/services/catalog_prefs.dart) is a `ChangeNotifier` backed by
`shared_preferences`. It stores favorites, recently-viewed history, and theme
mode. It's exposed to the tree via `CatalogScope` (an `InheritedNotifier`), and
`main.dart` rebuilds `MaterialApp` when the theme changes. No external state
management package is used.

## Rendering constraint worth knowing

The detail screen renders each sample inside a bounded box
(`kPreviewMaxHeight = 360`). This gives full-height widgets (e.g. `NavigationRail`,
`BottomAppBar`) finite constraints so they render instead of asserting. The
[catalog test](test/catalog_test.dart) mirrors this exact box, so "passes the
test" means "renders in the app."

## Testing strategy

- `test/catalog_test.dart` — treats the catalog as data: every sample must
  render, names must be unique, and `relatedWidgets` must resolve.
- `test/widget_test.dart` — app-level smoke tests (launch, navigate, search).

Because the catalog is data, these tests scale automatically: a new `WidgetInfo`
is validated the moment it's added, with no new test code.
