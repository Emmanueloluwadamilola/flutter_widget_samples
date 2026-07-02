# Flutter Widget Catalog

An interactive, premium, and fully responsive catalog of **300+ Flutter widgets**. Every entry in the catalog contains a **live, running sample**, a copy-paste **code snippet**, and practical teaching notes—such as *when to use it*, *common pitfalls*, *related widgets*, and a direct link to the official Flutter API documentation.

🔗 **Live demo:** [emmanueloluwadamilola.github.io/flutter_widget_samples](https://emmanueloluwadamilola.github.io/flutter_widget_samples/)

📦 **Repository:** [github.com/Emmanueloluwadamilola/flutter_widget_samples](https://github.com/Emmanueloluwadamilola/flutter_widget_samples)

The project is designed to cater to developers of all skill levels:
- **Experienced Developers** get a fast, search-friendly reference, copy-pasteable snippets, navigation chips to related widgets, and a persistent favorites shelf.
- **Learners & Newcomers** get a guided tour with difficulty badges (beginner, intermediate, advanced), "when to use it" decision guidance, and warning callouts for common pitfalls.

---

## 📱 Responsive & Adaptive Architecture

The application scales beautifully across all devices, including mobile, tablets, desktop, and web:
- **Centered Layout Boundaries**: On screens wider than 1200px (such as wide desktop displays), content is bounded to a maximum width of 1200px and centered to maintain visual balance and prevent elements from stretching awkwardly.
- **Home Screen Grid**: Adaptively renders category list-tiles on mobile, and transforms into a multi-column card grid (3 to 4 columns) on tablet/desktop layouts.
- **Category Screen Cards**: Displays a simple trailing-badge list view on small screens, which expands into an interactive, multi-column grid of rich information cards on larger screens.
- **Detail Screen Split View**: Dynamically splits into a two-column view on screens wider than 800px. The live interactive preview and description sit on the left, while the copyable code snippet and pitfalls are placed on the right—making side-by-side editing and reading possible.

---

## 🧭 Widget Categories Index

All widget samples are defined as plain data files inside the [lib/data/widgets/](lib/data/widgets/) directory. Below is the full list of widget types, including direct links to their source definition files:

| Category | Description | Data Source File |
| :--- | :--- | :--- |
| **Layout** | Positioning, alignment, sizing, and multi-child layout containers. | [layout_widgets.dart](lib/data/widgets/layout_widgets.dart) |
| **Text** | Typography, text styles, and rich text displays. | [text_widgets.dart](lib/data/widgets/text_widgets.dart) |
| **Input** | Forms, text fields, checkboxes, switches, and sliders. | [input_widgets.dart](lib/data/widgets/input_widgets.dart) |
| **Assets** | Handling images, icons, and local raw asset loading. | [assets_widgets.dart](lib/data/widgets/assets_widgets.dart) |
| **Material** | Standard Material Design components (buttons, dialogs, nav bars, etc.). | [material_widgets.dart](lib/data/widgets/material_widgets.dart) |
| **Cupertino** | Apple iOS-style widgets matching Apple Human Interface Guidelines. | [cupertino_widgets.dart](lib/data/widgets/cupertino_widgets.dart) |
| **Interaction** | Gesture detection, drag-and-drop, and scrollable/pannable viewers. | [interaction_widgets.dart](lib/data/widgets/interaction_widgets.dart) |
| **Styling** | Themes, decorations, background shapes, borders, and paddings. | [styling_widgets.dart](lib/data/widgets/styling_widgets.dart) |
| **Scrolling** | Lists, grids, slivers, scrollbars, and customized scroll behaviors. | [scrolling_widgets.dart](lib/data/widgets/scrolling_widgets.dart) |
| **Async** | Stream builders, future builders, and asynchronous data integrations. | [async_widgets.dart](lib/data/widgets/async_widgets.dart) |
| **Animation** | Implicit/explicit animations, transitions, and custom tween movements. | [animation_widgets.dart](lib/data/widgets/animation_widgets.dart) |
| **Painting** | Custom clipping, custom painters, shadows, and canvas drawing. | [painting_widgets.dart](lib/data/widgets/painting_widgets.dart) |
| **Effects** | Visual filters, backdrops, blurs, opacities, and shaders. | [effects_widgets.dart](lib/data/widgets/effects_widgets.dart) |
| **Accessibility** | Semantic tree overrides, screen reader support, and keyboard shortcuts. | [accessibility_widgets.dart](lib/data/widgets/accessibility_widgets.dart) |
| **Utility** | Core system states, media queries, theme lookups, and developer tools. | [utility_widgets.dart](lib/data/widgets/utility_widgets.dart) |

---

## 🛠️ Getting Started

Prefer to just browse? Open the **[live demo](https://emmanueloluwadamilola.github.io/flutter_widget_samples/)** — no setup needed.

To run the app locally, clone the repository and run the following:

```bash
# Clone the repository
git clone https://github.com/Emmanueloluwadamilola/flutter_widget_samples.git
cd flutter_widget_samples

# Retrieve dependencies
flutter pub get

# Launch the catalog on a local device, simulator, or browser
flutter run
```

### Environment Requirements
- **Flutter SDK**: Stable channel (Dart version `^3.8` or newer)
- **Supported Targets**: Android, iOS, Web, macOS, Windows, Linux

---

## 🏗️ How It Works (Technical Tour)

The project is built around a declarative, data-driven design pattern:

```
HomeScreen (Categories / Search / History)
   │
   └──▶ CategoryScreen (List / Grid of Widgets)
          │
          └──▶ WidgetDetailScreen (Interactive Live Sample + Code Snippet)
```

1. **The Data Core (`WidgetInfo`)**:
   Every widget sample is defined as a static instance of the `WidgetInfo` class (defined in [widget_info.dart](lib/models/widget_info.dart)). It holds descriptive metadata, tags, difficulty, a copyable code snippet, and a `WidgetBuilder` method that instantiates the live demo dynamically.
2. **Fast Lookups & Search (`WidgetData`)**:
   [widget_data.dart](lib/data/widget_data.dart) gathers all the category lists, sets up O(1) hash maps for quick cross-referencing, and handles name-prefix prioritized text search.
3. **State Management (`CatalogPrefs`)**:
   A simple, lightweight `ChangeNotifier` subclass in [catalog_prefs.dart](lib/services/catalog_prefs.dart) persists the user's favorite widgets, recent history, and dark/light mode configurations locally using the `shared_preferences` package. It uses no external heavy state management frameworks.

---

## 🤝 Contributing

Contributions are welcome! Adding a new widget sample is the perfect first contribution since it requires **zero UI or wiring code**:
1. Choose the category file under [lib/data/widgets/](lib/data/widgets/) that fits your widget.
2. Create and append a new `WidgetInfo` entry using the existing templates.
3. Verify your snippet and widget builder are correct.
4. Run static validation tests locally before opening a pull request.

---

## 🚦 Quality Gates & Tests

We enforce high catalog health standards using automated checks (run on pull requests via GitHub Actions in [.github/workflows/ci.yml](.github/workflows/ci.yml)):

```bash
# Verify formatting
dart format --output=none --set-exit-if-changed .

# Perform static code analysis
flutter analyze

# Execute automated test suite
flutter test
```

The automated test suite in [catalog_test.dart](test/catalog_test.dart) goes beyond simple assertions. It executes the following checks:
- Verifies that every single widget sample builder renders without throwing errors.
- Enforces globally unique widget names.
- Assures all `relatedWidgets` list entries correctly cross-reference existing entries.
