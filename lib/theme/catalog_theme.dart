import 'package:flutter/material.dart';

class CatalogTheme {
  const CatalogTheme._();

  static const double radius = 8;
  static const double maxContentWidth = 1200;
  static const Color flutterBlue = Color(0xFF0066B4);
  static const Color flutterSky = Color(0xFF027DFD);
  static const Color flutterNavy = Color(0xFF0E1117);
  static const Color ink = Color(0xFF0E1117);
  static const Color subduedInk = Color(0xFF4B6378);
  static const Color paper = Color(0xFFFFFFFF);
  static const Color canvas = Color(0xFFF7FBFF);
  static const Color frost = Color(0xFFEEF7FF);

  static ThemeData light() => _buildTheme(Brightness.light);

  static ThemeData dark() => _buildTheme(Brightness.dark);

  static ThemeData _buildTheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final scheme =
        ColorScheme.fromSeed(
          seedColor: flutterBlue,
          brightness: brightness,
        ).copyWith(
          primary: isDark ? const Color(0xFF74B9FF) : flutterBlue,
          secondary: isDark ? const Color(0xFF9AD0FF) : flutterSky,
          tertiary: isDark ? const Color(0xFFBFDFFF) : flutterBlue,
          surface: isDark ? const Color(0xFF07182D) : canvas,
          onSurface: isDark ? const Color(0xFFF7F7FA) : ink,
          onSurfaceVariant: isDark ? const Color(0xFFC6D7EA) : subduedInk,
          surfaceContainerLowest: isDark ? const Color(0xFF0B203A) : paper,
          surfaceContainerLow: isDark ? const Color(0xFF102A4A) : frost,
          surfaceContainer: isDark
              ? const Color(0xFF15375F)
              : const Color(0xFFE4F3FF),
          surfaceContainerHighest: isDark
              ? const Color(0xFF1C4778)
              : const Color(0xFFD6ECFF),
          outline: isDark ? const Color(0xFF2C5C91) : const Color(0xFFD6E9FF),
          outlineVariant: isDark
              ? const Color(0xFF1D426D)
              : const Color(0xFFD6E9FF),
        );

    final base = ThemeData(colorScheme: scheme, useMaterial3: true);
    final textTheme = base.textTheme.apply(
      bodyColor: scheme.onSurface,
      displayColor: scheme.onSurface,
      fontFamily: 'Roboto',
    );

    final outline = scheme.outlineVariant.withValues(
      alpha: isDark ? 0.32 : 0.7,
    );

    return base.copyWith(
      scaffoldBackgroundColor: scheme.surface,
      visualDensity: VisualDensity.standard,
      textTheme: textTheme.copyWith(
        headlineMedium: textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
          height: 1.1,
        ),
        titleLarge: textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
        ),
        titleMedium: textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
        ),
        labelLarge: textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
        ),
        labelSmall: textTheme.labelSmall?.copyWith(
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
        ),
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: false,
        scrolledUnderElevation: 0,
        backgroundColor: scheme.surface.withValues(alpha: 0.98),
        foregroundColor: scheme.onSurface,
        titleTextStyle: textTheme.titleLarge?.copyWith(
          color: scheme.onSurface,
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: scheme.surfaceContainerLowest,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: BorderSide(color: outline),
        ),
        shadowColor: const Color(0x141C1C23),
      ),
      chipTheme: base.chipTheme.copyWith(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: BorderSide(color: outline),
        ),
        side: BorderSide(color: outline),
        showCheckmark: false,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: Colors.white,
          minimumSize: const Size(0, 44),
          textStyle: const TextStyle(fontWeight: FontWeight.w500),
          shape: const StadiumBorder(),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(0, 44),
          side: BorderSide(color: outline),
          textStyle: const TextStyle(fontWeight: FontWeight.w500),
          shape: const StadiumBorder(),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surfaceContainerLow,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: scheme.primary, width: 1.6),
        ),
      ),
      dividerTheme: DividerThemeData(color: outline, space: 1),
      listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        iconColor: scheme.primary,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}

BoxDecoration flutterCardDecoration(
  BuildContext context, {
  Color? color,
  bool elevated = false,
}) {
  final scheme = Theme.of(context).colorScheme;
  final dark = Theme.of(context).brightness == Brightness.dark;
  return BoxDecoration(
    color: color ?? scheme.surfaceContainerLowest,
    borderRadius: BorderRadius.circular(CatalogTheme.radius),
    border: Border.all(
      color: scheme.outlineVariant.withValues(alpha: dark ? 0.78 : 1),
    ),
    boxShadow: elevated
        ? [
            BoxShadow(
              color: Colors.black.withValues(alpha: dark ? 0.22 : 0.08),
              blurRadius: 40,
              offset: const Offset(0, 20),
            ),
            BoxShadow(
              color: Colors.black.withValues(alpha: dark ? 0.18 : 0.04),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ]
        : null,
  );
}

class FlutterPageFrame extends StatelessWidget {
  const FlutterPageFrame({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Stack(
      children: [
        Positioned.fill(child: ColoredBox(color: scheme.surface)),
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: CatalogTheme.maxContentWidth,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.symmetric(
                  vertical: BorderSide(
                    color: scheme.outlineVariant.withValues(alpha: 0.8),
                  ),
                ),
              ),
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
