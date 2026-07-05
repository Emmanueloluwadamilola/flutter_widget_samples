import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'routing/app_router.dart';
import 'services/catalog_prefs.dart';

/// Enables drag-to-scroll with a mouse and trackpad, not just touch. Flutter
/// disables mouse dragging by default on web/desktop, which makes drag-driven
/// widgets (RefreshIndicator pull-to-refresh, DraggableScrollableSheet, and
/// scroll notifications) feel broken with a mouse. This restores them.
class _AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => <PointerDeviceKind>{
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
    PointerDeviceKind.stylus,
  };
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(MyApp(prefs: CatalogPrefs(prefs)));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.prefs});

  final CatalogPrefs prefs;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Created once per app instance so navigation state stays stable across
  // theme rebuilds and never leaks between tests.
  final GoRouter _router = createAppRouter();

  @override
  Widget build(BuildContext context) {
    return CatalogScope(
      prefs: widget.prefs,
      // Rebuild MaterialApp when the theme mode changes.
      child: AnimatedBuilder(
        animation: widget.prefs,
        builder: (context, _) {
          return MaterialApp.router(
            title: 'Flutter Widget Catalog',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple,
                brightness: Brightness.dark,
              ),
              useMaterial3: true,
            ),
            themeMode: widget.prefs.themeMode,
            scrollBehavior: _AppScrollBehavior(),
            routerConfig: _router,
          );
        },
      ),
    );
  }
}
