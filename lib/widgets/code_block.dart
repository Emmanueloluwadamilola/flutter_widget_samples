import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';
import 'package:flutter_highlight/themes/atom-one-light.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/catalog_theme.dart';

/// A syntax-highlighted, selectable Dart code block with copy and DartPad
/// actions. The shell uses a compact browser/code-card treatment: frosted
/// chrome, tiny dots, quiet filename, and a raised paper panel.
class CodeBlock extends StatelessWidget {
  const CodeBlock({super.key, required this.code, this.fontSize = 13});

  final String code;
  final double fontSize;

  static final Uri _dartPadUri = Uri.parse('https://dartpad.dev/');

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final highlightTheme = isDark ? atomOneDarkTheme : atomOneLightTheme;
    final background =
        highlightTheme['root']?.backgroundColor ??
        Theme.of(context).colorScheme.surfaceContainerHighest;
    final outline = Theme.of(context).colorScheme.outlineVariant;

    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: flutterCardDecoration(
        context,
        elevated: true,
      ).copyWith(color: background),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerLow,
              border: Border(bottom: BorderSide(color: outline)),
            ),
            child: Row(
              children: [
                const SizedBox(width: 14),
                const _CodeDots(),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'lib/sample.dart',
                    style: TextStyle(
                      color: isDark ? Colors.white54 : Colors.black45,
                      fontSize: 12,
                      fontFamily: 'Courier',
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                _ToolbarButton(
                  icon: Icons.open_in_new,
                  label: 'DartPad',
                  tooltip: 'Copy snippet and open DartPad',
                  onPressed: () => _openInDartPad(context),
                ),
                _ToolbarButton(
                  icon: Icons.copy,
                  label: 'Copy',
                  tooltip: 'Copy code',
                  onPressed: () => _copy(context),
                ),
                const SizedBox(width: 4),
              ],
            ),
          ),
          ColoredBox(
            color: background,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SelectionArea(
                child: HighlightView(
                  code,
                  language: 'dart',
                  theme: highlightTheme,
                  padding: const EdgeInsets.fromLTRB(16, 14, 16, 18),
                  textStyle: TextStyle(
                    fontFamily: 'Courier',
                    fontSize: fontSize,
                    height: 1.55,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _copy(BuildContext context) {
    Clipboard.setData(ClipboardData(text: code));
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(
          content: Text('Code copied to clipboard'),
          duration: Duration(seconds: 1),
        ),
      );
  }

  Future<void> _openInDartPad(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    await Clipboard.setData(ClipboardData(text: code));
    final ok = await launchUrl(
      _dartPadUri,
      mode: LaunchMode.externalApplication,
    );
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            ok
                ? 'Snippet copied - paste it into DartPad'
                : 'Could not open DartPad',
          ),
          duration: const Duration(seconds: 2),
        ),
      );
  }
}

class _CodeDots extends StatelessWidget {
  const _CodeDots();

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.outline;
    return Row(
      children: [
        for (var i = 0; i < 3; i++) ...[
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          if (i != 2) const SizedBox(width: 6),
        ],
      ],
    );
  }
}

class _ToolbarButton extends StatelessWidget {
  const _ToolbarButton({
    required this.icon,
    required this.label,
    required this.tooltip,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final String tooltip;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final foreground = isDark ? Colors.white70 : Colors.black54;
    return Tooltip(
      message: tooltip,
      child: TextButton.icon(
        icon: Icon(icon, size: 16, color: foreground),
        label: Text(label, style: TextStyle(color: foreground, fontSize: 12)),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
