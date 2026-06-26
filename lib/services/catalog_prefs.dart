import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// App-wide preferences backed by [SharedPreferences].
///
/// Holds the user's favorite widgets, recently-viewed history, and theme mode.
/// It is a [ChangeNotifier] so the UI rebuilds when any of these change, and is
/// exposed to the widget tree through [CatalogScope].
class CatalogPrefs extends ChangeNotifier {
  CatalogPrefs(this._prefs) {
    _load();
  }

  final SharedPreferences _prefs;

  static const _favoritesKey = 'favorites';
  static const _recentsKey = 'recents';
  static const _themeKey = 'themeMode';
  static const maxRecents = 12;

  final Set<String> _favorites = {};
  final List<String> _recents = [];
  ThemeMode _themeMode = ThemeMode.system;

  /// Names of favorited widgets.
  Set<String> get favorites => Set.unmodifiable(_favorites);

  /// Names of recently-viewed widgets, most recent first.
  List<String> get recents => List.unmodifiable(_recents);

  ThemeMode get themeMode => _themeMode;

  void _load() {
    _favorites.addAll(_prefs.getStringList(_favoritesKey) ?? const []);
    _recents.addAll(_prefs.getStringList(_recentsKey) ?? const []);
    final stored = _prefs.getString(_themeKey);
    _themeMode = ThemeMode.values.firstWhere(
      (m) => m.name == stored,
      orElse: () => ThemeMode.system,
    );
  }

  bool isFavorite(String name) => _favorites.contains(name);

  void toggleFavorite(String name) {
    if (!_favorites.remove(name)) _favorites.add(name);
    _prefs.setStringList(_favoritesKey, _favorites.toList());
    notifyListeners();
  }

  /// Records that [name] was viewed, moving it to the front of the history.
  void recordView(String name) {
    _recents.remove(name);
    _recents.insert(0, name);
    if (_recents.length > maxRecents) {
      _recents.removeRange(maxRecents, _recents.length);
    }
    _prefs.setStringList(_recentsKey, _recents);
    notifyListeners();
  }

  void setThemeMode(ThemeMode mode) {
    if (mode == _themeMode) return;
    _themeMode = mode;
    _prefs.setString(_themeKey, mode.name);
    notifyListeners();
  }

  /// Cycles system → light → dark → system for a simple toolbar toggle.
  void cycleThemeMode() {
    const order = [ThemeMode.system, ThemeMode.light, ThemeMode.dark];
    setThemeMode(order[(order.indexOf(_themeMode) + 1) % order.length]);
  }
}

/// Provides a [CatalogPrefs] to the subtree and rebuilds dependents on change.
class CatalogScope extends InheritedNotifier<CatalogPrefs> {
  const CatalogScope({
    super.key,
    required CatalogPrefs prefs,
    required super.child,
  }) : super(notifier: prefs);

  static CatalogPrefs of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<CatalogScope>();
    assert(scope != null, 'No CatalogScope found in context');
    return scope!.notifier!;
  }
}
