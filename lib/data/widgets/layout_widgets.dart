import 'package:flutter/material.dart';
import '../../models/widget_info.dart';

final List<WidgetInfo> layoutWidgets = [
  WidgetInfo(
    name: 'Container',
    description:
        'A convenience widget that combines common painting, positioning, and sizing widgets.',
    category: WidgetCategory.layout,
    builder: (context) => Container(
      width: 200,
      height: 200,
      color: Colors.blue,
      alignment: Alignment.center,
      child: const Text(
        'I am a Container',
        style: TextStyle(color: Colors.white),
      ),
    ),
    codeSnippet: '''
Container(
  width: 200,
  height: 200,
  color: Colors.blue,
  alignment: Alignment.center,
  child: const Text('I am a Container'),
)
''',
  ),
  WidgetInfo(
    name: 'Padding',
    description: 'A widget that insets its child by the given padding.',
    category: WidgetCategory.layout,
    builder: (context) => Container(
      color: Colors.grey[300],
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Text('Hello Padding'),
      ),
    ),
    codeSnippet: '''
Padding(
  padding: EdgeInsets.all(20.0),
  child: Text('Hello Padding'),
)
''',
  ),
  WidgetInfo(
    name: 'Center',
    description: 'A widget that centers its child within itself.',
    category: WidgetCategory.layout,
    builder: (context) => Container(
      height: 100,
      width: double.infinity,
      color: Colors.grey[200],
      child: const Center(child: Text('Centered Text')),
    ),
    codeSnippet: '''
Center(
  child: Text('Centered Text'),
)
''',
  ),
  WidgetInfo(
    name: 'Align',
    description:
        'A widget that aligns its child within itself and optionally sizes itself based on the child\'s size.',
    category: WidgetCategory.layout,
    builder: (context) => Container(
      height: 100,
      width: 100,
      color: Colors.grey[200],
      child: const Align(
        alignment: Alignment.bottomRight,
        child: FlutterLogo(),
      ),
    ),
    codeSnippet: '''
Align(
  alignment: Alignment.bottomRight,
  child: FlutterLogo(),
)
''',
  ),
  WidgetInfo(
    name: 'Column',
    description: 'A widget that displays its children in a vertical array.',
    category: WidgetCategory.layout,
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Text('First item'),
        SizedBox(height: 10),
        Text('Second item'),
        SizedBox(height: 10),
        Text('Third item'),
      ],
    ),
    codeSnippet: '''
Column(
  mainAxisSize: MainAxisSize.min,
  children: const [
    Text('First item'),
    SizedBox(height: 10),
    Text('Second item'),
    SizedBox(height: 10),
    Text('Third item'),
  ],
)
''',
  ),
  WidgetInfo(
    name: 'Row',
    description: 'A widget that displays its children in a horizontal array.',
    category: WidgetCategory.layout,
    builder: (context) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Icon(Icons.star, color: Colors.red),
        Icon(Icons.star, color: Colors.green),
        Icon(Icons.star, color: Colors.blue),
      ],
    ),
    codeSnippet: '''
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: const [
    Icon(Icons.star, color: Colors.red),
    Icon(Icons.star, color: Colors.green),
    Icon(Icons.star, color: Colors.blue),
  ],
)
''',
  ),
  WidgetInfo(
    name: 'Stack',
    description:
        'A widget that positions its children relative to the edges of its box.',
    category: WidgetCategory.layout,
    builder: (context) => SizedBox(
      width: 200,
      height: 200,
      child: Stack(
        children: [
          Container(width: 200, height: 200, color: Colors.red),
          Container(width: 150, height: 150, color: Colors.green),
          Container(width: 100, height: 100, color: Colors.blue),
        ],
      ),
    ),
    codeSnippet: '''
Stack(
  children: [
    Container(width: 200, height: 200, color: Colors.red),
    Container(width: 150, height: 150, color: Colors.green),
    Container(width: 100, height: 100, color: Colors.blue),
  ],
)
''',
  ),
  WidgetInfo(
    name: 'Expanded',
    description:
        'A widget that expands a child of a Row, Column, or Flex so that the child fills the available space.',
    category: WidgetCategory.layout,
    builder: (context) => Row(
      children: [
        Container(width: 50, height: 50, color: Colors.red),
        Expanded(child: Container(height: 50, color: Colors.green)),
        Container(width: 50, height: 50, color: Colors.blue),
      ],
    ),
    codeSnippet: '''
Row(
  children: [
    Container(width: 50, height: 50, color: Colors.red),
    Expanded(
      child: Container(height: 50, color: Colors.green),
    ),
    Container(width: 50, height: 50, color: Colors.blue),
  ],
)
''',
  ),
  WidgetInfo(
    name: 'SizedBox',
    description: 'A box with a specified size.',
    category: WidgetCategory.layout,
    builder: (context) => const SizedBox(
      width: 100,
      height: 100,
      child: Card(child: Center(child: Text('100x100'))),
    ),
    codeSnippet: '''
SizedBox(
  width: 100,
  height: 100,
  child: Card(child: Center(child: Text('100x100'))),
)
''',
  ),
  WidgetInfo(
    name: 'Wrap',
    description:
        'A widget that displays its children in multiple horizontal or vertical runs.',
    category: WidgetCategory.layout,
    builder: (context) => Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: List.generate(
        5,
        (index) => Chip(
          avatar: CircleAvatar(child: Text('$index')),
          label: Text('Chip $index'),
        ),
      ),
    ),
    codeSnippet: '''
Wrap(
  spacing: 8.0,
  runSpacing: 4.0,
  children: List.generate(
    5,
    (index) => Chip(
      avatar: CircleAvatar(child: Text('\$index')),
      label: Text('Chip \$index'),
    ),
  ),
)
''',
  ),
  WidgetInfo(
    name: 'AspectRatio',
    description:
        'A widget that attempts to size the child to a specific aspect ratio.',
    category: WidgetCategory.layout,
    builder: (context) => Container(
      color: Colors.blue,
      alignment: Alignment.center,
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          color: Colors.green,
          child: const Center(child: Text('16:9 Aspect Ratio')),
        ),
      ),
    ),
    codeSnippet: '''
AspectRatio(
  aspectRatio: 16 / 9,
  child: Container(
    color: Colors.green,
    child: const Center(child: Text('16:9 Aspect Ratio')),
  ),
)
''',
  ),
  WidgetInfo(
    name: 'ConstrainedBox',
    description: 'A widget that imposes additional constraints on its child.',
    category: WidgetCategory.layout,
    builder: (context) => ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 100.0,
        minHeight: 50.0,
        maxWidth: 150.0,
        maxHeight: 100.0,
      ),
      child: Container(
        color: Colors.amber,
        child: const Center(
          child: Text('Constrained', textAlign: TextAlign.center),
        ),
      ),
    ),
    codeSnippet: '''
ConstrainedBox(
  constraints: const BoxConstraints(
    minWidth: 100.0,
    minHeight: 50.0,
    maxWidth: 150.0,
    maxHeight: 100.0,
  ),
  child: Container(
    color: Colors.amber,
    child: const Center(child: Text('Constrained')),
  ),
)
''',
  ),
  WidgetInfo(
    name: 'IndexedStack',
    description: 'A Stack that shows a single child from a list of children.',
    category: WidgetCategory.layout,
    builder: (context) => const _IndexedStackSample(),
    codeSnippet: '''
class _IndexedStackSample extends StatefulWidget {
  const _IndexedStackSample();

  @override
  State<_IndexedStackSample> createState() => _IndexedStackSampleState();
}

class _IndexedStackSampleState extends State<_IndexedStackSample> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: () => setState(() => _index = 0), child: const Text('0')),
            ElevatedButton(onPressed: () => setState(() => _index = 1), child: const Text('1')),
            ElevatedButton(onPressed: () => setState(() => _index = 2), child: const Text('2')),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(border: Border.all()),
          child: IndexedStack(
            index: _index,
            children: [
              Container(color: Colors.red, child: const Center(child: Text('0'))),
              Container(color: Colors.green, child: const Center(child: Text('1'))),
              Container(color: Colors.blue, child: const Center(child: Text('2'))),
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
    name: 'Flexible',
    description:
        'A widget that controls how a child of a Row, Column, or Flex flexes.',
    category: WidgetCategory.layout,
    builder: (context) => Row(
      children: [
        Container(width: 50, height: 50, color: Colors.red),
        Flexible(
          fit: FlexFit.tight,
          flex: 2,
          child: Container(
            height: 50,
            color: Colors.green,
            child: const Center(child: Text('Flex: 2')),
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: Container(
            height: 50,
            color: Colors.blue,
            child: const Center(child: Text('Flex: 1')),
          ),
        ),
      ],
    ),
    codeSnippet: '''
Row(
  children: [
    Container(width: 50, height: 50, color: Colors.red),
    Flexible(
      fit: FlexFit.tight,
      flex: 2,
      child: Container(height: 50, color: Colors.green, child: const Center(child: Text('Flex: 2'))),
    ),
    Flexible(
      fit: FlexFit.tight,
      flex: 1,
      child: Container(height: 50, color: Colors.blue, child: const Center(child: Text('Flex: 1'))),
    ),
  ],
)
''',
  ),
  WidgetInfo(
    name: 'FractionallySizedBox',
    description:
        'A widget that sizes its child to a fraction of the total available space.',
    category: WidgetCategory.layout,
    builder: (context) => Container(
      height: 100,
      width: 200,
      color: Colors.grey.shade300,
      child: FractionallySizedBox(
        widthFactor: 0.5,
        heightFactor: 0.5,
        alignment: Alignment.center,
        child: Container(
          color: Colors.purple,
          child: const Center(child: Text('50%')),
        ),
      ),
    ),
    codeSnippet: '''
Container(
  height: 100,
  width: 200,
  color: Colors.grey.shade300,
  child: FractionallySizedBox(
    widthFactor: 0.5,
    heightFactor: 0.5,
    alignment: Alignment.center,
    child: Container(color: Colors.purple, child: const Center(child: Text('50%'))),
  ),
)
''',
  ),
  WidgetInfo(
    name: 'LayoutBuilder',
    description:
        'Builds a widget tree that can depend on the parent widget\'s size.',
    category: WidgetCategory.layout,
    builder: (context) => LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 200) {
          return Container(
            width: double.infinity,
            height: 100,
            color: Colors.teal,
            child: const Center(child: Text('Wide Layout')),
          );
        } else {
          return Container(
            width: double.infinity,
            height: 100,
            color: Colors.orange,
            child: const Center(child: Text('Narrow Layout')),
          );
        }
      },
    ),
    codeSnippet: '''
LayoutBuilder(
  builder: (BuildContext context, BoxConstraints constraints) {
    if (constraints.maxWidth > 200) {
      return Container(width: double.infinity, height: 100, color: Colors.teal, child: const Center(child: Text('Wide Layout')));
    } else {
      return Container(width: double.infinity, height: 100, color: Colors.orange, child: const Center(child: Text('Narrow Layout')));
    }
  },
)
''',
  ),
  WidgetInfo(
    name: 'Spacer',
    description: 'A widget that takes up space in a Row, Column, or Flex.',
    category: WidgetCategory.layout,
    builder: (context) => Row(
      children: [
        Container(width: 50, height: 50, color: Colors.red),
        const Spacer(),
        Container(width: 50, height: 50, color: Colors.green),
        const Spacer(flex: 2),
        Container(width: 50, height: 50, color: Colors.blue),
      ],
    ),
    codeSnippet: '''
Row(
  children: [
    Container(width: 50, height: 50, color: Colors.red),
    const Spacer(),
    Container(width: 50, height: 50, color: Colors.green),
    const Spacer(flex: 2),
    Container(width: 50, height: 50, color: Colors.blue),
  ],
)
''',
  ),
  WidgetInfo(
    name: 'Table',
    description:
        'A widget that uses the table layout algorithm for its children.',
    category: WidgetCategory.layout,
    builder: (context) => Table(
      border: TableBorder.all(),
      children: const [
        TableRow(
          children: [
            Padding(padding: EdgeInsets.all(8.0), child: Text('Name')),
            Padding(padding: EdgeInsets.all(8.0), child: Text('Age')),
          ],
        ),
        TableRow(
          children: [
            Padding(padding: EdgeInsets.all(8.0), child: Text('Alice')),
            Padding(padding: EdgeInsets.all(8.0), child: Text('25')),
          ],
        ),
        TableRow(
          children: [
            Padding(padding: EdgeInsets.all(8.0), child: Text('Bob')),
            Padding(padding: EdgeInsets.all(8.0), child: Text('30')),
          ],
        ),
      ],
    ),
    codeSnippet: '''
Table(
  border: TableBorder.all(),
  children: const [
    TableRow(children: [
      Padding(padding: EdgeInsets.all(8.0), child: Text('Name')),
      Padding(padding: EdgeInsets.all(8.0), child: Text('Age')),
    ]),
    TableRow(children: [
      Padding(padding: EdgeInsets.all(8.0), child: Text('Alice')),
      Padding(padding: EdgeInsets.all(8.0), child: Text('25')),
    ]),
    TableRow(children: [
      Padding(padding: EdgeInsets.all(8.0), child: Text('Bob')),
      Padding(padding: EdgeInsets.all(8.0), child: Text('30')),
    ]),
  ],
)
''',
  ),
  WidgetInfo(
    name: 'FittedBox',
    description:
        'Scales and positions its child within itself according to fit.',
    category: WidgetCategory.layout,
    builder: (context) => Container(
      height: 50,
      width: 50,
      color: Colors.amber,
      child: const FittedBox(
        fit: BoxFit.contain,
        child: Text('This text is too long to fit normally'),
      ),
    ),
    codeSnippet: '''
Container(
  height: 50,
  width: 50,
  color: Colors.amber,
  child: const FittedBox(
    fit: BoxFit.contain,
    child: Text('This text is too long to fit normally'),
  ),
)
''',
  ),
  WidgetInfo(
    name: 'Offstage',
    description:
        'A widget that lays the child out as if it was in the tree, but without painting anything, without making the child available for hit testing, and without taking up any room in the parent.',
    category: WidgetCategory.layout,
    builder: (context) => const _OffstageSample(),
    codeSnippet: '''
class _OffstageSample extends StatefulWidget {
  const _OffstageSample();

  @override
  State<_OffstageSample> createState() => _OffstageSampleState();
}

class _OffstageSampleState extends State<_OffstageSample> {
  bool _offstage = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Offstage(
          offstage: _offstage,
          child: Container(
            height: 100,
            color: Colors.blue,
            child: const Center(child: Text('I am here!')),
          ),
        ),
        ElevatedButton(
          child: const Text('Toggle Offstage'),
          onPressed: () {
            setState(() {
              _offstage = !_offstage;
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
    name: 'Baseline',
    description:
        'A widget that positions its child according to the child\'s baseline.',
    category: WidgetCategory.layout,
    builder: (context) => Container(
      color: Colors.grey.shade300,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Baseline(
            baseline: 50.0,
            baselineType: TextBaseline.alphabetic,
            child: Container(
              width: 50,
              height: 50,
              color: Colors.red,
              child: const Center(child: Text('50')),
            ),
          ),
          const SizedBox(width: 20),
          Baseline(
            baseline: 50.0,
            baselineType: TextBaseline.alphabetic,
            child: Text(
              'Baseline',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ],
      ),
    ),
    codeSnippet: '''
Container(
  color: Colors.grey.shade300,
  height: 100,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Baseline(
        baseline: 50.0,
        baselineType: TextBaseline.alphabetic,
        child: Container(
          width: 50,
          height: 50,
          color: Colors.red,
          child: const Center(child: Text('50')),
        ),
      ),
      const SizedBox(width: 20),
      Baseline(
        baseline: 50.0,
        baselineType: TextBaseline.alphabetic,
        child: Text(
          'Baseline',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    ],
  ),
)
''',
  ),
  WidgetInfo(
    name: 'Flow',
    description:
        'A widget that sizes and positions children efficiently according to the logic in a FlowDelegate.',
    category: WidgetCategory.layout,
    builder: (context) => const _FlowSample(),
    codeSnippet: '''
class _FlowSample extends StatefulWidget {
  const _FlowSample();

  @override
  State<_FlowSample> createState() => _FlowSampleState();
}

class _FlowSampleState extends State<_FlowSample> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: _FlowDelegate(animation: _animation),
      children: <Widget>[
        FloatingActionButton(
          onPressed: () {
            if (_controller.status == AnimationStatus.completed) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          },
          child: const Icon(Icons.menu),
        ),
        const FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.mail),
        ),
        const FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.call),
        ),
        const FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.notifications),
        ),
      ],
    );
  }
}

class _FlowDelegate extends FlowDelegate {
  _FlowDelegate({required this.animation}) : super(repaint: animation);

  final Animation<double> animation;

  @override
  void paintChildren(FlowPaintingContext context) {
    for (int i = 0; i < context.childCount; i++) {
      final double offset = i * animation.value * 50.0;
      context.paintChild(
        i,
        transform: Matrix4.translationValues(0, offset, 0),
      );
    }
  }

  @override
  bool shouldRepaint(_FlowDelegate oldDelegate) {
    return animation != oldDelegate.animation;
  }
}
''',
  ),
  WidgetInfo(
    name: 'OverflowBox',
    description:
        'A widget that imposes different constraints on its child than it gets from its parent, possibly allowing the child to overflow the parent.',
    category: WidgetCategory.layout,
    builder: (context) => Container(
      width: 100,
      height: 100,
      color: Colors.blue,
      alignment: Alignment.center,
      child: OverflowBox(
        maxWidth: 200,
        maxHeight: 200,
        child: Container(
          width: 150,
          height: 150,
          color: Colors.red.withValues(alpha: 0.5),
          child: const Center(child: Text('Overflows!')),
        ),
      ),
    ),
    codeSnippet: '''
Container(
  width: 100,
  height: 100,
  color: Colors.blue,
  alignment: Alignment.center,
  child: OverflowBox(
    maxWidth: 200,
    maxHeight: 200,
    child: Container(
      width: 150,
      height: 150,
      color: Colors.red.withValues(alpha: 0.5),
      child: const Center(child: Text('Overflows!')),
    ),
  ),
)
''',
  ),
  WidgetInfo(
    name: 'IntrinsicHeight',
    description:
        'A widget that sizes its child to the child\'s intrinsic height.',
    category: WidgetCategory.layout,
    builder: (context) => IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(color: Colors.blue, width: 100.0),
          Container(color: Colors.red, width: 50.0, height: 100.0),
          Container(color: Colors.yellow, width: 150.0),
        ],
      ),
    ),
    codeSnippet: '''
IntrinsicHeight(
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      Container(color: Colors.blue, width: 100.0),
      Container(color: Colors.red, width: 50.0, height: 100.0),
      Container(color: Colors.yellow, width: 150.0),
    ],
  ),
)
''',
  ),
  WidgetInfo(
    name: 'IntrinsicWidth',
    description:
        'A widget that sizes its child to the child\'s intrinsic width.',
    category: WidgetCategory.layout,
    builder: (context) => Center(
      child: IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(color: Colors.blue, height: 100.0),
            Container(color: Colors.red, width: 150.0, height: 100.0),
            Container(color: Colors.yellow, height: 100.0),
          ],
        ),
      ),
    ),
    codeSnippet: '''
Center(
  child: IntrinsicWidth(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(color: Colors.blue, height: 100.0),
        Container(color: Colors.red, width: 150.0, height: 100.0),
        Container(color: Colors.yellow, height: 100.0),
      ],
    ),
  ),
)
''',
  ),
  WidgetInfo(
    name: 'LimitedBox',
    description: 'A box that limits its size only when it\'s unconstrained.',
    category: WidgetCategory.layout,
    builder: (context) => ListView(
      children: [
        LimitedBox(
          maxHeight: 100,
          child: Container(
            color: Colors.blue,
            child: const Center(child: Text('Limited to 100px height')),
          ),
        ),
      ],
    ),
    codeSnippet: '''
LimitedBox(
  maxHeight: 100,
  child: Container(
    color: Colors.blue,
    child: const Center(child: Text('Limited to 100px height')),
  ),
)
''',
  ),
  WidgetInfo(
    name: 'SizedOverflowBox',
    description:
        'A widget that is a specific size but passes its original constraints through to its child.',
    category: WidgetCategory.layout,
    builder: (context) => SizedOverflowBox(
      size: const Size(100, 100),
      child: Container(
        width: 150,
        height: 150,
        color: Colors.red.withValues(alpha: 0.5),
        child: const Center(child: Text('Overflow')),
      ),
    ),
    codeSnippet: '''
SizedOverflowBox(
  size: const Size(100, 100),
  child: Container(
    width: 150,
    height: 150,
    color: Colors.red.withValues(alpha: 0.5),
    child: const Center(child: Text('Overflow')),
  ),
)
''',
  ),
  WidgetInfo(
    name: 'UnconstrainedBox',
    description: 'A container that tries to let its child be unconstrained.',
    category: WidgetCategory.layout,
    builder: (context) => Container(
      width: 100,
      height: 100,
      color: Colors.grey[300],
      child: UnconstrainedBox(
        child: Container(
          width: 150,
          height: 50,
          color: Colors.green,
          child: const Center(child: Text('Unconstrained')),
        ),
      ),
    ),
    codeSnippet: '''
UnconstrainedBox(
  child: Container(
    width: 150,
    height: 50,
    color: Colors.green,
    child: const Center(child: Text('Unconstrained')),
  ),
)
''',
  ),
  WidgetInfo(
    name: 'Positioned',
    description:
        'A widget that controls where a child of a Stack is positioned.',
    category: WidgetCategory.layout,
    builder: (context) => SizedBox(
      width: 200,
      height: 200,
      child: Stack(
        children: [
          Container(color: Colors.grey[300]),
          Positioned(
            top: 20,
            left: 20,
            child: Container(width: 50, height: 50, color: Colors.red),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Container(width: 50, height: 50, color: Colors.blue),
          ),
        ],
      ),
    ),
    codeSnippet: '''
Stack(
  children: [
    Positioned(
      top: 20,
      left: 20,
      child: Container(
        width: 50,
        height: 50,
        color: Colors.red,
      ),
    ),
    Positioned(
      bottom: 20,
      right: 20,
      child: Container(
        width: 50,
        height: 50,
        color: Colors.blue,
      ),
    ),
  ],
)
''',
  ),
  WidgetInfo(
    name: 'ListBody',
    description:
        'A widget that arranges its children sequentially along a given axis, forcing them to the dimension of the parent in the other axis.',
    category: WidgetCategory.layout,
    builder: (context) => Container(
      width: double.infinity,
      color: Colors.grey[100],
      child: ListBody(
        mainAxis: Axis.vertical,
        children: [
          Container(
            height: 50,
            color: Colors.red[100],
            child: const Center(child: Text('ListBody Item 1')),
          ),
          Container(
            height: 50,
            color: Colors.blue[100],
            child: const Center(child: Text('ListBody Item 2')),
          ),
          Container(
            height: 50,
            color: Colors.green[100],
            child: const Center(child: Text('ListBody Item 3')),
          ),
        ],
      ),
    ),
    codeSnippet: '''
ListBody(
  mainAxis: Axis.vertical,
  children: [
    Container(height: 50, color: Colors.red[100], child: Text('Item 1')),
    Container(height: 50, color: Colors.blue[100], child: Text('Item 2')),
    Container(height: 50, color: Colors.green[100], child: Text('Item 3')),
  ],
)
''',
  ),
  WidgetInfo(
    name: 'CustomSingleChildLayout',
    description:
        'A widget that defers the layout of its single child to a delegate.',
    category: WidgetCategory.layout,
    builder: (context) => Container(
      width: 200,
      height: 200,
      color: Colors.grey[300],
      child: CustomSingleChildLayout(
        delegate: _FixedSizeLayoutDelegate(const Size(100, 100)),
        child: Container(
          color: Colors.blue,
          child: const Center(child: Text('Custom Layout')),
        ),
      ),
    ),
    codeSnippet: '''
CustomSingleChildLayout(
  delegate: _FixedSizeLayoutDelegate(const Size(100, 100)),
  child: Container(
    color: Colors.blue,
    child: const Center(child: Text('Custom Layout')),
  ),
)

class _FixedSizeLayoutDelegate extends SingleChildLayoutDelegate {
  _FixedSizeLayoutDelegate(this.size);
  final Size size;

  @override
  Size getSize(BoxConstraints constraints) => size;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints.tight(size);
  }

  @override
  bool shouldRelayout(_FixedSizeLayoutDelegate oldDelegate) {
    return size != oldDelegate.size;
  }
}
''',
  ),
  WidgetInfo(
    name: 'OverflowBar',
    description:
        'A widget that lays out its children in a row unless they "overflow" the available horizontal space, in which case it lays them out in a column.',
    category: WidgetCategory.layout,
    builder: (context) => Container(
      width: 200,
      padding: const EdgeInsets.all(8.0),
      color: Colors.grey[200],
      child: OverflowBar(
        spacing: 8.0,
        overflowSpacing: 8.0,
        children: <Widget>[
          ElevatedButton(onPressed: () {}, child: const Text('Button 1')),
          ElevatedButton(onPressed: () {}, child: const Text('Button 2')),
          ElevatedButton(onPressed: () {}, child: const Text('Button 3')),
        ],
      ),
    ),
    codeSnippet: '''
OverflowBar(
  spacing: 8.0,
  overflowSpacing: 8.0,
  children: <Widget>[
    ElevatedButton(onPressed: () {}, child: const Text('Button 1')),
    ElevatedButton(onPressed: () {}, child: const Text('Button 2')),
    ElevatedButton(onPressed: () {}, child: const Text('Button 3')),
  ],
)
''',
  ),
  WidgetInfo(
    name: 'CustomMultiChildLayout',
    description:
        'A widget that uses a delegate to size and position multiple children.',
    category: WidgetCategory.layout,
    builder: (context) => Container(
      width: 200,
      height: 200,
      color: Colors.grey[300],
      child: CustomMultiChildLayout(
        delegate: _CascadeLayoutDelegate(),
        children: [
          LayoutId(
            id: 'child1',
            child: Container(width: 50, height: 50, color: Colors.red),
          ),
          LayoutId(
            id: 'child2',
            child: Container(width: 50, height: 50, color: Colors.green),
          ),
          LayoutId(
            id: 'child3',
            child: Container(width: 50, height: 50, color: Colors.blue),
          ),
        ],
      ),
    ),
    codeSnippet: '''
CustomMultiChildLayout(
  delegate: _CascadeLayoutDelegate(),
  children: [
    LayoutId(
      id: 'child1',
      child: Container(width: 50, height: 50, color: Colors.red),
    ),
    LayoutId(
      id: 'child2',
      child: Container(width: 50, height: 50, color: Colors.green),
    ),
    LayoutId(
      id: 'child3',
      child: Container(width: 50, height: 50, color: Colors.blue),
    ),
  ],
)

class _CascadeLayoutDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    if (hasChild('child1')) {
      layoutChild('child1', BoxConstraints.loose(size));
      positionChild('child1', Offset.zero);
    }
    if (hasChild('child2')) {
      layoutChild('child2', BoxConstraints.loose(size));
      positionChild('child2', const Offset(40, 40));
    }
    if (hasChild('child3')) {
      layoutChild('child3', BoxConstraints.loose(size));
      positionChild('child3', const Offset(80, 80));
    }
  }

  @override
  bool shouldRelayout(_CascadeLayoutDelegate oldDelegate) => false;
}
''',
  ),
  WidgetInfo(
    name: 'GridTile',
    description: 'A widget for use in a GridView that has a header or footer.',
    category: WidgetCategory.layout,
    builder: (context) => SizedBox(
      height: 200,
      width: 200,
      child: GridTile(
        header: const GridTileBar(
          backgroundColor: Colors.black45,
          leading: Icon(Icons.star, color: Colors.white),
          title: Text('Header'),
        ),
        footer: const GridTileBar(
          backgroundColor: Colors.black45,
          title: Text('Footer'),
          trailing: Icon(Icons.info, color: Colors.white),
        ),
        child: Container(
          color: Colors.blue[100],
          child: const Center(child: Text('GridTile Content')),
        ),
      ),
    ),
    codeSnippet: '''
GridTile(
  header: const GridTileBar(
    backgroundColor: Colors.black45,
    leading: Icon(Icons.star, color: Colors.white),
    title: Text('Header'),
  ),
  footer: const GridTileBar(
    backgroundColor: Colors.black45,
    title: Text('Footer'),
    trailing: Icon(Icons.info, color: Colors.white),
  ),
  child: Container(
    color: Colors.blue[100],
    child: const Center(child: Text('GridTile Content')),
  ),
)
''',
  ),
  WidgetInfo(
    name: 'OrientationBuilder',
    description:
        'Builds a widget tree that can depend on the parent widget\'s orientation.',
    category: WidgetCategory.layout,
    builder: (context) => const _OrientationBuilderSample(),
    codeSnippet: '''
OrientationBuilder(
  builder: (context, orientation) {
    return GridView.count(
      crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
      children: List.generate(4, (index) {
        return Container(
          color: Colors.teal[(index + 1) * 100],
          child: Center(child: Text('Item \$index')),
        );
      }),
    );
  },
)
''',
  ),
];

class _FlowSample extends StatefulWidget {
  const _FlowSample();

  @override
  State<_FlowSample> createState() => _FlowSampleState();
}

class _FlowSampleState extends State<_FlowSample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: _FlowDelegate(animation: _animation),
      children: <Widget>[
        FloatingActionButton(
          onPressed: () {
            if (_controller.status == AnimationStatus.completed) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          },
          child: const Icon(Icons.menu),
        ),
        const FloatingActionButton(onPressed: null, child: Icon(Icons.mail)),
        const FloatingActionButton(onPressed: null, child: Icon(Icons.call)),
        const FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.notifications),
        ),
      ],
    );
  }
}

class _FlowDelegate extends FlowDelegate {
  _FlowDelegate({required this.animation}) : super(repaint: animation);

  final Animation<double> animation;

  @override
  void paintChildren(FlowPaintingContext context) {
    for (int i = 0; i < context.childCount; i++) {
      final double offset = i * animation.value * 50.0;
      context.paintChild(i, transform: Matrix4.translationValues(0, offset, 0));
    }
  }

  @override
  bool shouldRepaint(_FlowDelegate oldDelegate) {
    return animation != oldDelegate.animation;
  }
}

class _OffstageSample extends StatefulWidget {
  const _OffstageSample();

  @override
  State<_OffstageSample> createState() => _OffstageSampleState();
}

class _OffstageSampleState extends State<_OffstageSample> {
  bool _offstage = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Offstage(
          offstage: _offstage,
          child: Container(
            height: 100,
            color: Colors.blue,
            child: const Center(child: Text('I am here!')),
          ),
        ),
        ElevatedButton(
          child: const Text('Toggle Offstage'),
          onPressed: () {
            setState(() {
              _offstage = !_offstage;
            });
          },
        ),
      ],
    );
  }
}

class _IndexedStackSample extends StatefulWidget {
  const _IndexedStackSample();

  @override
  State<_IndexedStackSample> createState() => _IndexedStackSampleState();
}

class _IndexedStackSampleState extends State<_IndexedStackSample> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => setState(() => _index = 0),
              child: const Text('0'),
            ),
            ElevatedButton(
              onPressed: () => setState(() => _index = 1),
              child: const Text('1'),
            ),
            ElevatedButton(
              onPressed: () => setState(() => _index = 2),
              child: const Text('2'),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(border: Border.all()),
          child: IndexedStack(
            index: _index,
            children: [
              Container(
                color: Colors.red,
                child: const Center(child: Text('0')),
              ),
              Container(
                color: Colors.green,
                child: const Center(child: Text('1')),
              ),
              Container(
                color: Colors.blue,
                child: const Center(child: Text('2')),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FixedSizeLayoutDelegate extends SingleChildLayoutDelegate {
  _FixedSizeLayoutDelegate(this.size);
  final Size size;

  @override
  Size getSize(BoxConstraints constraints) => size;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints.tight(size);
  }

  @override
  bool shouldRelayout(_FixedSizeLayoutDelegate oldDelegate) {
    return size != oldDelegate.size;
  }
}

class _CascadeLayoutDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    if (hasChild('child1')) {
      layoutChild('child1', BoxConstraints.loose(size));
      positionChild('child1', Offset.zero);
    }
    if (hasChild('child2')) {
      layoutChild('child2', BoxConstraints.loose(size));
      positionChild('child2', const Offset(40, 40));
    }
    if (hasChild('child3')) {
      layoutChild('child3', BoxConstraints.loose(size));
      positionChild('child3', const Offset(80, 80));
    }
  }

  @override
  bool shouldRelayout(_CascadeLayoutDelegate oldDelegate) => false;
}

class _OrientationBuilderSample extends StatelessWidget {
  const _OrientationBuilderSample();

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return GridView.count(
          crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(4, (index) {
            return Container(
              margin: const EdgeInsets.all(8),
              color: Colors.teal[(index + 1) * 100],
              child: Center(
                child: Text(
                  'Item $index',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
