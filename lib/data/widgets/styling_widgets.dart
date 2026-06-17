import 'package:flutter/material.dart';
import '../../models/widget_info.dart';

final List<WidgetInfo> stylingWidgets = [
  WidgetInfo(
    name: 'DecoratedBox',
    description:
        'A widget that paints a Decoration either before or after its child paints.',
    category: WidgetCategory.styling,
    builder: (context) => const DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.blue, Colors.purple]),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: SizedBox(
        width: 100,
        height: 100,
        child: Center(
          child: Text('Gradient', style: TextStyle(color: Colors.white)),
        ),
      ),
    ),
    codeSnippet: '''
DecoratedBox(
  decoration: BoxDecoration(
    gradient: LinearGradient(colors: [Colors.blue, Colors.purple]),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  child: SizedBox(
    width: 100,
    height: 100,
    child: Center(child: Text('Gradient', style: TextStyle(color: Colors.white))),
  ),
)
''',
  ),
  WidgetInfo(
    name: 'ClipPath',
    description: 'A widget that clips its child using a path.',
    category: WidgetCategory.styling,
    builder: (context) => ClipPath(
      clipper: _TriangleClipper(),
      child: Container(
        width: 100,
        height: 100,
        color: Colors.red,
        child: const Center(child: Text('Triangle')),
      ),
    ),
    codeSnippet: '''
ClipPath(
  clipper: _TriangleClipper(),
  child: Container(
    width: 100,
    height: 100,
    color: Colors.red,
    child: const Center(child: Text('Triangle')),
  ),
)

class _TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
''',
  ),
  WidgetInfo(
    name: 'Theme',
    description: 'Applies a theme to descendant widgets.',
    category: WidgetCategory.styling,
    builder: (context) => Theme(
      data: ThemeData(
        primarySwatch: Colors.green,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 20, color: Colors.green),
        ),
      ),
      child: Builder(
        builder: (context) => Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Themed Text',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Themed Button'),
              ),
            ],
          ),
        ),
      ),
    ),
    codeSnippet: '''
Theme(
  data: ThemeData(
    primarySwatch: Colors.green,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 20, color: Colors.green),
    ),
  ),
  child: Text('Themed Text'),
)
''',
  ),
  WidgetInfo(
    name: 'ColoredBox',
    description: 'A widget that paints its area with a specified Color.',
    category: WidgetCategory.styling,
    builder: (context) => const ColoredBox(
      color: Colors.amber,
      child: SizedBox(
        width: 100,
        height: 100,
        child: Center(child: Text('Colored Box')),
      ),
    ),
    codeSnippet: '''
ColoredBox(
  color: Colors.amber,
  child: SizedBox(
    width: 100,
    height: 100,
    child: Center(child: Text('Colored Box')),
  ),
)
''',
  ),
  WidgetInfo(
    name: 'SizedBox.expand',
    description:
        'Creates a box that will become as large as its parent allows.',
    category: WidgetCategory.styling,
    builder: (context) => Container(
      width: 200,
      height: 100,
      color: Colors.grey[300],
      child: SizedBox.expand(
        child: Container(
          color: Colors.blue.withValues(alpha: 0.5),
          child: const Center(child: Text('Expanded')),
        ),
      ),
    ),
    codeSnippet: '''
SizedBox.expand(
  child: Container(
    color: Colors.blue,
    child: const Center(child: Text('Expanded')),
  ),
)
''',
  ),
  WidgetInfo(
    name: 'MediaQuery',
    description:
        'Establishes a subtree in which media queries resolve to the given data.',
    category: WidgetCategory.styling,
    builder: (context) => const _MediaQuerySample(),
    codeSnippet: '''
class _MediaQuerySample extends StatelessWidget {
  const _MediaQuerySample();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var orientation = MediaQuery.of(context).orientation;

    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.blue.shade100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Size: \${size.width.toStringAsFixed(1)} x \${size.height.toStringAsFixed(1)}'),
          const SizedBox(height: 8),
          Text('Orientation: \$orientation'),
        ],
      ),
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'IconTheme',
    description:
        'Controls the default color, opacity, and size of icons in a widget subtree.',
    category: WidgetCategory.styling,
    builder: (context) => const IconTheme(
      data: IconThemeData(color: Colors.red, size: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [Icon(Icons.favorite), Icon(Icons.star), Icon(Icons.person)],
      ),
    ),
    codeSnippet: '''
IconTheme(
  data: const IconThemeData(color: Colors.red, size: 40),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: const [
      Icon(Icons.favorite),
      Icon(Icons.star),
      Icon(Icons.person),
    ],
  ),
)
''',
  ),
  WidgetInfo(
    name: 'PhysicalModel',
    description:
        'A widget that represents a physical layer that clips its children.',
    category: WidgetCategory.styling,
    builder: (context) => const PhysicalModel(
      color: Colors.blue,
      elevation: 8.0,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: SizedBox(
        width: 100,
        height: 100,
        child: Center(
          child: Text(
            'Physical\nModel',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ),
    codeSnippet: '''
PhysicalModel(
  color: Colors.blue,
  elevation: 8.0,
  shadowColor: Colors.black,
  borderRadius: const BorderRadius.all(Radius.circular(20)),
  child: const SizedBox(
    width: 100,
    height: 100,
    child: Center(
      child: Text(
        'Physical\\nModel',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
    ),
  ),
)
''',
  ),
];

class _MediaQuerySample extends StatelessWidget {
  const _MediaQuerySample();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var orientation = MediaQuery.of(context).orientation;

    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.blue.shade100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Size: ${size.width.toStringAsFixed(1)} x ${size.height.toStringAsFixed(1)}',
          ),
          const SizedBox(height: 8),
          Text('Orientation: $orientation'),
        ],
      ),
    );
  }
}

class _TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
