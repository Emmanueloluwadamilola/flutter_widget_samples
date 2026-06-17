import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/widget_info.dart';

final List<WidgetInfo> accessibilityWidgets = [
  WidgetInfo(
    name: 'Semantics',
    description:
        'A widget that annotates the widget tree with a description of the meaning of the widgets.',
    category: WidgetCategory.accessibility,
    builder: (context) => Semantics(
      label: 'A blue square',
      hint: 'Tap to interact',
      button: true,
      enabled: true,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: 100,
          height: 100,
          color: Colors.blue,
          child: const Center(
            child: Icon(Icons.accessibility, color: Colors.white, size: 40),
          ),
        ),
      ),
    ),
    codeSnippet: '''
Semantics(
  label: 'A blue square',
  hint: 'Tap to interact',
  button: true,
  enabled: true,
  child: GestureDetector(
    onTap: () {},
    child: Container(
      width: 100,
      height: 100,
      color: Colors.blue,
      child: const Center(
        child: Icon(Icons.accessibility, color: Colors.white, size: 40),
      ),
    ),
  ),
)
''',
  ),
  WidgetInfo(
    name: 'MergeSemantics',
    description: 'A widget that merges the semantics of its descendants.',
    category: WidgetCategory.accessibility,
    builder: (context) => MergeSemantics(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Semantics(
            label: 'Star icon',
            child: const Icon(Icons.star, color: Colors.amber),
          ),
          const SizedBox(width: 8),
          Semantics(
            label: 'Rating 4.5',
            child: const Text('4.5', style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    ),
    codeSnippet: '''
MergeSemantics(
  child: Row(
    children: [
      Semantics(
        label: 'Star icon',
        child: const Icon(Icons.star, color: Colors.amber),
      ),
      const SizedBox(width: 8),
      Semantics(
        label: 'Rating 4.5',
        child: const Text('4.5'),
      ),
    ],
  ),
)
''',
  ),
  WidgetInfo(
    name: 'ExcludeSemantics',
    description: 'A widget that drops all the semantics of its descendants.',
    category: WidgetCategory.accessibility,
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('This text is accessible'),
        const SizedBox(height: 10),
        ExcludeSemantics(
          child: Container(
            padding: const EdgeInsets.all(8),
            color: Colors.grey[300],
            child: const Text('This text is hidden from screen readers'),
          ),
        ),
      ],
    ),
    codeSnippet: '''
Column(
  children: [
    const Text('This text is accessible'),
    ExcludeSemantics(
      child: Container(
        padding: const EdgeInsets.all(8),
        color: Colors.grey[300],
        child: const Text('This text is hidden from screen readers'),
      ),
    ),
  ],
)
''',
  ),
  WidgetInfo(
    name: 'BlockSemantics',
    description:
        'A widget that blocks semantics from its descendants from being merged with semantics from ancestors.',
    category: WidgetCategory.accessibility,
    builder: (context) => MergeSemantics(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Merged with parent'),
          BlockSemantics(
            child: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(top: 8),
              color: Colors.blue[100],
              child: const Text('Blocked from merging'),
            ),
          ),
        ],
      ),
    ),
    codeSnippet: '''
MergeSemantics(
  child: Column(
    children: [
      const Text('Merged with parent'),
      BlockSemantics(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Blocked from merging'),
        ),
      ),
    ],
  ),
)
''',
  ),
  WidgetInfo(
    name: 'SemanticsDebugger',
    description: 'A widget that visualizes the semantics tree for debugging.',
    category: WidgetCategory.accessibility,
    builder: (context) => const _SemanticsDebuggerSample(),
    codeSnippet: '''
class _SemanticsDebuggerSample extends StatefulWidget {
  const _SemanticsDebuggerSample();

  @override
  State<_SemanticsDebuggerSample> createState() => _SemanticsDebuggerSampleState();
}

class _SemanticsDebuggerSampleState extends State<_SemanticsDebuggerSample> {
  bool _showSemantics = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              _showSemantics = !_showSemantics;
            });
          },
          child: Text(_showSemantics ? 'Hide Semantics' : 'Show Semantics'),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 150,
          child: _showSemantics
              ? SemanticsDebugger(
                  child: _buildContent(),
                )
              : _buildContent(),
        ),
      ],
    );
  }

  Widget _buildContent() {
    return const Column(
      children: [
        Text('Hello World'),
        Icon(Icons.accessibility),
        ElevatedButton(onPressed: null, child: Text('Button')),
      ],
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'Focus',
    description:
        'A widget that manages a FocusNode to allow keyboard focus for this widget and its descendants.',
    category: WidgetCategory.accessibility,
    builder: (context) => const _FocusSample(),
    codeSnippet: '''
class _FocusSample extends StatefulWidget {
  const _FocusSample();

  @override
  State<_FocusSample> createState() => _FocusSampleState();
}

class _FocusSampleState extends State<_FocusSample> {
  Color _color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() {
          _color = hasFocus ? Colors.blue.shade100 : Colors.white;
        });
      },
      child: Builder(
        builder: (BuildContext context) {
          final bool hasFocus = Focus.of(context).hasFocus;
          return Container(
            width: 200,
            height: 100,
            color: _color,
            alignment: Alignment.center,
            child: Text(hasFocus ? 'I have focus!' : 'Click to focus me'),
          );
        },
      ),
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'FocusScope',
    description:
        'A widget that manages a FocusScopeNode to allow grouping of focusable widgets.',
    category: WidgetCategory.accessibility,
    builder: (context) => const _FocusScopeSample(),
    codeSnippet: '''
class _FocusScopeSample extends StatelessWidget {
  const _FocusScopeSample();

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      child: Column(
        children: [
          const TextField(decoration: InputDecoration(hintText: 'Field 1')),
          const SizedBox(height: 10),
          const TextField(decoration: InputDecoration(hintText: 'Field 2')),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              FocusScope.of(context).nextFocus();
            },
            child: const Text('Next Focus'),
          ),
        ],
      ),
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'Shortcuts & Actions',
    description: 'Widgets for defining keyboard shortcuts and actions.',
    category: WidgetCategory.accessibility,
    builder: (context) => const _ShortcutsActionsSample(),
    codeSnippet: '''
class _ShortcutsActionsSample extends StatefulWidget {
  const _ShortcutsActionsSample();

  @override
  State<_ShortcutsActionsSample> createState() => _ShortcutsActionsSampleState();
}

class IncrementIntent extends Intent {
  const IncrementIntent();
}

class _ShortcutsActionsSampleState extends State<_ShortcutsActionsSample> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <ShortcutActivator, Intent>{
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyI):
            const IncrementIntent(),
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          IncrementIntent: CallbackAction<IncrementIntent>(
            onInvoke: (IncrementIntent intent) {
              setState(() {
                _counter++;
              });
              return null;
            },
          ),
        },
        child: Focus(
          autofocus: true,
          child: Column(
            children: [
              Text('Counter: \$_counter'),
              const Text('Press Ctrl+I to increment'),
            ],
          ),
        ),
      ),
    );
  }
}
''',
  ),
];

class _SemanticsDebuggerSample extends StatefulWidget {
  const _SemanticsDebuggerSample();

  @override
  State<_SemanticsDebuggerSample> createState() =>
      _SemanticsDebuggerSampleState();
}

class _SemanticsDebuggerSampleState extends State<_SemanticsDebuggerSample> {
  bool _showSemantics = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              _showSemantics = !_showSemantics;
            });
          },
          child: Text(_showSemantics ? 'Hide Semantics' : 'Show Semantics'),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 150,
          child: _showSemantics
              ? SemanticsDebugger(child: _buildContent())
              : _buildContent(),
        ),
      ],
    );
  }

  Widget _buildContent() {
    return const Column(
      children: [
        Text('Hello World'),
        Icon(Icons.accessibility),
        ElevatedButton(onPressed: null, child: Text('Button')),
      ],
    );
  }
}

class _FocusSample extends StatefulWidget {
  const _FocusSample();

  @override
  State<_FocusSample> createState() => _FocusSampleState();
}

class _FocusSampleState extends State<_FocusSample> {
  Color _color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() {
          _color = hasFocus ? Colors.blue.shade100 : Colors.white;
        });
      },
      child: Builder(
        builder: (BuildContext context) {
          final bool hasFocus = Focus.of(context).hasFocus;
          return Container(
            width: 200,
            height: 100,
            color: _color,
            alignment: Alignment.center,
            child: Text(hasFocus ? 'I have focus!' : 'Click to focus me'),
          );
        },
      ),
    );
  }
}

class _FocusScopeSample extends StatelessWidget {
  const _FocusScopeSample();

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      child: Column(
        children: [
          const TextField(decoration: InputDecoration(hintText: 'Field 1')),
          const SizedBox(height: 10),
          const TextField(decoration: InputDecoration(hintText: 'Field 2')),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              FocusScope.of(context).nextFocus();
            },
            child: const Text('Next Focus'),
          ),
        ],
      ),
    );
  }
}

class _ShortcutsActionsSample extends StatefulWidget {
  const _ShortcutsActionsSample();

  @override
  State<_ShortcutsActionsSample> createState() =>
      _ShortcutsActionsSampleState();
}

class _IncrementIntent extends Intent {
  const _IncrementIntent();
}

class _ShortcutsActionsSampleState extends State<_ShortcutsActionsSample> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <ShortcutActivator, Intent>{
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyI):
            const _IncrementIntent(),
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          _IncrementIntent: CallbackAction<_IncrementIntent>(
            onInvoke: (_IncrementIntent intent) {
              setState(() {
                _counter++;
              });
              return null;
            },
          ),
        },
        child: Focus(
          autofocus: true,
          child: Column(
            children: [
              Text('Counter: $_counter'),
              const Text('Press Ctrl+I to increment'),
            ],
          ),
        ),
      ),
    );
  }
}
