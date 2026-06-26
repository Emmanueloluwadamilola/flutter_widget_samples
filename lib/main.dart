import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/home_screen.dart';
import 'services/catalog_prefs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(MyApp(prefs: CatalogPrefs(prefs)));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.prefs});

  final CatalogPrefs prefs;

  @override
  Widget build(BuildContext context) {
    return CatalogScope(
      prefs: prefs,
      // Rebuild MaterialApp when the theme mode changes.
      child: AnimatedBuilder(
        animation: prefs,
        builder: (context, _) {
          return MaterialApp(
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
            themeMode: prefs.themeMode,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
