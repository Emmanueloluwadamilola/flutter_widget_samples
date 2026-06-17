import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import '../../models/widget_info.dart';

final List<WidgetInfo> paintingWidgets = [
  WidgetInfo(
    name: 'CustomPaint',
    description:
        'A widget that provides a canvas on which to draw during the paint phase.',
    category: WidgetCategory.painting,
    builder: (context) => CustomPaint(
      painter: _SkyPainter(),
      child: const SizedBox(
        width: 200,
        height: 200,
        child: Center(
          child: Text('Custom Paint', style: TextStyle(color: Colors.white)),
        ),
      ),
    ),
    codeSnippet: '''
CustomPaint(
  painter: _SkyPainter(),
  child: const SizedBox(
    width: 200,
    height: 200,
    child: Center(child: Text('Custom Paint')),
  ),
)

class _SkyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;
    const RadialGradient gradient = RadialGradient(
      center: Alignment(0.7, -0.6),
      radius: 0.2,
      colors: <Color>[Color(0xFFFFFF00), Color(0xFF0099FF)],
      stops: <double>[0.4, 1.0],
    );
    canvas.drawRect(
      rect,
      Paint()..shader = gradient.createShader(rect),
    );
  }

  @override
  bool shouldRepaint(_SkyPainter oldDelegate) => false;
}
''',
  ),
  WidgetInfo(
    name: 'BackdropFilter',
    description:
        'A widget that applies a filter to the existing painted content and then paints the child.',
    category: WidgetCategory.painting,
    builder: (context) => Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Text('0' * 100),
        Center(
          child: ClipRect(
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                alignment: Alignment.center,
                width: 200.0,
                height: 200.0,
                child: const Text('Hello World'),
              ),
            ),
          ),
        ),
      ],
    ),
    codeSnippet: '''
// Requires import 'dart:ui';
BackdropFilter(
  filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
  child: Container(
    alignment: Alignment.center,
    width: 200.0,
    height: 200.0,
    child: const Text('Hello World'),
  ),
)
''',
  ),
  WidgetInfo(
    name: 'ClipRect',
    description: 'A widget that clips its child using a rectangle.',
    category: WidgetCategory.painting,
    builder: (context) => ClipRect(
      child: Align(
        alignment: Alignment.topCenter,
        heightFactor: 0.5,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.red,
          child: const Center(child: Text('Clipped')),
        ),
      ),
    ),
    codeSnippet: '''
ClipRect(
  child: Align(
    alignment: Alignment.topCenter,
    heightFactor: 0.5,
    child: Container(
      width: 100,
      height: 100,
      color: Colors.red,
      child: const Center(child: Text('Clipped')),
    ),
  ),
)
''',
  ),
  WidgetInfo(
    name: 'ClipRRect',
    description: 'A widget that clips its child using a rounded rectangle.',
    category: WidgetCategory.painting,
    builder: (context) => ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        width: 100,
        height: 100,
        color: Colors.blue,
        child: const Center(child: Text('Rounded')),
      ),
    ),
    codeSnippet: '''
ClipRRect(
  borderRadius: BorderRadius.circular(20.0),
  child: Container(
    width: 100,
    height: 100,
    color: Colors.blue,
    child: const Center(child: Text('Rounded')),
  ),
)
''',
  ),
  WidgetInfo(
    name: 'ClipOval',
    description: 'A widget that clips its child using an oval.',
    category: WidgetCategory.painting,
    builder: (context) => ClipOval(
      child: Container(
        width: 100,
        height: 80,
        color: Colors.green,
        child: const Center(child: Text('Oval')),
      ),
    ),
    codeSnippet: '''
ClipOval(
  child: Container(
    width: 100,
    height: 80,
    color: Colors.green,
    child: const Center(child: Text('Oval')),
  ),
)
''',
  ),
  WidgetInfo(
    name: 'Transform',
    description:
        'A widget that applies a transformation before painting its child.',
    category: WidgetCategory.painting,
    builder: (context) => Transform.rotate(
      angle: 0.5,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.purple,
        child: const Center(child: Text('Rotated')),
      ),
    ),
    codeSnippet: '''
Transform.rotate(
  angle: 0.5,
  child: Container(
    width: 100,
    height: 100,
    color: Colors.purple,
    child: const Center(child: Text('Rotated')),
  ),
)
''',
  ),
  WidgetInfo(
    name: 'RotatedBox',
    description:
        'A widget that rotates its child by a integral number of quarter turns.',
    category: WidgetCategory.painting,
    builder: (context) =>
        const RotatedBox(quarterTurns: 1, child: Text('Rotated Box')),
    codeSnippet: '''
RotatedBox(
  quarterTurns: 1,
  child: Text('Rotated Box'),
)
''',
  ),
  WidgetInfo(
    name: 'FractionalTranslation',
    description:
        'A widget that applies a translation expressed as a fraction of the box\'s size before painting its child.',
    category: WidgetCategory.painting,
    builder: (context) => Container(
      color: Colors.grey[300],
      width: 100,
      height: 100,
      child: FractionalTranslation(
        translation: const Offset(0.5, 0.5),
        child: Container(
          color: Colors.blue,
          width: 50,
          height: 50,
          child: const Center(
            child: Text(
              'Moved',
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
        ),
      ),
    ),
    codeSnippet: '''
Container(
  color: Colors.grey[300],
  width: 100,
  height: 100,
  child: FractionalTranslation(
    translation: const Offset(0.5, 0.5),
    child: Container(
      color: Colors.blue,
      width: 50,
      height: 50,
      child: const Center(child: Text('Moved')),
    ),
  ),
)
''',
  ),
  WidgetInfo(
    name: 'PhysicalShape',
    description: 'A widget that clips its child to a shape and casts a shadow.',
    category: WidgetCategory.painting,
    builder: (context) => PhysicalShape(
      elevation: 5.0,
      clipper: const ShapeBorderClipper(shape: CircleBorder()),
      color: Colors.orange,
      child: const SizedBox(
        width: 100,
        height: 100,
        child: Center(child: Text('Shape')),
      ),
    ),
    codeSnippet: '''
PhysicalShape(
  elevation: 5.0,
  clipper: const ShapeBorderClipper(shape: CircleBorder()),
  color: Colors.orange,
  child: const SizedBox(
    width: 100,
    height: 100,
    child: Center(child: Text('Shape')),
  ),
)
''',
  ),
  WidgetInfo(
    name: 'GridPaper',
    description: 'A widget that draws a rectilinear grid of lines.',
    category: WidgetCategory.painting,
    builder: (context) => Container(
      color: Colors.white,
      width: 200,
      height: 200,
      child: const GridPaper(
        color: Colors.blue,
        divisions: 2,
        subdivisions: 2,
        interval: 100,
      ),
    ),
    codeSnippet: '''
GridPaper(
  color: Colors.blue,
  divisions: 2,
  subdivisions: 2,
  interval: 100,
)
''',
  ),
];

class _SkyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;
    const RadialGradient gradient = RadialGradient(
      center: Alignment(0.7, -0.6),
      radius: 0.2,
      colors: <Color>[Color(0xFFFFFF00), Color(0xFF0099FF)],
      stops: <double>[0.4, 1.0],
    );
    canvas.drawRect(rect, Paint()..shader = gradient.createShader(rect));
  }

  @override
  bool shouldRepaint(_SkyPainter oldDelegate) => false;
}

// ─────────────────────────────────────────────────────────────────────────────
// AUDIT BATCH 5 – Painting Widgets (Extra)
// ─────────────────────────────────────────────────────────────────────────────

final List<WidgetInfo> paintingWidgetsExtra = [
  WidgetInfo(
    name: 'RawImage',
    description: 'A widget that displays a dart:ui.Image directly.',
    category: WidgetCategory.painting,
    builder: (context) => const _RawImageSample(),
    codeSnippet: '''
RawImage(
  image: uiImage, // dart:ui.Image
  width: 300,
  height: 300,
  fit: BoxFit.cover,
)
''',
  ),
];

class _RawImageSample extends StatefulWidget {
  const _RawImageSample();

  @override
  State<_RawImageSample> createState() => _RawImageSampleState();
}

class _RawImageSampleState extends State<_RawImageSample> {
  ui.Image? _image;

  @override
  void initState() {
    super.initState();
    _generateImage();
  }

  Future<void> _generateImage() async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder, const Rect.fromLTWH(0, 0, 200, 200));
    final paint = Paint()..color = Colors.blue;
    canvas.drawCircle(const Offset(100, 100), 80, paint);

    final picture = recorder.endRecording();
    final img = await picture.toImage(200, 200);
    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'RawImage displaying a dart:ui.Image generated on the fly:',
          ),
          const SizedBox(height: 20),
          if (_image != null)
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: RawImage(image: _image, width: 200, height: 200),
            )
          else
            const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
