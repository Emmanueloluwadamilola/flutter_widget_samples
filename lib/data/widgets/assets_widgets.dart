import 'package:flutter/material.dart';
import '../../models/widget_info.dart';

final List<WidgetInfo> assetsWidgets = [
  WidgetInfo(
    name: 'Image',
    description: 'A widget that displays an image.',
    category: WidgetCategory.assets,
    builder: (context) => Image.network(
      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const Center(child: CircularProgressIndicator());
      },
      errorBuilder: (context, error, stackTrace) =>
          const Icon(Icons.error, size: 50, color: Colors.red),
    ),
    codeSnippet: '''
Image.network(
  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
  loadingBuilder: (context, child, loadingProgress) {
    if (loadingProgress == null) return child;
    return const Center(child: CircularProgressIndicator());
  },
)
''',
  ),
  WidgetInfo(
    name: 'Icon',
    description:
        'A graphical icon widget drawn with a glyph from a font described in an IconData.',
    category: WidgetCategory.assets,
    builder: (context) => const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Icon(Icons.favorite, color: Colors.pink, size: 24.0),
        Icon(Icons.audiotrack, color: Colors.green, size: 30.0),
        Icon(Icons.beach_access, color: Colors.blue, size: 36.0),
      ],
    ),
    codeSnippet: '''
Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: <Widget>[
    Icon(Icons.favorite, color: Colors.pink, size: 24.0),
    Icon(Icons.audiotrack, color: Colors.green, size: 30.0),
    Icon(Icons.beach_access, color: Colors.blue, size: 36.0),
  ],
)
''',
  ),
  WidgetInfo(
    name: 'FlutterLogo',
    description:
        'The Flutter logo, in widget form. This widget respects the IconTheme.',
    category: WidgetCategory.assets,
    builder: (context) => const FlutterLogo(size: 100),
    codeSnippet: '''
FlutterLogo(size: 100)
''',
  ),
  WidgetInfo(
    name: 'CircleAvatar',
    description: 'A circle that represents a user.',
    category: WidgetCategory.assets,
    builder: (context) => const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(backgroundColor: Colors.blue, child: Text('AH')),
        CircleAvatar(
          backgroundColor: Colors.green,
          radius: 30,
          child: Icon(Icons.person),
        ),
      ],
    ),
    codeSnippet: '''
CircleAvatar(
  backgroundColor: Colors.blue,
  child: Text('AH'),
)
''',
  ),
  WidgetInfo(
    name: 'ImageIcon',
    description: 'A widget that displays an icon from an ImageProvider.',
    category: WidgetCategory.assets,
    builder: (context) => const ImageIcon(
      NetworkImage(
        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
      ),
      size: 50,
      color: Colors.blue,
    ),
    codeSnippet: '''
ImageIcon(
  NetworkImage(
    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
  ),
  size: 50,
  color: Colors.blue,
)
''',
  ),
];
