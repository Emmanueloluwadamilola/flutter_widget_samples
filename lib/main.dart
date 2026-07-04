import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'routing/app_router.dart';
import 'services/catalog_prefs.dart';

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
            routerConfig: _router,
          );
        },
      ),
    );
  }
}
