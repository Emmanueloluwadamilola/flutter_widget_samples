import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/widget_info.dart';

final List<WidgetInfo> utilityWidgets = [
  WidgetInfo(
    name: 'Placeholder',
    description:
        'A widget that draws a box to represent where other widgets will one day be added.',
    category: WidgetCategory.utility,
    builder: (context) => const SizedBox(
      width: 200,
      height: 200,
      child: Placeholder(color: Colors.blue, strokeWidth: 2.0),
    ),
    codeSnippet: '''
SizedBox(
  width: 200,
  height: 200,
  child: Placeholder(
    color: Colors.blue,
    strokeWidth: 2.0,
  ),
)
''',
  ),
  WidgetInfo(
    name: 'Visibility',
    description: 'Whether to show or hide a child.',
    category: WidgetCategory.utility,
    builder: (context) => const _VisibilitySample(),
    codeSnippet: '''
class _VisibilitySample extends StatefulWidget {
  const _VisibilitySample();

  @override
  State<_VisibilitySample> createState() => _VisibilitySampleState();
}

class _VisibilitySampleState extends State<_VisibilitySample> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              _isVisible = !_isVisible;
            });
          },
          child: Text(_isVisible ? 'Hide' : 'Show'),
        ),
        const SizedBox(height: 20),
        Visibility(
          visible: _isVisible,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.green,
            alignment: Alignment.center,
            child: const Text('Visible!', style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'Builder',
    description:
        'A stateless utility widget whose build method uses its builder callback to create the widget\'s child.',
    category: WidgetCategory.utility,
    builder: (context) => Builder(
      builder: (BuildContext context) {
        return ElevatedButton(
          onPressed: () {
            // ScaffoldMessenger.of(context) would work here because
            // Builder provides a new context below the Scaffold (if likely present in parent).
            // But we'll just show a simple UI change for visual consistency
            // without relying on Scaffold ancestors being strictly guaranteed in preview if isolated.
            // However, Builder is often used to get a context with a specific ancestor.
            // Here we just demo it building a widget.
          },
          child: Text(
            'Context ID: \${context.hashCode}', // Simple demo that we have a context
          ),
        );
      },
    ),
    codeSnippet: '''
Builder(
  builder: (BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Use 'context' here which is the child of the Builder
      },
      child: Text('Context ID: \\\${context.hashCode}'),
    );
  },
)
''',
  ),
  WidgetInfo(
    name: 'PreferredSize',
    description:
        'A widget with a preferred size that it reports to its parent.',
    category: WidgetCategory.utility,
    builder: (context) => PreferredSize(
      preferredSize: const Size.fromHeight(50.0),
      child: Container(
        color: Colors.blue,
        child: const Center(
          child: Text(
            'Preferred Size: 50 height',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ),
    codeSnippet: '''
PreferredSize(
  preferredSize: const Size.fromHeight(50.0),
  child: Container(
    color: Colors.blue,
    child: const Center(child: Text('Preferred Size: 50 height')),
  ),
)
''',
  ),
  WidgetInfo(
    name: 'AnnotatedRegion',
    description: 'Annotates a region of the layer tree with a value.',
    category: WidgetCategory.utility,
    builder: (context) => AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Container(
        height: 100,
        color: Colors.grey[300],
        child: const Center(child: Text('Annotated Region (Status Bar)')),
      ),
    ),
    codeSnippet: '''
AnnotatedRegion<SystemUiOverlayStyle>(
  value: SystemUiOverlayStyle.dark,
  child: Container(
    height: 100,
    color: Colors.grey[300],
    child: const Center(child: Text('Annotated Region')),
  ),
)
''',
  ),
  WidgetInfo(
    name: 'ModalBarrier',
    description:
        'A widget that prevents the user from interacting with widgets behind itself.',
    category: WidgetCategory.utility,
    builder: (context) => const _ModalBarrierSample(),
    codeSnippet: '''
class _ModalBarrierSample extends StatefulWidget {
  const _ModalBarrierSample();

  @override
  State<_ModalBarrierSample> createState() => _ModalBarrierSampleState();
}

class _ModalBarrierSampleState extends State<_ModalBarrierSample> {
  bool _invisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          width: 200,
          child: Stack(
            alignment: Alignment.center,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('Button Behind')),
              if (_invisible)
                ModalBarrier(
                  color: Colors.black.withValues(alpha: 0.3),
                  dismissible: true,
                  onDismiss: () => setState(() => _invisible = false),
                ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () => setState(() => _invisible = true),
          child: const Text('Show Barrier'),
        ),
      ],
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'Overlay',
    description: 'A Stack of entries that can be managed independently.',
    category: WidgetCategory.utility,
    builder: (context) => const _OverlaySample(),
    codeSnippet: '''
class _OverlaySample extends StatelessWidget {
  const _OverlaySample();

  void _showOverlay(BuildContext context) {
    final overlay = Overlay.of(context);
    final entry = OverlayEntry(
      builder: (context) => Positioned(
        top: 100,
        left: 50,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(10),
            color: Colors.red,
            child: const Text('Overlay Entry', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
    overlay.insert(entry);
    Future.delayed(const Duration(seconds: 2), () => entry.remove());
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _showOverlay(context),
      child: const Text('Show Overlay'),
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'ErrorWidget',
    description: 'A widget that renders an exception\'s message.',
    category: WidgetCategory.utility,
    builder: (context) => ErrorWidget('Custom Error View'),
    codeSnippet: '''
ErrorWidget('Custom Error View')
''',
  ),
  WidgetInfo(
    name: 'RepaintBoundary',
    description:
        'A widget that creates a separate display list for its child, which can improve performance.',
    category: WidgetCategory.utility,
    builder: (context) => RepaintBoundary(
      child: Container(
        width: 100,
        height: 100,
        color: Colors.blue,
        child: const Center(
          child: Text('Repaint Boundary', style: TextStyle(color: Colors.white)),
        ),
      ),
    ),
    codeSnippet: '''
RepaintBoundary(
  child: Container(
    width: 100,
    height: 100,
    color: Colors.blue,
    child: const Center(
      child: Text(
        'Repaint Boundary',
        style: TextStyle(color: Colors.white),
      ),
    ),
  ),
)
''',
  ),
  WidgetInfo(
    name: 'StatefulBuilder',
    description:
        'A widget that has a mutable state that can be updated via a builder callback.',
    category: WidgetCategory.utility,
    builder: (context) => const _StatefulBuilderSample(),
    codeSnippet: '''
class _StatefulBuilderSample extends StatelessWidget {
  const _StatefulBuilderSample();

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return ElevatedButton(
          onPressed: () {
            // This setState is from the StatefulBuilder, not a parent State
            // It only rebuilds the widgets returned by this builder.
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('StatefulBuilder pressed!')),
            );
          },
          child: const Text('Press Me (StatefulBuilder)'),
        );
      },
    );
  }
}
''',
  ),
];

class _VisibilitySample extends StatefulWidget {
  const _VisibilitySample();

  @override
  State<_VisibilitySample> createState() => _VisibilitySampleState();
}

class _VisibilitySampleState extends State<_VisibilitySample> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              _isVisible = !_isVisible;
            });
          },
          child: Text(_isVisible ? 'Hide' : 'Show'),
        ),
        const SizedBox(height: 20),
        Visibility(
          visible: _isVisible,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.green,
            alignment: Alignment.center,
            child: const Text(
              'Visible!',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class _ModalBarrierSample extends StatefulWidget {
  const _ModalBarrierSample();

  @override
  State<_ModalBarrierSample> createState() => _ModalBarrierSampleState();
}

class _ModalBarrierSampleState extends State<_ModalBarrierSample> {
  bool _invisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          width: 200,
          child: Stack(
            alignment: Alignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Button Behind'),
              ),
              if (_invisible)
                ModalBarrier(
                  color: Colors.black.withValues(alpha: 0.3),
                  dismissible: true,
                  onDismiss: () => setState(() => _invisible = false),
                ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () => setState(() => _invisible = true),
          child: const Text('Show Barrier'),
        ),
      ],
    );
  }
}

class _OverlaySample extends StatelessWidget {
  const _OverlaySample();

  void _showOverlay(BuildContext context) {
    final overlay = Overlay.of(context);
    final entry = OverlayEntry(
      builder: (context) => Positioned(
        top: 100,
        left: 50,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(10),
            color: Colors.red,
            child: const Text(
              'Overlay Entry',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
    overlay.insert(entry);
    Future.delayed(const Duration(seconds: 2), () => entry.remove());
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _showOverlay(context),
      child: const Text('Show Overlay'),
    );
  }
}

class _StatefulBuilderSample extends StatelessWidget {
  const _StatefulBuilderSample();

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('StatefulBuilder pressed!')),
            );
          },
          child: const Text('Press Me (StatefulBuilder)'),
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// AUDIT BATCH 5 – Utility Widgets (Extra)
// ─────────────────────────────────────────────────────────────────────────────

final List<WidgetInfo> utilityWidgetsExtra = [
  WidgetInfo(
    name: 'AssetBundle',
    description: 'A collection of resources used by the application.',
    category: WidgetCategory.utility,
    builder: (context) => const _AssetBundleSample(),
    codeSnippet: '''
DefaultAssetBundle.of(context).loadString('assets/config.json');
''',
  ),
  WidgetInfo(
    name: 'Scrollable',
    description: 'A low-level widget that implement the interaction model for a scrollable widget.',
    category: WidgetCategory.utility,
    builder: (context) => const _ScrollableSample(),
    codeSnippet: '''
Scrollable(
  viewportBuilder: (context, position) {
    return Viewport(
      offset: position,
      slivers: [
        SliverFillRemaining(child: Center(child: Text('Content'))),
      ],
    );
  },
)
''',
  ),
];

class _AssetBundleSample extends StatelessWidget {
  const _AssetBundleSample();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.inventory_2, size: 50, color: Colors.blue),
          const SizedBox(height: 16),
          const Text(
            'AssetBundle',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Assets are accessible via DefaultAssetBundle. This provides a way to '
              'load strings, images, and other resources from the app bundle.',
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              // In a real app, you would load a file like this:
              // String data = await DefaultAssetBundle.of(context).loadString('assets/data.json');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('AssetBundle interaction demonstrated.')),
              );
            },
            child: const Text('Simulate Load'),
          ),
        ],
      ),
    );
  }
}

class _ScrollableSample extends StatefulWidget {
  const _ScrollableSample();

  @override
  State<_ScrollableSample> createState() => _ScrollableSampleState();
}

class _ScrollableSampleState extends State<_ScrollableSample> {
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          Text('Offset: \${_controller.hasClients ? _controller.offset.round() : 0}'),
          Expanded(
            child: Scrollable(
              controller: _controller,
              axisDirection: AxisDirection.down,
              viewportBuilder: (context, position) {
                return Viewport(
                  offset: position,
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return ListTile(
                            title: Text('Low-level Scrollable Item \$index'),
                          );
                        },
                        childCount: 50,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
