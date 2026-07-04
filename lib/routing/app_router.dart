import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../data/widget_data.dart';
import '../models/widget_info.dart';
import '../screens/category_screen.dart';
import '../screens/home_screen.dart';
import '../screens/widget_detail_screen.dart';

/// Builds the app's go_router configuration. Every category and widget has its
/// own URL so pages can be bookmarked, shared, and opened directly:
///
///   /                       -> home
///   /category/animation     -> a category listing
///   /widget/AnimatedList    -> a single widget's detail page
///
/// A fresh instance is created per app instance (see `MyApp`) so navigation
/// state never leaks between, e.g., widget tests.
GoRouter createAppRouter() => GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'category/:category',
          builder: (context, state) {
            final name = state.pathParameters['category'];
            final category = _categoryByName(name);
            if (category == null) {
              return NotFoundScreen(message: 'Unknown category "$name".');
            }
            return CategoryScreen(category: category);
          },
        ),
        GoRoute(
          path: 'widget/:name',
          builder: (context, state) {
            final name = state.pathParameters['name'] ?? '';
            final info = WidgetData.getByName(name);
            if (info == null) {
              return NotFoundScreen(message: 'No widget named "$name".');
            }
            return WidgetDetailScreen(widgetInfo: info);
          },
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) =>
      NotFoundScreen(message: 'Page not found: ${state.uri}'),
);

WidgetCategory? _categoryByName(String? name) {
  for (final c in WidgetCategory.values) {
    if (c.name == name) return c;
  }
  return null;
}

/// Navigation helpers so screens don't hand-build path strings.
extension CatalogNavigation on BuildContext {
  /// Opens a widget's detail page at `/widget/<name>`.
  void goToWidget(String name) =>
      GoRouter.of(this).push('/widget/${Uri.encodeComponent(name)}');

  /// Opens a category listing at `/category/<name>`.
  void goToCategory(WidgetCategory category) =>
      GoRouter.of(this).push('/category/${category.name}');
}

/// Shown for unknown categories/widgets or bad URLs, with a way back to home.
class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Not found')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.search_off, size: 48),
              const SizedBox(height: 12),
              Text(message, textAlign: TextAlign.center),
              const SizedBox(height: 16),
              FilledButton.icon(
                icon: const Icon(Icons.home),
                label: const Text('Back to catalog'),
                onPressed: () => context.go('/'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
