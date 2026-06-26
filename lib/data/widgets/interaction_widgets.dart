import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/widget_info.dart';

final List<WidgetInfo> interactionWidgets = [
  WidgetInfo(
    name: 'GestureDetector',
    description: 'A widget that detects gestures.',
    category: WidgetCategory.interaction,
    builder: (context) => GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Tapped!'),
            duration: Duration(milliseconds: 500),
          ),
        );
      },
      child: Container(
        width: 100,
        height: 100,
        color: Colors.blue,
        alignment: Alignment.center,
        child: const Text('Tap Me', style: TextStyle(color: Colors.white)),
      ),
    ),
    codeSnippet: '''
GestureDetector(
  onTap: () {
    print('Tapped!');
  },
  child: Container(
    width: 100,
    height: 100,
    color: Colors.blue,
    alignment: Alignment.center,
    child: const Text('Tap Me'),
  ),
)
''',
  ),
  WidgetInfo(
    name: 'InkWell',
    description: 'A rectangular area of a Material that responds to touch.',
    category: WidgetCategory.interaction,
    builder: (context) => Material(
      color: Colors.amber,
      child: InkWell(
        onTap: () {},
        child: const SizedBox(
          width: 100,
          height: 100,
          child: Center(child: Text('Ripple')),
        ),
      ),
    ),
    codeSnippet: '''
Material(
  color: Colors.amber,
  child: InkWell(
    onTap: () {},
    child: const SizedBox(
      width: 100,
      height: 100,
      child: Center(child: Text('Ripple')),
    ),
  ),
)
''',
  ),
  WidgetInfo(
    name: 'AbsorbPointer',
    description: 'A widget that absorbs pointers during hit testing.',
    category: WidgetCategory.interaction,
    builder: (context) => Column(
      children: [
        const Text('Button below is disabled via AbsorbPointer'),
        const SizedBox(height: 10),
        AbsorbPointer(
          absorbing: true,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Can\'t Click Me'),
          ),
        ),
      ],
    ),
    codeSnippet: '''
AbsorbPointer(
  absorbing: true,
  child: ElevatedButton(onPressed: () {}, child: const Text("Can't Click Me")),
)
''',
  ),
  WidgetInfo(
    name: 'InteractiveViewer',
    description:
        'A widget that enables pan and zoom interactions with its child.',
    category: WidgetCategory.interaction,
    builder: (context) => Container(
      height: 300,
      color: Colors.grey.shade200,
      child: InteractiveViewer(
        boundaryMargin: const EdgeInsets.all(20.0),
        minScale: 0.1,
        maxScale: 1.6,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Colors.orange, Colors.red],
              stops: <double>[0.0, 1.0],
            ),
          ),
          child: const Center(
            child: Text(
              'Pinch to Zoom & Pan',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    ),
    codeSnippet: '''
InteractiveViewer(
  boundaryMargin: const EdgeInsets.all(20.0),
  minScale: 0.1,
  maxScale: 1.6,
  child: Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[Colors.orange, Colors.red],
        stops: <double>[0.0, 1.0],
      ),
    ),
    child: const Center(child: Text('Pinch to Zoom & Pan')),
  ),
)
''',
  ),
  WidgetInfo(
    name: 'IgnorePointer',
    description: 'A widget that is invisible during hit testing.',
    category: WidgetCategory.interaction,
    builder: (context) => const _IgnorePointerSample(),
    codeSnippet: '''
class _IgnorePointerSample extends StatefulWidget {
  const _IgnorePointerSample();

  @override
  State<_IgnorePointerSample> createState() => _IgnorePointerSampleState();
}

class _IgnorePointerSampleState extends State<_IgnorePointerSample> {
  bool _ignoring = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              _ignoring = !_ignoring;
            });
          },
          child: Text(_ignoring ? 'Enable Interaction' : 'Disable Interaction'),
        ),
        const SizedBox(height: 20),
        IgnorePointer(
          ignoring: _ignoring,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Click Me!'),
          ),
        ),
      ],
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'Draggable',
    description: 'A widget that can be dragged from to a DragTarget.',
    category: WidgetCategory.interaction,
    builder: (context) => const _DraggableSample(),
    codeSnippet: '''
class _DraggableSample extends StatefulWidget {
  const _DraggableSample();

  @override
  State<_DraggableSample> createState() => _DraggableSampleState();
}

class _DraggableSampleState extends State<_DraggableSample> {
  int acceptedData = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Draggable<int>(
          // Data is the value this Draggable stores.
          data: 10,
          feedback: Container(
            color: Colors.deepOrange,
            height: 100,
            width: 100,
            child: const Icon(Icons.directions_run),
          ),
          childWhenDragging: Container(
            height: 100.0,
            width: 100.0,
            color: Colors.pinkAccent,
            child: const Center(
              child: Text('Child When Dragging'),
            ),
          ),
          child: Container(
            height: 100.0,
            width: 100.0,
            color: Colors.lightGreenAccent,
            child: const Center(
              child: Text('Draggable'),
            ),
          ),
        ),
        DragTarget<int>(
          builder: (
            BuildContext context,
            List<dynamic> accepted,
            List<dynamic> rejected,
          ) {
            return Container(
              height: 100.0,
              width: 100.0,
              color: Colors.cyan,
              child: Center(
                child: Text('Value is updated to: \$acceptedData'),
              ),
            );
          },
          onAcceptWithDetails: (DragTargetDetails<int> details) {
            setState(() {
              acceptedData += details.data;
            });
          },
        ),
      ],
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'Dismissible',
    description:
        'A widget that can be dismissed by dragging in the indicated direction.',
    category: WidgetCategory.interaction,
    builder: (context) => const _DismissibleSample(),
    codeSnippet: '''
class _DismissibleSample extends StatefulWidget {
  const _DismissibleSample();

  @override
  State<_DismissibleSample> createState() => _DismissibleSampleState();
}

class _DismissibleSampleState extends State<_DismissibleSample> {
  List<int> items = List<int>.generate(100, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: items.length,
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            background: Container(
              color: Colors.green,
            ),
            key: ValueKey<int>(items[index]),
            onDismissed: (DismissDirection direction) {
              setState(() {
                items.removeAt(index);
              });
            },
            child: ListTile(
              title: Text(
                'Item \${items[index]}',
              ),
            ),
          );
        },
      ),
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'LongPressDraggable',
    description: 'Makes its child draggable starting from long press.',
    category: WidgetCategory.interaction,
    builder: (context) => LongPressDraggable<int>(
      data: 1,
      feedback: Container(
        width: 100,
        height: 100,
        color: Colors.purple.withValues(alpha: 0.5),
        child: const Center(
          child: Text(
            'Dragging...',
            style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
              fontSize: 14,
            ),
          ),
        ),
      ),
      child: Container(
        width: 100,
        height: 100,
        color: Colors.purple,
        child: const Center(
          child: Text(
            'Long Press\nto Drag',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ),
    codeSnippet: '''
LongPressDraggable<int>(
  data: 1,
  feedback: Container(
    width: 100,
    height: 100,
    color: Colors.purple.withValues(alpha: 0.5),
    child: const Center(child: Text('Dragging...')),
  ),
  child: Container(
    width: 100,
    height: 100,
    color: Colors.purple,
    child: const Center(
      child: Text('Long Press\\nto Drag', textAlign: TextAlign.center),
    ),
  ),
)
''',
  ),
  WidgetInfo(
    name: 'MouseRegion',
    description: 'A widget that tracks the movement of mice.',
    category: WidgetCategory.interaction,
    builder: (context) => const _MouseRegionSample(),
    codeSnippet: '''
class _MouseRegionSample extends StatefulWidget {
  const _MouseRegionSample();

  @override
  State<_MouseRegionSample> createState() => _MouseRegionSampleState();
}

class _MouseRegionSampleState extends State<_MouseRegionSample> {
  int _enterCounter = 0;
  int _exitCounter = 0;
  double x = 0.0;
  double y = 0.0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (PointerEnterEvent event) {
        setState(() {
          _enterCounter++;
        });
      },
      onExit: (PointerExitEvent event) {
        setState(() {
          _exitCounter++;
        });
      },
      onHover: (PointerHoverEvent event) {
        setState(() {
          x = event.position.dx;
          y = event.position.dy;
        });
      },
      child: Container(
        width: 200,
        height: 200,
        color: Colors.blueAccent,
        alignment: Alignment.center,
        child: Text(
          'Enter: \$_enterCounter\\nExit: \$_exitCounter\\nHover: (\${x.toStringAsFixed(2)}, \${y.toStringAsFixed(2)})',
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'Listener',
    description:
        'A widget that calls callbacks in response to common pointer events.',
    category: WidgetCategory.interaction,
    builder: (context) => const _ListenerSample(),
    codeSnippet: '''
class _ListenerSample extends StatefulWidget {
  const _ListenerSample();

  @override
  State<_ListenerSample> createState() => _ListenerSampleState();
}

class _ListenerSampleState extends State<_ListenerSample> {
  int _downCounter = 0;
  int _upCounter = 0;
  double x = 0.0;
  double y = 0.0;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (PointerDownEvent event) {
        setState(() {
          _downCounter++;
        });
      },
      onPointerMove: (PointerMoveEvent event) {
        setState(() {
          x = event.position.dx;
          y = event.position.dy;
        });
      },
      onPointerUp: (PointerUpEvent event) {
        setState(() {
          _upCounter++;
        });
      },
      child: Container(
        width: 200,
        height: 200,
        color: Colors.orange,
        alignment: Alignment.center,
        child: Text(
          'Down: \$_downCounter\\nUp: \$_upCounter\\nMove: (\${x.toStringAsFixed(2)}, \${y.toStringAsFixed(2)})',
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'PopScope',
    description: 'Manages system back gestures.',
    category: WidgetCategory.interaction,
    builder: (context) => const _PopScopeSample(),
    codeSnippet: '''
class _PopScopeSample extends StatefulWidget {
  const _PopScopeSample();

  @override
  State<_PopScopeSample> createState() => _PopScopeSampleState();
}

class _PopScopeSampleState extends State<_PopScopeSample> {
  bool _canPop = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('PopScope Sample'),
                    const SizedBox(height: 20),
                    PopScope(
                      canPop: _canPop,
                      onPopInvokedWithResult: (bool didPop, dynamic result) {
                        if (didPop) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Pop blocked! Check the box to allow pop.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).maybePop();
                        },
                        child: const Text('Try to Pop'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: _canPop,
                          onChanged: (value) {
                            setState(() {
                              _canPop = value!;
                            });
                          },
                        ),
                        const Text('Allow Pop'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'TapRegion',
    description: 'A widget that defines a region for tap events.',
    category: WidgetCategory.interaction,
    builder: (context) => const _TapRegionSample(),
    codeSnippet: '''
class _TapRegionSample extends StatefulWidget {
  const _TapRegionSample();

  @override
  State<_TapRegionSample> createState() => _TapRegionSampleState();
}

class _TapRegionSampleState extends State<_TapRegionSample> {
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return TapRegion(
      onTapInside: (PointerDownEvent event) {
        setState(() {
          _color = Colors.green;
        });
      },
      onTapOutside: (PointerDownEvent event) {
        setState(() {
          _color = Colors.red;
        });
      },
      child: Container(
        width: 100,
        height: 100,
        color: _color,
        child: const Center(
          child: Text(
            'Tap Inside/Outside',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ),
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'Shortcuts',
    description:
        'A widget that establishes a mapping between keyboard shortcuts and intents.',
    category: WidgetCategory.interaction,
    builder: (context) => const _ShortcutsActionsSample(),
    codeSnippet: '''
class _ShortcutsActionsSample extends StatefulWidget {
  const _ShortcutsActionsSample();

  @override
  State<_ShortcutsActionsSample> createState() =>
      _ShortcutsActionsSampleState();
}

class IncrementIntent extends Intent {
  const IncrementIntent();
}

class _ShortcutsActionsSampleState extends State<_ShortcutsActionsSample> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.arrowUp): const IncrementIntent(),
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          IncrementIntent: CallbackAction<IncrementIntent>(
            onInvoke: (IncrementIntent intent) {
              setState(() {
                _count++;
              });
              return null;
            },
          ),
        },
        child: Focus(
          autofocus: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Press arrow up to increment'),
              Text('Count: \$_count'),
            ],
          ),
        ),
      ),
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'Actions',
    description:
        'A widget that establishes a mapping between Intents and Actions.',
    category: WidgetCategory.interaction,
    builder: (context) => const _ShortcutsActionsSample(),
    codeSnippet: '''
// (See Shortcuts sample for full implementation)
Actions(
  actions: <Type, Action<Intent>>{
    IncrementIntent: CallbackAction<IncrementIntent>(
      onInvoke: (IncrementIntent intent) {
        setState(() {
          _count++;
        });
        return null;
      },
    ),
  },
  child: const SizedBox(),
)
''',
  ),
  WidgetInfo(
    name: 'FocusTraversalGroup',
    description:
        'A widget that groups various Focus widgets together for traversal purposes.',
    category: WidgetCategory.interaction,
    builder: (context) => const _FocusTraversalGroupSample(),
    codeSnippet: '''
class _FocusTraversalGroupSample extends StatelessWidget {
  const _FocusTraversalGroupSample();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FocusTraversalGroup(
          policy: OrderedTraversalPolicy(),
          child: Column(
            children: [
              const Text('Ordered Traversal:'),
              FocusTraversalOrder(
                order: const NumericFocusOrder(2.0),
                child: const TextField(
                    decoration: InputDecoration(labelText: 'Order 2')),
              ),
              FocusTraversalOrder(
                order: const NumericFocusOrder(1.0),
                child: const TextField(
                    decoration: InputDecoration(labelText: 'Order 1')),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'KeyboardListener',
    description:
        'A widget that calls a callback whenever the user presses or releases a key.',
    category: WidgetCategory.interaction,
    builder: (context) => const _KeyboardListenerSample(),
    codeSnippet: '''
class _KeyboardListenerSample extends StatefulWidget {
  const _KeyboardListenerSample();

  @override
  State<_KeyboardListenerSample> createState() => _KeyboardListenerSampleState();
}

class _KeyboardListenerSampleState extends State<_KeyboardListenerSample> {
  String _lastEvent = 'None';
  // A FocusNode attaches to a single widget, so use one each.
  final FocusNode _listenerFocusNode = FocusNode();
  final FocusNode _fieldFocusNode = FocusNode();

  @override
  void dispose() {
    _listenerFocusNode.dispose();
    _fieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: _listenerFocusNode,
      onKeyEvent: (KeyEvent event) {
        setState(() {
          _lastEvent = '\${event.runtimeType}\\nLogical: \${event.logicalKey.keyLabel}';
        });
      },
      child: Column(
        children: [
          const Text('Focus the field below and press keys:'),
          TextField(focusNode: _fieldFocusNode),
          const SizedBox(height: 10),
          Text('Last Event: \$_lastEvent'),
        ],
      ),
    );
  }
}
''',
  ),
];

class _DraggableSample extends StatefulWidget {
  const _DraggableSample();

  @override
  State<_DraggableSample> createState() => _DraggableSampleState();
}

class _DraggableSampleState extends State<_DraggableSample> {
  int acceptedData = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Draggable<int>(
          // Data is the value this Draggable stores.
          data: 10,
          feedback: Container(
            color: Colors.deepOrange,
            height: 100,
            width: 100,
            child: const Icon(Icons.directions_run),
          ),
          childWhenDragging: Container(
            height: 100.0,
            width: 100.0,
            color: Colors.pinkAccent,
            child: const Center(child: Text('Child When Dragging')),
          ),
          child: Container(
            height: 100.0,
            width: 100.0,
            color: Colors.lightGreenAccent,
            child: const Center(child: Text('Draggable')),
          ),
        ),
        DragTarget<int>(
          builder:
              (
                BuildContext context,
                List<dynamic> accepted,
                List<dynamic> rejected,
              ) {
                return Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.cyan,
                  child: Center(
                    child: Text('Value is updated to: $acceptedData'),
                  ),
                );
              },
          onAcceptWithDetails: (DragTargetDetails<int> details) {
            setState(() {
              acceptedData += details.data;
            });
          },
        ),
      ],
    );
  }
}

class _DismissibleSample extends StatefulWidget {
  const _DismissibleSample();

  @override
  State<_DismissibleSample> createState() => _DismissibleSampleState();
}

class _DismissibleSampleState extends State<_DismissibleSample> {
  List<int> items = List<int>.generate(100, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: items.length,
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            background: Container(color: Colors.green),
            key: ValueKey<int>(items[index]),
            onDismissed: (DismissDirection direction) {
              setState(() {
                items.removeAt(index);
              });
            },
            child: ListTile(title: Text('Item ${items[index]}')),
          );
        },
      ),
    );
  }
}

class _AbsorbPointerSample extends StatefulWidget {
  const _AbsorbPointerSample();

  @override
  State<_AbsorbPointerSample> createState() => _AbsorbPointerSampleState();
}

class _AbsorbPointerSampleState extends State<_AbsorbPointerSample> {
  bool _absorbing = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            setState(() {
              _absorbing = !_absorbing;
            });
          },
          child: Text(
            _absorbing ? 'Enable Interaction' : 'Disable Interaction',
          ),
        ),
        const SizedBox(height: 20),
        AbsorbPointer(
          absorbing: _absorbing,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Can you click me?'),
          ),
        ),
      ],
    );
  }
}

class _GestureDetectorSample extends StatefulWidget {
  const _GestureDetectorSample();

  @override
  State<_GestureDetectorSample> createState() => _GestureDetectorSampleState();
}

class _GestureDetectorSampleState extends State<_GestureDetectorSample> {
  String _lastGesture = 'None';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _lastGesture = 'Tap';
        });
      },
      onDoubleTap: () {
        setState(() {
          _lastGesture = 'Double Tap';
        });
      },
      onLongPress: () {
        setState(() {
          _lastGesture = 'Long Press';
        });
      },
      onPanUpdate: (details) {
        setState(() {
          _lastGesture = 'Pan Update';
        });
      },
      child: Container(
        color: Colors.blue.shade100,
        height: 200,
        width: 200,
        alignment: Alignment.center,
        child: Text('Gesture: $_lastGesture'),
      ),
    );
  }
}

class _InkWellSample extends StatefulWidget {
  const _InkWellSample();

  @override
  State<_InkWellSample> createState() => _InkWellSampleState();
}

class _InkWellSampleState extends State<_InkWellSample> {
  int _taps = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.amber,
      child: InkWell(
        onTap: () {
          setState(() {
            _taps += 1;
          });
        },
        child: Container(
          width: 200,
          height: 200,
          alignment: Alignment.center,
          child: Text('Taps: $_taps'),
        ),
      ),
    );
  }
}

class _IgnorePointerSample extends StatefulWidget {
  const _IgnorePointerSample();

  @override
  State<_IgnorePointerSample> createState() => _IgnorePointerSampleState();
}

class _IgnorePointerSampleState extends State<_IgnorePointerSample> {
  bool _ignoring = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              _ignoring = !_ignoring;
            });
          },
          child: Text(_ignoring ? 'Enable Interaction' : 'Disable Interaction'),
        ),
        const SizedBox(height: 20),
        IgnorePointer(
          ignoring: _ignoring,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Click Me!'),
          ),
        ),
      ],
    );
  }
}

class _MouseRegionSample extends StatefulWidget {
  const _MouseRegionSample();

  @override
  State<_MouseRegionSample> createState() => _MouseRegionSampleState();
}

class _MouseRegionSampleState extends State<_MouseRegionSample> {
  int _enterCounter = 0;
  int _exitCounter = 0;
  double x = 0.0;
  double y = 0.0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (PointerEnterEvent event) {
        setState(() {
          _enterCounter++;
        });
      },
      onExit: (PointerExitEvent event) {
        setState(() {
          _exitCounter++;
        });
      },
      onHover: (PointerHoverEvent event) {
        setState(() {
          x = event.position.dx;
          y = event.position.dy;
        });
      },
      child: Container(
        width: 200,
        height: 200,
        color: Colors.blueAccent,
        alignment: Alignment.center,
        child: Text(
          'Enter: $_enterCounter\nExit: $_exitCounter\nHover: (${x.toStringAsFixed(2)}, ${y.toStringAsFixed(2)})',
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class _ListenerSample extends StatefulWidget {
  const _ListenerSample();

  @override
  State<_ListenerSample> createState() => _ListenerSampleState();
}

class _ListenerSampleState extends State<_ListenerSample> {
  int _downCounter = 0;
  int _upCounter = 0;
  double x = 0.0;
  double y = 0.0;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (PointerDownEvent event) {
        setState(() {
          _downCounter++;
        });
      },
      onPointerMove: (PointerMoveEvent event) {
        setState(() {
          x = event.position.dx;
          y = event.position.dy;
        });
      },
      onPointerUp: (PointerUpEvent event) {
        setState(() {
          _upCounter++;
        });
      },
      child: Container(
        width: 200,
        height: 200,
        color: Colors.orange,
        alignment: Alignment.center,
        child: Text(
          'Down: $_downCounter\nUp: $_upCounter\nMove: (${x.toStringAsFixed(2)}, ${y.toStringAsFixed(2)})',
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class _PopScopeSample extends StatefulWidget {
  const _PopScopeSample();

  @override
  State<_PopScopeSample> createState() => _PopScopeSampleState();
}

class _PopScopeSampleState extends State<_PopScopeSample> {
  bool _canPop = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('PopScope Sample'),
                    const SizedBox(height: 20),
                    PopScope(
                      canPop: _canPop,
                      onPopInvokedWithResult: (bool didPop, dynamic result) {
                        if (didPop) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Pop blocked! Check the box to allow pop.',
                            ),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).maybePop();
                        },
                        child: const Text('Try to Pop'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: _canPop,
                          onChanged: (value) {
                            setState(() {
                              _canPop = value!;
                            });
                          },
                        ),
                        const Text('Allow Pop'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _TapRegionSample extends StatefulWidget {
  const _TapRegionSample();

  @override
  State<_TapRegionSample> createState() => _TapRegionSampleState();
}

class _TapRegionSampleState extends State<_TapRegionSample> {
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return TapRegion(
      onTapInside: (PointerDownEvent event) {
        setState(() {
          _color = Colors.green;
        });
      },
      onTapOutside: (PointerDownEvent event) {
        setState(() {
          _color = Colors.red;
        });
      },
      child: Container(
        width: 100,
        height: 100,
        color: _color,
        child: const Center(
          child: Text(
            'Tap Inside/Outside',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
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

class IncrementIntent extends Intent {
  const IncrementIntent();
}

class _ShortcutsActionsSampleState extends State<_ShortcutsActionsSample> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.arrowUp): const IncrementIntent(),
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          IncrementIntent: CallbackAction<IncrementIntent>(
            onInvoke: (IncrementIntent intent) {
              setState(() {
                _count++;
              });
              return null;
            },
          ),
        },
        child: Focus(
          autofocus: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Press arrow up to increment (Focus needed)'),
              Text('Count: $_count'),
            ],
          ),
        ),
      ),
    );
  }
}

class _FocusTraversalGroupSample extends StatelessWidget {
  const _FocusTraversalGroupSample();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FocusTraversalGroup(
          policy: OrderedTraversalPolicy(),
          child: Column(
            children: [
              const Text('Ordered Traversal:'),
              FocusTraversalOrder(
                order: const NumericFocusOrder(2.0),
                child: const TextField(
                  decoration: InputDecoration(labelText: 'Order 2'),
                ),
              ),
              FocusTraversalOrder(
                order: const NumericFocusOrder(1.0),
                child: const TextField(
                  decoration: InputDecoration(labelText: 'Order 1'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _KeyboardListenerSample extends StatefulWidget {
  const _KeyboardListenerSample();

  @override
  State<_KeyboardListenerSample> createState() =>
      _KeyboardListenerSampleState();
}

class _KeyboardListenerSampleState extends State<_KeyboardListenerSample> {
  String _lastEvent = 'None';
  // A FocusNode can only be attached to one widget at a time, so the
  // KeyboardListener and the TextField each need their own.
  final FocusNode _listenerFocusNode = FocusNode();
  final FocusNode _fieldFocusNode = FocusNode();

  @override
  void dispose() {
    _listenerFocusNode.dispose();
    _fieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: _listenerFocusNode,
      onKeyEvent: (KeyEvent event) {
        setState(() {
          _lastEvent =
              '${event.runtimeType}\nLogical: ${event.logicalKey.keyLabel}';
        });
      },
      child: Column(
        children: [
          const Text('Focus the field below and press keys:'),
          TextField(focusNode: _fieldFocusNode),
          const SizedBox(height: 10),
          Text('Last Event: $_lastEvent'),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// AUDIT BATCH 5 – Interaction Widgets (Extra)
// ─────────────────────────────────────────────────────────────────────────────

final List<WidgetInfo> interactionWidgetsExtra = [
  WidgetInfo(
    name: 'DragTarget',
    description:
        'A widget that receives data when a Draggable widget is dropped onto it.',
    category: WidgetCategory.interaction,
    builder: (context) => const _DragTargetSample(),
    codeSnippet: '''
DragTarget<int>(
  builder: (context, candidateData, rejectedData) {
    return Container(
      color: candidateData.isNotEmpty ? Colors.green : Colors.grey,
      child: Text('Drop here'),
    );
  },
  onAcceptWithDetails: (details) {
    // Handle accepted data
  },
)
''',
  ),
];

class _DragTargetSample extends StatefulWidget {
  const _DragTargetSample();

  @override
  State<_DragTargetSample> createState() => _DragTargetSampleState();
}

class _DragTargetSampleState extends State<_DragTargetSample> {
  int _droppedData = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Draggable<int>(
              data: 10,
              feedback: _Box(data: 10, color: Colors.blue.withAlpha(150)),
              childWhenDragging: const _Box(data: 10, color: Colors.grey),
              child: const _Box(data: 10, color: Colors.blue),
            ),
            Draggable<int>(
              data: 20,
              feedback: _Box(data: 20, color: Colors.orange.withAlpha(150)),
              childWhenDragging: const _Box(data: 20, color: Colors.grey),
              child: const _Box(data: 20, color: Colors.orange),
            ),
          ],
        ),
        const SizedBox(height: 50),
        DragTarget<int>(
          builder: (context, candidateData, rejectedData) {
            return Container(
              height: 100,
              width: 100,
              color: candidateData.isNotEmpty
                  ? Colors.green.withAlpha(200)
                  : Colors.blueGrey[100],
              child: Center(
                child: Text(
                  _droppedData == 0 ? 'Drop here' : 'Value: $_droppedData',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
          onAcceptWithDetails: (details) {
            setState(() {
              _droppedData = details.data;
            });
          },
        ),
        if (_droppedData != 0)
          CupertinoButton(
            child: const Text('Reset'),
            onPressed: () => setState(() => _droppedData = 0),
          ),
      ],
    );
  }
}

class _Box extends StatelessWidget {
  final int data;
  final Color color;

  const _Box({required this.data, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      color: color,
      child: Center(
        child: Text(
          '$data',
          style: const TextStyle(
            color: Colors.white,
            decoration: TextDecoration.none,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
