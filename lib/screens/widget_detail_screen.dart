import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/widget_data.dart';
import '../models/widget_info.dart';
import '../services/catalog_prefs.dart';
import '../widgets/difficulty_badge.dart';

/// Maximum height of the live-sample preview box. Bounding the height gives
/// full-height widgets (NavigationRail, BottomAppBar, …) finite constraints so
/// they render instead of asserting. Keep in sync with the catalog test.
const double kPreviewMaxHeight = 360;

class WidgetDetailScreen extends StatefulWidget {
  final WidgetInfo widgetInfo;

  const WidgetDetailScreen({super.key, required this.widgetInfo});

  @override
  State<WidgetDetailScreen> createState() => _WidgetDetailScreenState();
}

class _WidgetDetailScreenState extends State<WidgetDetailScreen> {
  @override
  void initState() {
    super.initState();
    // Record the view after the first frame so the InheritedNotifier is ready.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) CatalogScope.of(context).recordView(widgetInfo.name);
    });
  }

  WidgetInfo get widgetInfo => widget.widgetInfo;

  @override
  Widget build(BuildContext context) {
    final prefs = CatalogScope.of(context);
    final isFavorite = prefs.isFavorite(widgetInfo.name);

    return Scaffold(
      appBar: AppBar(
        title: Text(widgetInfo.name),
        actions: [
          IconButton(
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
            color: isFavorite ? Colors.redAccent : null,
            tooltip: isFavorite ? 'Remove from favorites' : 'Add to favorites',
            onPressed: () => prefs.toggleFavorite(widgetInfo.name),
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final wide = constraints.maxWidth >= 800;
              if (wide) {
                return _buildWideLayout(context);
              } else {
                return _buildNarrowLayout(context);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              DifficultyBadge(difficulty: widgetInfo.difficulty),
              const Spacer(),
              Text(
                widgetInfo.category.name.toUpperCase(),
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            widgetInfo.description,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          const _SectionTitle('Live Sample'),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).dividerColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: kPreviewMaxHeight),
              child: Center(child: widgetInfo.builder(context)),
            ),
          ),
          if (widgetInfo.whenToUse != null) ...[
            const SizedBox(height: 24),
            const _SectionTitle('When to use it'),
            const SizedBox(height: 8),
            Text(
              widgetInfo.whenToUse!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
          if (widgetInfo.commonPitfalls.isNotEmpty) ...[
            const SizedBox(height: 24),
            const _SectionTitle('Common pitfalls'),
            const SizedBox(height: 8),
            ...widgetInfo.commonPitfalls.map(
              (p) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 2, right: 8),
                      child: Icon(
                        Icons.warning_amber_rounded,
                        size: 18,
                        color: Colors.orange,
                      ),
                    ),
                    Expanded(child: Text(p)),
                  ],
                ),
              ),
            ),
          ],
          if (widgetInfo.codeSnippet != null) ...[
            const SizedBox(height: 24),
            Row(
              children: [
                const _SectionTitle('Code Snippet'),
                const Spacer(),
                TextButton.icon(
                  icon: const Icon(Icons.copy, size: 18),
                  label: const Text('Copy'),
                  onPressed: () => _copyCode(context),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SelectableText(
                widgetInfo.codeSnippet!,
                style: const TextStyle(fontFamily: 'Courier'),
              ),
            ),
          ],
          if (widgetInfo.relatedWidgets.isNotEmpty) ...[
            const SizedBox(height: 24),
            const _SectionTitle('Related widgets'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final name in widgetInfo.relatedWidgets)
                  if (WidgetData.getByName(name) != null)
                    ActionChip(
                      avatar: const Icon(Icons.widgets_outlined, size: 18),
                      label: Text(name),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => WidgetDetailScreen(
                            widgetInfo: WidgetData.getByName(name)!,
                          ),
                        ),
                      ),
                    ),
              ],
            ),
          ],
          if (widgetInfo.tags.isNotEmpty) ...[
            const SizedBox(height: 24),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                for (final tag in widgetInfo.tags)
                  Chip(
                    label: Text('#$tag'),
                    visualDensity: VisualDensity.compact,
                  ),
              ],
            ),
          ],
          if (widgetInfo.docsUrl != null) ...[
            const SizedBox(height: 24),
            OutlinedButton.icon(
              icon: const Icon(Icons.open_in_new, size: 18),
              label: const Text('View official docs'),
              onPressed: () => _openDocs(context, widgetInfo.docsUrl!),
            ),
          ],
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    DifficultyBadge(difficulty: widgetInfo.difficulty),
                    const SizedBox(width: 12),
                    Text(
                      widgetInfo.category.name.toUpperCase(),
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  widgetInfo.description,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 24),
                const _SectionTitle('Live Sample'),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).dividerColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: kPreviewMaxHeight),
                    child: Center(child: widgetInfo.builder(context)),
                  ),
                ),
                if (widgetInfo.whenToUse != null) ...[
                  const SizedBox(height: 24),
                  const _SectionTitle('When to use it'),
                  const SizedBox(height: 8),
                  Text(
                    widgetInfo.whenToUse!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
                if (widgetInfo.relatedWidgets.isNotEmpty) ...[
                  const SizedBox(height: 24),
                  const _SectionTitle('Related widgets'),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      for (final name in widgetInfo.relatedWidgets)
                        if (WidgetData.getByName(name) != null)
                          ActionChip(
                            avatar: const Icon(Icons.widgets_outlined, size: 18),
                            label: Text(name),
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => WidgetDetailScreen(
                                  widgetInfo: WidgetData.getByName(name)!,
                                ),
                              ),
                            ),
                          ),
                    ],
                  ),
                ],
                if (widgetInfo.tags.isNotEmpty) ...[
                  const SizedBox(height: 24),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      for (final tag in widgetInfo.tags)
                        Chip(
                          label: Text('#$tag'),
                          visualDensity: VisualDensity.compact,
                        ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widgetInfo.codeSnippet != null) ...[
                  Row(
                    children: [
                      const _SectionTitle('Code Snippet'),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.copy, size: 20),
                        tooltip: 'Copy Code',
                        onPressed: () => _copyCode(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SelectableText(
                      widgetInfo.codeSnippet!,
                      style: const TextStyle(fontFamily: 'Courier', fontSize: 13),
                    ),
                  ),
                ],
                if (widgetInfo.commonPitfalls.isNotEmpty) ...[
                  const SizedBox(height: 24),
                  const _SectionTitle('Common pitfalls'),
                  const SizedBox(height: 8),
                  ...widgetInfo.commonPitfalls.map(
                    (p) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 2, right: 8),
                            child: Icon(
                              Icons.warning_amber_rounded,
                              size: 18,
                              color: Colors.orange,
                            ),
                          ),
                          Expanded(child: Text(p)),
                        ],
                      ),
                    ),
                  ),
                ],
                if (widgetInfo.docsUrl != null) ...[
                  const SizedBox(height: 24),
                  OutlinedButton.icon(
                    icon: const Icon(Icons.open_in_new, size: 18),
                    label: const Text('View official docs'),
                    onPressed: () => _openDocs(context, widgetInfo.docsUrl!),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _copyCode(BuildContext context) {
    Clipboard.setData(ClipboardData(text: widgetInfo.codeSnippet!));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Code copied to clipboard'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  Future<void> _openDocs(BuildContext context, String url) async {
    final messenger = ScaffoldMessenger.of(context);
    final uri = Uri.parse(url);
    final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok) {
      messenger.showSnackBar(SnackBar(content: Text('Could not open $url')));
    }
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
