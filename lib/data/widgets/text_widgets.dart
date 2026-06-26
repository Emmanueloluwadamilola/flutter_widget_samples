import 'package:flutter/material.dart';
import '../../models/widget_info.dart';

final List<WidgetInfo> textWidgets = [
  WidgetInfo(
    name: 'Text',
    description: 'A run of text with a single style.',
    category: WidgetCategory.text,
    whenToUse:
        'Your default choice for displaying a string. Reach for it whenever a '
        'single style covers the whole string; only step up to RichText / '
        'Text.rich when different spans need different styling.',
    commonPitfalls: [
      'A long Text inside an unbounded-width parent (e.g. a Row) can overflow. '
          'Wrap it in Expanded or Flexible, or set softWrap/overflow.',
      'Passing a null string throws — use an empty string or a conditional.',
    ],
    relatedWidgets: ['RichText', 'Text.rich', 'DefaultTextStyle'],
    docsUrl: 'https://api.flutter.dev/flutter/widgets/Text-class.html',
    tags: ['label', 'string', 'typography', 'font'],
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
    whenToUse:
        'When one paragraph mixes multiple styles (bold words, colored links, '
        'inline icons). For most cases prefer Text.rich, which is the same '
        'thing with a friendlier API and DefaultTextStyle inheritance.',
    commonPitfalls: [
      'RichText does NOT inherit DefaultTextStyle, so the root TextSpan needs '
          'an explicit style or text renders with the fallback style.',
      'Every TextSpan child must be a TextSpan/WidgetSpan — not a Text widget.',
    ],
    relatedWidgets: ['Text.rich', 'Text'],
    docsUrl: 'https://api.flutter.dev/flutter/widgets/RichText-class.html',
    tags: ['span', 'mixed style', 'inline', 'paragraph'],
    difficulty: WidgetDifficulty.intermediate,
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
    whenToUse:
        'When the user needs to copy a single piece of text (an ID, an error '
        'code, an address). To make a whole subtree selectable at once, use '
        'SelectionArea instead of wrapping each line.',
    commonPitfalls: [
      'It is more expensive than Text — do not use it for every label.',
      'Like Text, it can overflow in unbounded width; constrain its parent.',
    ],
    relatedWidgets: ['Text', 'SelectionArea'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/SelectableText-class.html',
    tags: ['copy', 'selection', 'clipboard'],
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
    whenToUse:
        'To set a shared style for many Text widgets in a subtree without '
        'repeating the same TextStyle on each one. Theme-level typography is '
        'usually better app-wide; reach for DefaultTextStyle for a local group.',
    commonPitfalls: [
      'Only affects Text/Text.rich descendants — RichText ignores it.',
      'A descendant Text with its own style overrides it completely (styles do '
          'not merge unless you opt in with style.merge).',
    ],
    relatedWidgets: ['Text', 'RichText'],
    docsUrl:
        'https://api.flutter.dev/flutter/widgets/DefaultTextStyle-class.html',
    tags: ['inherit', 'style', 'theme', 'typography'],
    difficulty: WidgetDifficulty.intermediate,
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
    whenToUse:
        'To make an entire region selectable in one gesture — the user can drag '
        'across many Text widgets at once, like selecting text on a web page. '
        'Prefer this over many individual SelectableText widgets.',
    commonPitfalls: [
      'Requires a Material/Overlay ancestor for the selection toolbar; inside '
          'MaterialApp this is already provided.',
      'Nesting SelectionArea inside another SelectionArea is redundant.',
    ],
    relatedWidgets: ['SelectableText', 'Text'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/SelectionArea-class.html',
    tags: ['selection', 'copy', 'drag select'],
    difficulty: WidgetDifficulty.intermediate,
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
    whenToUse:
        'The recommended way to render mixed-style text. Same capability as '
        'RichText but it inherits DefaultTextStyle and uses the standard Text '
        'API, so it is less error-prone.',
    commonPitfalls: [
      'Children must be TextSpan or WidgetSpan; use WidgetSpan to embed a '
          'widget (e.g. an icon) inline with text.',
    ],
    relatedWidgets: ['RichText', 'Text'],
    docsUrl: 'https://api.flutter.dev/flutter/widgets/Text/Text.rich.html',
    tags: ['span', 'mixed style', 'inline', 'widgetspan'],
    difficulty: WidgetDifficulty.intermediate,
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
