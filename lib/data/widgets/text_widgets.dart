import 'package:flutter/material.dart';
import '../../models/widget_info.dart';

final List<WidgetInfo> textWidgets = [
  WidgetInfo(
    name: 'Text',
    description: 'A run of text with a single style.',
    category: WidgetCategory.text,
    builder: (context) => const Text(
      'Hello, Flutter!',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.deepPurple,
      ),
    ),
    codeSnippet: '''
Text(
  'Hello, Flutter!',
  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple),
)
''',
  ),
  WidgetInfo(
    name: 'RichText',
    description: 'A paragraph of mixed-style text.',
    category: WidgetCategory.text,
    builder: (context) => RichText(
      text: const TextSpan(
        text: 'Hello ',
        style: TextStyle(color: Colors.black, fontSize: 18),
        children: [
          TextSpan(
            text: 'bold',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(text: ' world!'),
        ],
      ),
    ),
    codeSnippet: '''
RichText(
  text: const TextSpan(
    text: 'Hello ',
    style: TextStyle(color: Colors.black, fontSize: 18),
    children: [
      TextSpan(text: 'bold', style: TextStyle(fontWeight: FontWeight.bold)),
      TextSpan(text: ' world!'),
    ],
  ),
)
''',
  ),
  WidgetInfo(
    name: 'SelectableText',
    description: 'A run of text with a single style that can be selected.',
    category: WidgetCategory.text,
    builder: (context) => const SelectableText(
      'You can select this text by long pressing.',
      style: TextStyle(fontSize: 18),
      showCursor: true,
      cursorColor: Colors.red,
    ),
    codeSnippet: '''
SelectableText(
  'You can select this text by long pressing.',
  style: TextStyle(fontSize: 18),
  showCursor: true,
  cursorColor: Colors.red,
)
''',
  ),
  WidgetInfo(
    name: 'DefaultTextStyle',
    description:
        'The text style to apply to descendant Text widgets which don\'t have an explicit style.',
    category: WidgetCategory.text,
    builder: (context) => DefaultTextStyle(
      style: const TextStyle(fontSize: 20, color: Colors.blue),
      child: Column(
        children: const [
          Text('I inherit the style'),
          Text('Me too'),
          Text('But I override it', style: TextStyle(color: Colors.red)),
        ],
      ),
    ),
    codeSnippet: '''
DefaultTextStyle(
  style: const TextStyle(fontSize: 20, color: Colors.blue),
  child: Column(
    children: const [
      Text('I inherit the style'),
      Text('Me too'),
      Text('But I override it', style: TextStyle(color: Colors.red)),
    ],
  ),
)
''',
  ),
  WidgetInfo(
    name: 'SelectionArea',
    description: 'A widget that enables selection for its children.',
    category: WidgetCategory.text,
    builder: (context) => const SelectionArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Selectable text'),
          Text('More selectable text'),
          Text('Even more selectable text'),
        ],
      ),
    ),
    codeSnippet: '''
SelectionArea(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text('Selectable text'),
      Text('More selectable text'),
      Text('Even more selectable text'),
    ],
  ),
)
''',
  ),
  WidgetInfo(
    name: 'Text.rich',
    description: 'Creates a text widget with a TextSpan.',
    category: WidgetCategory.text,
    builder: (context) => const Text.rich(
      TextSpan(
        text: 'Flutter ',
        style: TextStyle(fontSize: 20, color: Colors.black),
        children: [
          TextSpan(
            text: 'is ',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          TextSpan(
            text: 'awesome!',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ],
      ),
    ),
    codeSnippet: '''
Text.rich(
  TextSpan(
    text: 'Flutter ',
    style: TextStyle(fontSize: 20, color: Colors.black),
    children: [
      TextSpan(
        text: 'is ',
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
      TextSpan(
        text: 'awesome!',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
      ),
    ],
  ),
)
''',
  ),
];
