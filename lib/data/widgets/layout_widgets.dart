import 'package:flutter/material.dart';
import '../../models/knobs.dart';
import '../../models/widget_info.dart';

final List<WidgetInfo> layoutWidgets = [
  WidgetInfo(
    name: 'Container',
    description:
        'A convenience widget that combines common painting, positioning, and sizing widgets.',
    category: WidgetCategory.layout,
    whenToUse:
        'Reach for Container when you need to combine padding, margin, color, '
        'a border/decoration, and sizing in one widget. If you only need one of '
        'those, prefer the dedicated single-purpose widget (Padding, SizedBox, '
        'DecoratedBox) for a lighter tree.',
    commonPitfalls: [
      'Setting both color and decoration throws an assertion — put the color '
          'inside the BoxDecoration instead.',
      'A Container with no child, no size, and unbounded constraints expands to '
          'fill its parent, which can be surprising.',
    ],
    relatedWidgets: ['Padding', 'SizedBox', 'DecoratedBox', 'Align'],
    docsUrl: 'https://api.flutter.dev/flutter/widgets/Container-class.html',
    tags: ['box', 'padding', 'margin', 'decoration', 'sizing'],
    difficulty: WidgetDifficulty.beginner,
    playground: WidgetPlayground(
      knobs: const [
        DoubleKnob('w', 'Width', min: 60, max: 260, initial: 200),
        DoubleKnob('h', 'Height', min: 60, max: 260, initial: 160),
        DoubleKnob('radius', 'Corner radius', min: 0, max: 80, initial: 12),
        ColorKnob(
          'color',
          'Color',
          options: [
            Colors.blue,
            Colors.red,
            Colors.green,
            Colors.orange,
            Colors.deepPurple,
          ],
          initial: Colors.blue,
        ),
      ],
      builder: (context, k) => Container(
        width: k.number('w'),
        height: k.number('h'),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: k.color('color'),
          borderRadius: BorderRadius.circular(k.number('radius')),
        ),
        child: const Text('Container', style: TextStyle(color: Colors.white)),
      ),
    ),
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
    whenToUse:
        'Use Padding to add empty space around a single child. Prefer it over a '
        'Container when padding is all you need, since it is cheaper and clearer.',
    commonPitfalls: [
      'EdgeInsets values are logical pixels, not percentages — they do not scale '
          'with the parent size.',
      'Wrapping with Padding when the child is null still occupies the inset '
          'space; guard against a null child if that matters.',
    ],
    relatedWidgets: ['Container', 'Align', 'Center', 'SizedBox'],
    docsUrl: 'https://api.flutter.dev/flutter/widgets/Padding-class.html',
    tags: ['padding', 'spacing', 'insets', 'margin'],
    difficulty: WidgetDifficulty.beginner,
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
    whenToUse:
        'Use Center to place a single child in the middle of the available '
        'space. It is just Align with Alignment.center, so reach for Align '
        'directly when you need a non-center alignment.',
    commonPitfalls: [
      'Center expands to fill its parent when given unbounded constraints, so '
          'in a Column/Row it may take more space than expected.',
      'Use widthFactor/heightFactor if you want Center to shrink to its child '
          'instead of filling the parent.',
    ],
    relatedWidgets: ['Align', 'Container', 'Padding'],
    docsUrl: 'https://api.flutter.dev/flutter/widgets/Center-class.html',
    tags: ['center', 'align', 'positioning'],
    difficulty: WidgetDifficulty.beginner,
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
    whenToUse:
        'Use Align to position a single child at a specific alignment (corner, '
        'edge, or center) within the available space. Use Center for the common '
        'center case, and FractionallySizedBox if you also need to size the child.',
    commonPitfalls: [
      'Align expands to fill unbounded constraints; pass widthFactor/heightFactor '
          'to make it size itself to a multiple of the child instead.',
      'Alignment coordinates run from -1.0 (top/left) to 1.0 (bottom/right), not '
          'in pixels.',
    ],
    relatedWidgets: [
      'Center',
      'FractionallySizedBox',
      'Positioned',
      'Container',
    ],
    docsUrl: 'https://api.flutter.dev/flutter/widgets/Align-class.html',
    tags: ['align', 'positioning', 'alignment'],
    difficulty: WidgetDifficulty.beginner,
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
    whenToUse:
        'Use Column to stack a known, small number of children vertically. For '
        'long or scrollable lists prefer ListView, which lazily builds items.',
    commonPitfalls: [
      'A Column gives unbounded height to its children, so placing another '
          'vertically-scrolling widget inside without bounding it throws an '
          'unbounded-height error.',
      'Expanded/Flexible only work as direct children of a Column (or Row/Flex).',
      'Default mainAxisSize is max, so the Column fills all available height; set '
          'mainAxisSize.min to shrink-wrap its children.',
    ],
    relatedWidgets: ['Row', 'Expanded', 'Flexible', 'ListView'],
    docsUrl: 'https://api.flutter.dev/flutter/widgets/Column-class.html',
    tags: ['column', 'vertical', 'flex', 'layout'],
    difficulty: WidgetDifficulty.beginner,
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
    whenToUse:
        'Use Row to lay out a small number of children horizontally. If children '
        'may not fit and should wrap to the next line, use Wrap instead.',
    commonPitfalls: [
      'A Row gives unbounded width to its children, so a wide child (like long '
          'Text) overflows with a yellow-and-black stripe; wrap it in Expanded or '
          'Flexible to constrain it.',
      'Expanded/Flexible only work as direct children of a Row (or Column/Flex).',
    ],
    relatedWidgets: ['Column', 'Expanded', 'Flexible', 'Wrap'],
    docsUrl: 'https://api.flutter.dev/flutter/widgets/Row-class.html',
    tags: ['row', 'horizontal', 'flex', 'layout'],
    difficulty: WidgetDifficulty.beginner,
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
    whenToUse:
        'Use Stack to overlap widgets, layering them on top of one another and '
        'pinning some with Positioned. For laying widgets out in a single line '
        'use Row or Column instead.',
    commonPitfalls: [
      'A Stack sizes itself to its largest non-positioned child; if all children '
          'are Positioned it may collapse, so give it bounded constraints.',
      'Positioned must be a direct child of a Stack, otherwise it throws a '
          'ParentDataWidget error.',
    ],
    relatedWidgets: ['Positioned', 'IndexedStack', 'Align'],
    docsUrl: 'https://api.flutter.dev/flutter/widgets/Stack-class.html',
    tags: ['stack', 'overlap', 'layering', 'positioned'],
    difficulty: WidgetDifficulty.intermediate,
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
    whenToUse:
        'Inside a Row/Column/Flex to make a child fill the remaining main-axis '
        'space. Use Flexible when the child may be smaller than its share, and '
        'Spacer when you just need flexible empty space.',
    commonPitfalls: [
      'Expanded only works as a direct child of Row/Column/Flex, else it throws '
          'an "incorrect use of ParentDataWidget" error.',
      'Expanded forces FlexFit.tight, so the child is sized exactly to its share '
          'and cannot be smaller; use Flexible for a loose fit.',
    ],
    relatedWidgets: ['Flexible', 'Spacer', 'Row', 'Column'],
    docsUrl: 'https://api.flutter.dev/flutter/widgets/Expanded-class.html',
    tags: ['flex', 'fill space', 'row', 'column'],
    difficulty: WidgetDifficulty.beginner,
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
    whenToUse:
        'Use SizedBox to give a child a fixed width/height, or with no child to '
        'add fixed empty space between widgets. Prefer it over a sized Container '
        'when you do not need decoration or color, since it is const-constructible '
        'and cheaper.',
    commonPitfalls: [
      'SizedBox imposes a tight constraint, so the child is forced to the given '
          'size and may overflow if its content is larger.',
      'SizedBox.expand fills its parent, which requires the parent to provide '
          'bounded constraints.',
    ],
    relatedWidgets: ['Container', 'ConstrainedBox', 'Spacer', 'Padding'],
    docsUrl: 'https://api.flutter.dev/flutter/widgets/SizedBox-class.html',
    tags: ['size', 'spacing', 'fixed', 'gap'],
    difficulty: WidgetDifficulty.beginner,
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
    whenToUse:
        'Use Wrap when a row of items should flow onto additional lines once they '
        'run out of space, like chips or tags. Use Row/Column when you want a '
        'single line and overflow is unexpected.',
    commonPitfalls: [
      'Wrap does not support Expanded/Flexible children since runs are sized to '
          'the children, not the other way around.',
      'spacing controls gaps within a run while runSpacing controls gaps between '
          'runs; mixing them up is a common mistake.',
    ],
    relatedWidgets: ['Row', 'Column', 'Flow'],
    docsUrl: 'https://api.flutter.dev/flutter/widgets/Wrap-class.html',
    tags: ['wrap', 'flow', 'chips', 'runs', 'responsive'],
    difficulty: WidgetDifficulty.beginner,
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
    whenToUse:
        'Use AspectRatio to size a child to a width:height ratio (e.g. 16/9 for '
        'video) when given a bounded dimension. Use FractionallySizedBox instead '
        'when you want a percentage of the parent rather than a fixed ratio.',
    commonPitfalls: [
      'AspectRatio needs at least one bounded axis to work with; in fully '
          'unbounded space it cannot determine a size.',
      'It only attempts the ratio within the incoming constraints, so it may not '
          'achieve the exact ratio if the constraints are too tight.',
    ],
    relatedWidgets: ['FractionallySizedBox', 'FittedBox', 'ConstrainedBox'],
    docsUrl: 'https://api.flutter.dev/flutter/widgets/AspectRatio-class.html',
    tags: ['aspect ratio', 'sizing', 'proportion', 'video'],
    difficulty: WidgetDifficulty.intermediate,
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
    whenToUse:
        'Use ConstrainedBox to apply minimum/maximum width and height bounds to a '
        'child. Use SizedBox for a single fixed size, and LimitedBox when limits '
        'should apply only under unbounded constraints.',
    commonPitfalls: [
      'ConstrainedBox combines with, rather than overrides, the constraints from '
          'its parent, so a tight parent constraint can ignore your bounds.',
      'Setting only a min on an unbounded axis still lets the child grow without '
          'limit unless a max is also given.',
    ],
    relatedWidgets: [
      'SizedBox',
      'LimitedBox',
      'UnconstrainedBox',
      'OverflowBox',
    ],
    docsUrl:
        'https://api.flutter.dev/flutter/widgets/ConstrainedBox-class.html',
    tags: ['constraints', 'min', 'max', 'sizing'],
    difficulty: WidgetDifficulty.intermediate,
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
    whenToUse:
        'Use IndexedStack to keep several children alive but show only one at a '
        'time (e.g. tab pages that should preserve their state). Use a plain Stack '
        'when you want multiple children visible and overlapping.',
    commonPitfalls: [
      'All children are laid out and kept in the tree even though only one is '
          'painted, so it costs more than swapping a single widget.',
      'The stack sizes itself to the largest child, not the currently visible one, '
          'which can make its size appear fixed.',
    ],
    relatedWidgets: ['Stack', 'Offstage', 'Positioned'],
    docsUrl: 'https://api.flutter.dev/flutter/widgets/IndexedStack-class.html',
    tags: ['stack', 'index', 'tabs', 'state preservation'],
    difficulty: WidgetDifficulty.intermediate,
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
    whenToUse:
        'Use Flexible inside a Row/Column/Flex when a child should take a share of '
        'the free space but be allowed to be smaller (FlexFit.loose). Use Expanded '
        '(FlexFit.tight) when the child must fill its full share.',
    commonPitfalls: [
      'Flexible only works as a direct child of Row/Column/Flex, otherwise it '
          'throws a ParentDataWidget error.',
      'The default fit is FlexFit.loose; the child only grows to its natural size, '
          'which surprises people expecting it to fill like Expanded.',
    ],
    relatedWidgets: ['Expanded', 'Spacer', 'Row', 'Column'],
    docsUrl: 'https://api.flutter.dev/flutter/widgets/Flexible-class.html',
    tags: ['flex', 'flexible', 'row', 'column', 'fit'],
    difficulty: WidgetDifficulty.intermediate,
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
    whenToUse:
        'Use FractionallySizedBox to size a child to a percentage of the parent '
        '(e.g. 50% width). Use AspectRatio for a fixed ratio, or SizedBox for an '
        'absolute size.',
    commonPitfalls: [
      'It needs bounded constraints on the axis you scale; widthFactor in '
          'unbounded width has nothing to take a fraction of.',
      'The factors are multipliers of the parent size, so a factor above 1.0 '
          'makes the child larger than the parent.',
    ],
    relatedWidgets: ['AspectRatio', 'SizedBox', 'Align', 'ConstrainedBox'],
    docsUrl:
        'https://api.flutter.dev/flutter/widgets/FractionallySizedBox-class.html',
    tags: ['fraction', 'percentage', 'sizing', 'responsive'],
    difficulty: WidgetDifficulty.intermediate,
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
    whenToUse:
        'Use LayoutBuilder to build different layouts based on the constraints '
        'the parent passes down. Use MediaQuery instead when you need the full '
        'screen size or device features rather than the local box constraints.',
    commonPitfalls: [
      'The builder runs during layout, so calling setState or side-effects from '
          'inside it can cause errors or extra rebuilds.',
      'If the parent gives unbounded constraints on an axis, maxWidth/maxHeight '
          'will be infinity, which your size checks must handle.',
    ],
    relatedWidgets: ['MediaQuery', 'OrientationBuilder', 'ConstrainedBox'],
    docsUrl: 'https://api.flutter.dev/flutter/widgets/LayoutBuilder-class.html',
    tags: ['responsive', 'constraints', 'layout', 'builder'],
    difficulty: WidgetDifficulty.intermediate,
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
    whenToUse:
        'Use Spacer to insert flexible empty space between children of a '
        'Row/Column/Flex, pushing them apart. Use SizedBox when you want a fixed '
        'gap, or mainAxisAlignment for simple distributions.',
    commonPitfalls: [
      'Spacer only works inside a Row/Column/Flex; it relies on flex layout and '
          'errors elsewhere.',
      'Spacer needs bounded space on the main axis; in a scroll view with '
          'unbounded main-axis extent there is no free space to fill.',
    ],
    relatedWidgets: ['Expanded', 'Flexible', 'SizedBox', 'Row'],
    docsUrl: 'https://api.flutter.dev/flutter/widgets/Spacer-class.html',
    tags: ['spacer', 'flex', 'gap', 'spacing'],
    difficulty: WidgetDifficulty.beginner,
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
    whenToUse:
        'Use Table for a grid of cells where columns share consistent widths and '
        'rows align across the table. Use GridView for scrollable, equally-sized '
        'tiles, or Row/Column for simpler one-dimensional layouts.',
    commonPitfalls: [
      'Every TableRow must have the same number of children, otherwise Table '
          'asserts.',
      'Table sizes to its intrinsic content and is not scrollable on its own; '
          'wrap it in a SingleChildScrollView for large tables.',
    ],
    relatedWidgets: ['GridView', 'Row', 'Column'],
    docsUrl: 'https://api.flutter.dev/flutter/widgets/Table-class.html',
    tags: ['table', 'grid', 'rows', 'columns', 'cells'],
    difficulty: WidgetDifficulty.intermediate,
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
    whenToUse:
        'Use FittedBox to scale a child up or down to fit the available space, '
        'such as shrinking long text or scaling an image. Use AspectRatio when '
        'you only need to enforce a ratio without scaling content.',
    commonPitfalls: [
      'FittedBox scales the child visually, so text and icons can become blurry '
          'or oddly sized rather than reflowing.',
      'It needs bounded constraints to know the target size; in unbounded space '
          'there is nothing to fit into.',
    ],
    relatedWidgets: ['AspectRatio', 'Transform', 'SizedBox'],
    docsUrl: 'https://api.flutter.dev/flutter/widgets/FittedBox-class.html',
    tags: ['fit', 'scale', 'resize', 'boxfit'],
    difficulty: WidgetDifficulty.intermediate,
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
    whenToUse:
        'Use Offstage to keep a widget built and its state alive while hiding it '
        'and removing it from layout. Use Visibility for the common show/hide case, '
        'or simply omit the widget when you do not need to preserve its state.',
    commonPitfalls: [
      'Offstage children are still built and kept in the element tree, so they '
          'consume resources even while hidden.',
      'When offstage the child is laid out but takes no space and is not '
          'hit-testable, which can confuse keys and focus.',
    ],
    relatedWidgets: ['IndexedStack', 'SizedBox'],
    docsUrl: 'https://api.flutter.dev/flutter/widgets/Offstage-class.html',
    tags: ['offstage', 'hide', 'visibility', 'state preservation'],
    difficulty: WidgetDifficulty.intermediate,
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
    whenToUse:
        'Use Baseline to align a child to a typographic baseline, typically so '
        'differently-sized text shares a common text baseline. For ordinary '
        'alignment use Align or Row crossAxisAlignment.',
    commonPitfalls: [
      'You must specify the correct baselineType (alphabetic vs ideographic) for '
          'the script being rendered.',
      'It positions relative to the given baseline distance from the top, so a '
          'wrong value can push the child outside its expected box.',
    ],
    relatedWidgets: ['Align', 'Row', 'Padding'],
    docsUrl: 'https://api.flutter.dev/flutter/widgets/Baseline-class.html',
    tags: ['baseline', 'text', 'alignment', 'typography'],
    difficulty: WidgetDifficulty.advanced,
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
    whenToUse:
        'Use Flow for custom, performant positioning where children are '
        'repositioned via transforms (often animated) without relaying out, such '
        'as a fan-out menu. For ordinary wrapping use Wrap; for declarative custom '
        'layout use CustomMultiChildLayout.',
    commonPitfalls: [
      'Children are positioned only via the delegate\'s paintChildren transforms, '
          'so they are painted in a separate layer and normal hit-testing follows '
          'those transforms.',
      'Implement shouldRepaint correctly or the flow will not update when the '
          'delegate\'s inputs change.',
    ],
    relatedWidgets: ['CustomMultiChildLayout', 'Wrap', 'Stack', 'Transform'],
    docsUrl: 'https://api.flutter.dev/flutter/widgets/Flow-class.html',
    tags: ['flow', 'custom layout', 'delegate', 'animation'],
    difficulty: WidgetDifficulty.advanced,
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
    whenToUse:
        'Use OverflowBox to let a child be larger than its parent\'s constraints, '
        'intentionally overflowing it. Use UnconstrainedBox to fully remove '
        'constraints, or SizedOverflowBox when the box itself should keep a fixed '
        'size.',
    commonPitfalls: [
      'The child can paint outside the parent and is not clipped by default, so '
          'it may overlap sibling widgets.',
      'Because the child ignores the parent constraints, it is easy to produce '
          'overflow that is hard to debug.',
    ],
    relatedWidgets: ['SizedOverflowBox', 'UnconstrainedBox', 'ConstrainedBox'],
    docsUrl: 'https://api.flutter.dev/flutter/widgets/OverflowBox-class.html',
    tags: ['overflow', 'constraints', 'sizing'],
    difficulty: WidgetDifficulty.advanced,
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
    whenToUse:
        'Use IntrinsicHeight to make children in a Row share the height of the '
        'tallest one (e.g. equal-height cards). Prefer fixed sizes or '
        'crossAxisAlignment when you can, since intrinsics are expensive.',
    commonPitfalls: [
      'Computing intrinsic dimensions is relatively expensive (an extra layout '
          'pass), so avoid it in large or deeply nested trees.',
      'Some children (like scrollables) do not support intrinsic dimensions and '
          'will throw when measured.',
    ],
    relatedWidgets: ['IntrinsicWidth', 'Row', 'Column'],
    docsUrl:
        'https://api.flutter.dev/flutter/widgets/IntrinsicHeight-class.html',
    tags: ['intrinsic', 'height', 'equal size', 'sizing'],
    difficulty: WidgetDifficulty.advanced,
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
    whenToUse:
        'Use IntrinsicWidth to make stacked children in a Column share the width '
        'of the widest one (e.g. equal-width buttons). Prefer explicit sizing when '
        'possible because intrinsics add a layout pass.',
    commonPitfalls: [
      'Computing intrinsic dimensions is expensive, so avoid it in large lists or '
          'deep trees.',
      'Children that cannot report an intrinsic width (such as some scrollables) '
          'will throw when wrapped.',
    ],
    relatedWidgets: ['IntrinsicHeight', 'Column', 'Row'],
    docsUrl:
        'https://api.flutter.dev/flutter/widgets/IntrinsicWidth-class.html',
    tags: ['intrinsic', 'width', 'equal size', 'sizing'],
    difficulty: WidgetDifficulty.advanced,
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
    whenToUse:
        'Use LimitedBox to cap a child\'s size only when the parent provides '
        'unbounded constraints, such as a box inside a scroll view. Use '
        'ConstrainedBox when you want limits to apply regardless of the parent.',
    commonPitfalls: [
      'Its limits are ignored when the parent already provides bounded '
          'constraints, which surprises people expecting a hard max.',
      'It is meant to prevent unbounded-size errors in scrollables, not as a '
          'general-purpose max-size widget.',
    ],
    relatedWidgets: ['ConstrainedBox', 'SizedBox', 'UnconstrainedBox'],
    docsUrl: 'https://api.flutter.dev/flutter/widgets/LimitedBox-class.html',
    tags: ['limit', 'constraints', 'unbounded', 'sizing'],
    difficulty: WidgetDifficulty.advanced,
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
    whenToUse:
        'Use SizedOverflowBox when the box should report a fixed size to its '
        'parent while letting the child be laid out (and overflow) under the '
        'original constraints. Use OverflowBox when you also want to change the '
        'child\'s constraints, or SizedBox for a plain fixed size.',
    commonPitfalls: [
      'The child is not clipped, so content larger than the declared size paints '
          'over neighbors.',
      'Its own size is fixed by the size parameter and does not grow with the '
          'child, which can hide overflow during layout.',
    ],
    relatedWidgets: ['OverflowBox', 'SizedBox', 'UnconstrainedBox'],
    docsUrl:
        'https://api.flutter.dev/flutter/widgets/SizedOverflowBox-class.html',
    tags: ['overflow', 'sizing', 'constraints'],
    difficulty: WidgetDifficulty.advanced,
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
    whenToUse:
        'Use UnconstrainedBox to let a child size itself to its natural size, '
        'ignoring tight constraints from the parent. Use ConstrainedBox or '
        'LimitedBox instead when you want to impose, not remove, constraints.',
    commonPitfalls: [
      'If the child is larger than the parent it overflows and shows the '
          'overflow warning unless constrainedAxis is used.',
      'Removing constraints can make layout behavior unpredictable, so use it '
          'sparingly and prefer more targeted sizing widgets.',
    ],
    relatedWidgets: ['ConstrainedBox', 'LimitedBox', 'OverflowBox'],
    docsUrl:
        'https://api.flutter.dev/flutter/widgets/UnconstrainedBox-class.html',
    tags: ['unconstrained', 'constraints', 'sizing'],
    difficulty: WidgetDifficulty.advanced,
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
    whenToUse:
        'Use Positioned inside a Stack to pin a child to specific edges or give it '
        'an explicit offset and size. For non-positioned overlapping children, '
        'just place them directly in the Stack and use its alignment.',
    commonPitfalls: [
      'Positioned must be a direct child of a Stack, otherwise it throws a '
          'ParentDataWidget error.',
      'Setting both left and right (or top and bottom) defines the width (or '
          'height), so adding an explicit width then conflicts.',
    ],
    relatedWidgets: ['Stack', 'Align', 'IndexedStack'],
    docsUrl: 'https://api.flutter.dev/flutter/widgets/Positioned-class.html',
    tags: ['positioned', 'stack', 'absolute', 'overlay'],
    difficulty: WidgetDifficulty.intermediate,
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
    whenToUse:
        'Use ListBody to stack children along an axis inside a scroll view, where '
        'they take unbounded main-axis space. For most cases a Column or a '
        'lazily-built ListView is the better choice.',
    commonPitfalls: [
      'ListBody requires unbounded space on its main axis, so it must live inside '
          'a scrollable; otherwise it throws an unbounded-constraints error.',
      'Unlike ListView it is not lazy and builds all children at once, so it is '
          'unsuitable for long lists.',
    ],
    relatedWidgets: ['ListView', 'Column', 'SingleChildScrollView'],
    docsUrl: 'https://api.flutter.dev/flutter/widgets/ListBody-class.html',
    tags: ['listbody', 'scroll', 'sequential', 'axis'],
    difficulty: WidgetDifficulty.intermediate,
    // ListBody requires unbounded space along its main axis, so it must live
    // inside a scrollable. A bounded SizedBox caps the visible preview height.
    builder: (context) => SizedBox(
      height: 160,
      child: SingleChildScrollView(
        child: Container(
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
    whenToUse:
        'Use CustomSingleChildLayout when one child needs custom sizing or '
        'positioning logic that the standard widgets cannot express (e.g. a popup '
        'aligned to an anchor). For multiple children use CustomMultiChildLayout.',
    commonPitfalls: [
      'You must implement shouldRelayout correctly or the layout will not update '
          'when the delegate\'s inputs change.',
      'The delegate must return a size within the incoming constraints, otherwise '
          'layout asserts.',
    ],
    relatedWidgets: ['CustomMultiChildLayout', 'LayoutBuilder', 'Align'],
    docsUrl:
        'https://api.flutter.dev/flutter/widgets/CustomSingleChildLayout-class.html',
    tags: ['custom layout', 'delegate', 'single child', 'advanced'],
    difficulty: WidgetDifficulty.advanced,
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
    whenToUse:
        'Use OverflowBar for a set of buttons (such as dialog actions) that should '
        'sit in a row but fall back to a column when they do not fit. Use Wrap for '
        'general content that should flow across multiple lines.',
    commonPitfalls: [
      'It switches entirely to a column when any overflow occurs, rather than '
          'wrapping item-by-item like Wrap.',
      'spacing applies in row mode and overflowSpacing in column mode; setting '
          'only one leaves the other layout without gaps.',
    ],
    relatedWidgets: ['Wrap', 'Row', 'Column'],
    docsUrl: 'https://api.flutter.dev/flutter/widgets/OverflowBar-class.html',
    tags: ['overflowbar', 'buttons', 'actions', 'responsive'],
    difficulty: WidgetDifficulty.intermediate,
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
    whenToUse:
        'Use CustomMultiChildLayout when several children need bespoke, '
        'interdependent positioning that Stack/Flex cannot express. For a single '
        'child use CustomSingleChildLayout, and prefer standard widgets when they '
        'suffice.',
    commonPitfalls: [
      'Each child must be wrapped in a LayoutId with a unique id, and the delegate '
          'must lay out every child exactly once.',
      'Implement shouldRelayout correctly so the layout updates when the '
          'delegate\'s inputs change.',
    ],
    relatedWidgets: ['CustomSingleChildLayout', 'Stack', 'Flow'],
    docsUrl:
        'https://api.flutter.dev/flutter/widgets/CustomMultiChildLayout-class.html',
    tags: ['custom layout', 'delegate', 'multi child', 'advanced'],
    difficulty: WidgetDifficulty.advanced,
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
    whenToUse:
        'Use GridTile to give a grid cell an optional header and/or footer '
        '(typically a GridTileBar) over its content, as in a photo gallery. For '
        'a plain cell, put your content directly in the GridView.',
    commonPitfalls: [
      'GridTile does not size itself; it relies on the parent (usually a '
          'GridView cell) for its dimensions.',
      'The header and footer overlay the child, so content near the top/bottom '
          'edges can be obscured by the GridTileBar.',
    ],
    relatedWidgets: ['GridTileBar', 'GridView'],
    docsUrl: 'https://api.flutter.dev/flutter/widgets/GridTile-class.html',
    tags: ['grid', 'tile', 'header', 'footer', 'gallery'],
    difficulty: WidgetDifficulty.intermediate,
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
    whenToUse:
        'Use OrientationBuilder to switch layouts between portrait and landscape '
        'based on the parent\'s aspect ratio. Use LayoutBuilder when you need exact '
        'constraints, or MediaQuery.orientation for the device orientation.',
    commonPitfalls: [
      'Orientation here is derived from the parent\'s available width vs height, '
          'not the physical device orientation, so a narrow parent reads as '
          'portrait even in landscape.',
      'The builder runs during layout, so avoid triggering side-effects or '
          'setState from within it.',
    ],
    relatedWidgets: ['LayoutBuilder', 'MediaQuery', 'GridView'],
    docsUrl:
        'https://api.flutter.dev/flutter/widgets/OrientationBuilder-class.html',
    tags: ['orientation', 'responsive', 'portrait', 'landscape'],
    difficulty: WidgetDifficulty.intermediate,
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
