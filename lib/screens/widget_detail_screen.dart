import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/widget_data.dart';
import '../models/widget_info.dart';
import '../routing/app_router.dart';
import '../services/catalog_prefs.dart';
import '../theme/category_visuals.dart';
import '../theme/catalog_theme.dart';
import '../widgets/code_block.dart';
import '../widgets/difficulty_badge.dart';
import '../widgets/playground_view.dart';

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
        // Deep links land here with an empty back stack; give a home affordance.
        leading: context.canPop()
            ? null
            : IconButton(
                icon: const Icon(Icons.home_outlined),
                tooltip: 'Home',
                onPressed: () => context.go('/'),
              ),
        actions: [
          IconButton(
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
            color: isFavorite ? Theme.of(context).colorScheme.primary : null,
            tooltip: isFavorite ? 'Remove from favorites' : 'Add to favorites',
            onPressed: () => prefs.toggleFavorite(widgetInfo.name),
          ),
        ],
      ),
      body: FlutterPageFrame(
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
    );
  }

  /// The live preview: an interactive playground when the entry defines one,
  /// otherwise the static sample inside a bounded box.
  Widget _buildPreviewSection(BuildContext context) {
    final playground = widgetInfo.playground;
    if (playground != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const _SectionTitle('Interactive Playground'),
              const SizedBox(width: 8),
              Icon(
                Icons.tune,
                size: 18,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
          const SizedBox(height: 12),
          PlaygroundView(playground: playground),
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionTitle('Live Sample'),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: flutterCardDecoration(context, elevated: true),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: kPreviewMaxHeight),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 180),
              child: Center(child: widgetInfo.builder(context)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _DetailHeader(widgetInfo: widgetInfo),
          const SizedBox(height: 24),
          _buildPreviewSection(context),
          if (widgetInfo.whenToUse != null) ...[
            const SizedBox(height: 24),
            _SurfacePanel(
              title: 'When to use it',
              icon: Icons.lightbulb_outline,
              child: Text(
                widgetInfo.whenToUse!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
          if (widgetInfo.commonPitfalls.isNotEmpty) ...[
            const SizedBox(height: 24),
            _SurfacePanel(
              title: 'Common pitfalls',
              icon: Icons.warning_amber_rounded,
              child: Column(
                children: [
                  for (final p in widgetInfo.commonPitfalls)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.circle,
                            size: 7,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(width: 10),
                          Expanded(child: Text(p)),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
          if (widgetInfo.codeSnippet != null) ...[
            const SizedBox(height: 24),
            const _SectionTitle('Code Snippet'),
            const SizedBox(height: 8),
            CodeBlock(code: widgetInfo.codeSnippet!),
          ],
          if (widgetInfo.relatedWidgets.isNotEmpty) ...[
            const SizedBox(height: 24),
            _SurfacePanel(
              title: 'Related widgets',
              icon: Icons.hub_outlined,
              child: _RelatedWidgets(names: widgetInfo.relatedWidgets),
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
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                icon: const Icon(Icons.open_in_new, size: 18),
                label: const Text('View official docs'),
                onPressed: () => _openDocs(context, widgetInfo.docsUrl!),
              ),
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
                _DetailHeader(widgetInfo: widgetInfo),
                const SizedBox(height: 24),
                _buildPreviewSection(context),
                if (widgetInfo.whenToUse != null) ...[
                  const SizedBox(height: 24),
                  _SurfacePanel(
                    title: 'When to use it',
                    icon: Icons.lightbulb_outline,
                    child: Text(
                      widgetInfo.whenToUse!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
                if (widgetInfo.relatedWidgets.isNotEmpty) ...[
                  const SizedBox(height: 24),
                  _SurfacePanel(
                    title: 'Related widgets',
                    icon: Icons.hub_outlined,
                    child: _RelatedWidgets(names: widgetInfo.relatedWidgets),
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
                  const _SectionTitle('Code Snippet'),
                  const SizedBox(height: 8),
                  CodeBlock(code: widgetInfo.codeSnippet!),
                ],
                if (widgetInfo.commonPitfalls.isNotEmpty) ...[
                  const SizedBox(height: 24),
                  _SurfacePanel(
                    title: 'Common pitfalls',
                    icon: Icons.warning_amber_rounded,
                    child: Column(
                      children: [
                        for (final p in widgetInfo.commonPitfalls)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 7,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                const SizedBox(width: 10),
                                Expanded(child: Text(p)),
                              ],
                            ),
                          ),
                      ],
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

  Future<void> _openDocs(BuildContext context, String url) async {
    final messenger = ScaffoldMessenger.of(context);
    final uri = Uri.parse(url);
    final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok) {
      messenger.showSnackBar(SnackBar(content: Text('Could not open $url')));
    }
  }
}

class _DetailHeader extends StatelessWidget {
  const _DetailHeader({required this.widgetInfo});

  final WidgetInfo widgetInfo;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final accent = categoryAccent(context, widgetInfo.category);
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: flutterCardDecoration(context, elevated: true),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(height: 2, color: accent),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CategoryIconBadge(category: widgetInfo.category),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        widgetInfo.name,
                        style: theme.textTheme.headlineMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Text(
                  widgetInfo.description,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    DifficultyBadge(difficulty: widgetInfo.difficulty),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 9,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: accent.withValues(alpha: 0.09),
                        borderRadius: BorderRadius.circular(
                          CatalogTheme.radius,
                        ),
                        border: Border.all(
                          color: accent.withValues(alpha: 0.28),
                        ),
                      ),
                      child: Text(
                        categoryLabel(widgetInfo.category),
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: accent,
                        ),
                      ),
                    ),
                    if (widgetInfo.playground != null)
                      Chip(
                        avatar: Icon(
                          Icons.tune,
                          size: 16,
                          color: scheme.primary,
                        ),
                        label: const Text('Playground'),
                        visualDensity: VisualDensity.compact,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SurfacePanel extends StatelessWidget {
  const _SurfacePanel({
    required this.title,
    required this.icon,
    required this.child,
  });

  final String title;
  final IconData icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: flutterCardDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: scheme.primary),
              const SizedBox(width: 8),
              Expanded(child: Text(title, style: theme.textTheme.titleMedium)),
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class _RelatedWidgets extends StatelessWidget {
  const _RelatedWidgets({required this.names});

  final List<String> names;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final name in names)
          if (WidgetData.getByName(name) != null)
            ActionChip(
              avatar: const Icon(Icons.widgets_outlined, size: 18),
              label: Text(name),
              onPressed: () => context.goToWidget(name),
            ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.titleLarge);
  }
}
