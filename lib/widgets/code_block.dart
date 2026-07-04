import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';
import 'package:flutter_highlight/themes/atom-one-light.dart';
import 'package:url_launcher/url_launcher.dart';

/// A syntax-highlighted, selectable Dart code block with a toolbar offering
/// "Copy" and "Open in DartPad" actions.
///
/// DartPad has no public API for injecting arbitrary source via URL, so the
/// DartPad action copies the snippet and opens dartpad.dev in a new tab, ready
/// to paste — the most reliable cross-platform experience available.
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

    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SelectionArea(
              child: HighlightView(
                code,
                language: 'dart',
                theme: highlightTheme,
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
                textStyle: TextStyle(fontFamily: 'Courier', fontSize: fontSize),
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
                ? 'Snippet copied — paste it into DartPad'
                : 'Could not open DartPad',
          ),
          duration: const Duration(seconds: 2),
        ),
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
    // The block sits on a dark highlight background in dark mode and a light
    // one in light mode; pick a legible foreground for either.
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
