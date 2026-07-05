import 'package:flutter/material.dart';
import '../../models/widget_info.dart';

final List<WidgetInfo> inputWidgets = [
  WidgetInfo(
    name: 'TextField',
    description: 'A text input field.',
    category: WidgetCategory.input,
    whenToUse:
        'When you need standalone single- or multi-line text input. If you '
        'need validation and grouping with other fields, use TextFormField '
        'inside a Form instead.',
    commonPitfalls: [
      'TextEditingControllers and FocusNodes you create must be disposed in '
          'dispose() or you will leak memory.',
      'Reading the value via onChanged and rebuilding from a controller at the '
          'same time can fight each other; pick one source of truth.',
      'Unbounded width: wrap in a SizedBox or Expanded, or it may try to take '
          'infinite width inside a Row.',
    ],
    relatedWidgets: ['Form', 'FormField', 'CupertinoTextField', 'Autocomplete'],
    docsUrl: 'https://api.flutter.dev/flutter/material/TextField-class.html',
    tags: ['text', 'input', 'form', 'keyboard'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => const SizedBox(
      width: 300,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Enter your name',
        ),
      ),
    ),
    codeSnippet: '''
TextField(
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Enter your name',
  ),
)
''',
  ),
  WidgetInfo(
    name: 'Checkbox',
    description: 'A material design checkbox.',
    category: WidgetCategory.input,
    whenToUse:
        'When the user toggles an independent boolean option. For a checkbox '
        'with a label row use CheckboxListTile instead.',
    commonPitfalls: [
      'Checkbox is controlled: it does not change itself. You must update state '
          'in onChanged and rebuild, or it appears frozen.',
      'value can be null only when tristate is true.',
    ],
    relatedWidgets: ['CheckboxListTile', 'Switch', 'Radio'],
    docsUrl: 'https://api.flutter.dev/flutter/material/Checkbox-class.html',
    tags: ['toggle', 'boolean', 'form', 'selection'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => const _CheckboxSample(),
    codeSnippet: '''
class _CheckboxSample extends StatefulWidget {
  const _CheckboxSample();

  @override
  State<_CheckboxSample> createState() => _CheckboxSampleState();
}

class _CheckboxSampleState extends State<_CheckboxSample> {
  bool _checked = true;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: _checked,
      onChanged: (bool? value) => setState(() => _checked = value ?? false),
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'Radio',
    description: 'A material design radio button.',
    category: WidgetCategory.input,
    whenToUse:
        'When the user must pick exactly one option from a small, mutually '
        'exclusive set. For more than a handful of options prefer DropdownButton; '
        'for a labeled row use RadioListTile.',
    commonPitfalls: [
      'Radios are mutually exclusive only if they share the same groupValue; in '
          'current Flutter wrap them in a RadioGroup that owns the value and '
          'onChanged.',
      'Like Checkbox, a Radio will not visually update unless you rebuild with '
          'the new selected value.',
    ],
    relatedWidgets: ['RadioListTile', 'Checkbox', 'SegmentedButton', 'Switch'],
    docsUrl: 'https://api.flutter.dev/flutter/material/Radio-class.html',
    tags: ['selection', 'single-choice', 'form', 'radio'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => const _RadioSample(),
    codeSnippet: '''
class _RadioSample extends StatefulWidget {
  const _RadioSample();

  @override
  State<_RadioSample> createState() => _RadioSampleState();
}

class _RadioSampleState extends State<_RadioSample> {
  int _selected = 1;

  @override
  Widget build(BuildContext context) {
    return RadioGroup<int>(
      groupValue: _selected,
      onChanged: (int? value) =>
          setState(() => _selected = value ?? _selected),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Radio<int>(value: 1),
          Text('Option 1'),
          SizedBox(width: 16),
          Radio<int>(value: 2),
          Text('Option 2'),
        ],
      ),
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'Switch',
    description: 'A material design switch.',
    category: WidgetCategory.input,
    whenToUse:
        'When the user toggles an on/off setting that takes effect immediately. '
        'For a labeled row use SwitchListTile; for an instant binary that is '
        'submitted with a form, prefer Checkbox.',
    commonPitfalls: [
      'Switch is controlled: it will not move unless you update state in '
          'onChanged and rebuild.',
      'onChanged takes a non-nullable bool (unlike Checkbox); passing null to '
          'onChanged disables it.',
    ],
    relatedWidgets: ['SwitchListTile', 'Checkbox', 'CupertinoSwitch'],
    docsUrl: 'https://api.flutter.dev/flutter/material/Switch-class.html',
    tags: ['toggle', 'boolean', 'setting', 'on-off'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => const _SwitchSample(),
    codeSnippet: '''
class _SwitchSample extends StatefulWidget {
  const _SwitchSample();

  @override
  State<_SwitchSample> createState() => _SwitchSampleState();
}

class _SwitchSampleState extends State<_SwitchSample> {
  bool _on = true;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _on,
      onChanged: (bool value) => setState(() => _on = value),
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'Slider',
    description: 'A material design slider.',
    category: WidgetCategory.input,
    whenToUse:
        'When the user picks a single value from a continuous or stepped range, '
        'such as volume or brightness. For selecting a span between two values '
        'use RangeSlider.',
    commonPitfalls: [
      'value must stay within min and max (defaults 0.0 to 1.0) or it throws; '
          'scale your data to match.',
      'Slider is controlled: store value in state and update it in onChanged.',
      'Set divisions to snap to discrete steps and to show a label.',
    ],
    relatedWidgets: ['RangeSlider', 'CupertinoSlider'],
    docsUrl: 'https://api.flutter.dev/flutter/material/Slider-class.html',
    tags: ['slider', 'range', 'value', 'continuous'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => const _SliderSample(),
    codeSnippet: '''
class _SliderSample extends StatefulWidget {
  const _SliderSample();

  @override
  State<_SliderSample> createState() => _SliderSampleState();
}

class _SliderSampleState extends State<_SliderSample> {
  double _value = 0.5;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _value,
      onChanged: (double value) => setState(() => _value = value),
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'DropdownButton',
    description: 'A material design button for selecting from a list of items.',
    category: WidgetCategory.input,
    whenToUse:
        'When the user picks one option from a moderate list that is better '
        'hidden until tapped. For a few options consider Radio or '
        'SegmentedButton; for a Material 3 menu with text field use DropdownMenu '
        'or DropdownButtonFormField inside a Form.',
    commonPitfalls: [
      'The current value must exactly equal one of the items values (by ==) or '
          'it asserts; null is only allowed when an item has a null value.',
      'It is controlled: update the selected value in onChanged and rebuild.',
      'All DropdownMenuItem values should be unique.',
    ],
    relatedWidgets: [
      'DropdownMenu',
      'DropdownButtonFormField',
      'PopupMenuButton',
      'SegmentedButton',
    ],
    docsUrl:
        'https://api.flutter.dev/flutter/material/DropdownButton-class.html',
    tags: ['dropdown', 'selection', 'menu', 'single-choice'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => const _DropdownButtonSample(),
    codeSnippet: '''
class _DropdownButtonSample extends StatefulWidget {
  const _DropdownButtonSample();

  @override
  State<_DropdownButtonSample> createState() => _DropdownButtonSampleState();
}

class _DropdownButtonSampleState extends State<_DropdownButtonSample> {
  String _value = 'One';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _value,
      items: const <String>['One', 'Two', 'Three', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          })
          .toList(),
      onChanged: (String? newValue) {
        if (newValue != null) setState(() => _value = newValue);
      },
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'Form',
    description:
        'An optional container for grouping together multiple form field widgets.',
    category: WidgetCategory.input,
    whenToUse:
        'When you have several related inputs that should be validated, saved, '
        'or reset together. For a single standalone input, a plain TextField is '
        'simpler.',
    commonPitfalls: [
      'Use a GlobalKey<FormState> to call validate(), save(), or reset(); '
          'recreate the key carefully since storing it in build() defeats it.',
      'Form coordinates FormField descendants (like TextFormField); plain '
          'TextField is not validated by the Form.',
      'autovalidateMode defaults to disabled, so validators only run when you '
          'call validate().',
    ],
    relatedWidgets: ['FormField', 'TextField', 'DropdownButtonFormField'],
    docsUrl: 'https://api.flutter.dev/flutter/widgets/Form-class.html',
    tags: ['form', 'validation', 'input', 'grouping'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => const _FormSample(),
    codeSnippet: '''
class _FormSample extends StatefulWidget {
  const _FormSample();

  @override
  State<_FormSample> createState() => _FormSampleState();
}

class _FormSampleState extends State<_FormSample> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(hintText: 'Enter your email'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'DatePicker',
    description: 'A material design date picker.',
    category: WidgetCategory.input,
    whenToUse:
        'When the user selects a calendar date. Pair it with TimePicker when you '
        'also need a time of day.',
    commonPitfalls: [
      'showDatePicker is an async function returning a Future<DateTime?>; await '
          'it and handle the null returned when the user cancels.',
      'initialDate must fall within firstDate and lastDate or it asserts.',
      'After the await, guard with context.mounted before using BuildContext.',
    ],
    relatedWidgets: ['TimePicker', 'Form'],
    tags: ['date', 'calendar', 'picker', 'dialog'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => ElevatedButton(
      onPressed: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        if (picked != null && context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Selected date: '
                '${picked.year}-${picked.month.toString().padLeft(2, '0')}-'
                '${picked.day.toString().padLeft(2, '0')}',
              ),
            ),
          );
        }
      },
      child: const Text('Show Date Picker'),
    ),
    codeSnippet: '''
showDatePicker(
  context: context,
  initialDate: DateTime.now(),
  firstDate: DateTime(2000),
  lastDate: DateTime(2101),
)
''',
  ),
  WidgetInfo(
    name: 'TimePicker',
    description: 'A material design time picker.',
    category: WidgetCategory.input,
    whenToUse:
        'When the user selects a time of day. Combine with DatePicker when you '
        'need both a date and a time.',
    commonPitfalls: [
      'showTimePicker returns a Future<TimeOfDay?>; await it and handle null on '
          'cancel.',
      'TimeOfDay has no date component, so combine it with a DateTime yourself '
          'if you need a full timestamp.',
      'After the await, guard with context.mounted before using BuildContext.',
    ],
    relatedWidgets: ['DatePicker', 'Form'],
    tags: ['time', 'clock', 'picker', 'dialog'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => ElevatedButton(
      onPressed: () async {
        final TimeOfDay? picked = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        if (picked != null && context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Selected time: ${picked.format(context)}')),
          );
        }
      },
      child: const Text('Show Time Picker'),
    ),
    codeSnippet: '''
showTimePicker(
  context: context,
  initialTime: TimeOfDay.now(),
)
''',
  ),
  WidgetInfo(
    name: 'Autocomplete',
    description:
        'A widget for helping the user make a selection by entering some text and choosing from among a list of options.',
    category: WidgetCategory.input,
    whenToUse:
        'When the user types to filter a known list of options and pick one. For '
        'full control over the field and options overlay, drop down to '
        'RawAutocomplete; for a Material 3 search experience use SearchAnchor.',
    commonPitfalls: [
      'optionsBuilder runs on every keystroke; keep it cheap and return an empty '
          'Iterable for empty input to avoid showing the whole list.',
      'By default options must be Strings; override displayStringForOption when '
          'using custom objects.',
    ],
    relatedWidgets: ['RawAutocomplete', 'SearchAnchor', 'TextField'],
    docsUrl: 'https://api.flutter.dev/flutter/material/Autocomplete-class.html',
    tags: ['autocomplete', 'suggestions', 'search', 'input'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => const _AutocompleteSample(),
    codeSnippet: '''
class _AutocompleteSample extends StatelessWidget {
  const _AutocompleteSample();

  static const List<String> _kOptions = <String>[
    'aardvark',
    'bobcat',
    'chameleon',
  ];

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return _kOptions.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selection) {
        debugPrint('You just selected \$selection');
      },
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'RawAutocomplete',
    description:
        'A lower-level widget for autocomplete and suggestion systems.',
    category: WidgetCategory.input,
    whenToUse:
        'When you need full control over the input field and the options overlay '
        'that Autocomplete does not expose. If the Material-styled defaults are '
        'enough, use Autocomplete instead.',
    commonPitfalls: [
      'You must build the field via fieldViewBuilder and the dropdown via '
          'optionsViewBuilder yourself; nothing is styled for you.',
      'Wire onFieldSubmitted from fieldViewBuilder so the highlighted option is '
          'selected on submit.',
      'The options overlay is unconstrained; give it an explicit width/height to '
          'avoid layout errors.',
    ],
    relatedWidgets: ['Autocomplete', 'SearchAnchor', 'TextField'],
    docsUrl:
        'https://api.flutter.dev/flutter/widgets/RawAutocomplete-class.html',
    tags: ['autocomplete', 'suggestions', 'search', 'custom'],
    difficulty: WidgetDifficulty.advanced,
    builder: (context) => const _RawAutocompleteSample(),
    codeSnippet: '''
RawAutocomplete<String>(
  optionsBuilder: (TextEditingValue textEditingValue) {
    return _options.where((String option) {
      return option.contains(textEditingValue.text.toLowerCase());
    });
  },
  fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      onFieldSubmitted: (String value) => onFieldSubmitted(),
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Search fruits...',
      ),
    );
  },
  optionsViewBuilder: (context, onSelected, options) {
    return Align(
      alignment: Alignment.topLeft,
      child: Material(
        elevation: 4.0,
        child: SizedBox(
          height: 200,
          child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: options.length,
            itemBuilder: (context, index) {
              final String option = options.elementAt(index);
              return ListTile(
                title: Text(option),
                onTap: () => onSelected(option),
              );
            },
          ),
        ),
      ),
    );
  },
)
''',
  ),
  WidgetInfo(
    name: 'SwitchListTile',
    description: 'A ListTile with a Switch.',
    category: WidgetCategory.input,
    whenToUse:
        'When a toggle needs a tappable label row, typically on a settings '
        'screen. For a bare toggle without a row use Switch.',
    commonPitfalls: [
      'Like Switch, it is controlled: update value in onChanged and rebuild or it '
          'will not move.',
      'The whole row is tappable; do not also wrap it in another tap handler.',
    ],
    relatedWidgets: ['Switch', 'CheckboxListTile', 'RadioListTile', 'ListTile'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/SwitchListTile-class.html',
    tags: ['toggle', 'list', 'setting', 'tile'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => const _SwitchListTileSample(),
    codeSnippet: '''
class _SwitchListTileSample extends StatefulWidget {
  const _SwitchListTileSample();

  @override
  State<_SwitchListTileSample> createState() => _SwitchListTileSampleState();
}

class _SwitchListTileSampleState extends State<_SwitchListTileSample> {
  bool _lights = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text('Lights'),
      value: _lights,
      onChanged: (bool value) {
        setState(() {
          _lights = value;
        });
      },
      secondary: const Icon(Icons.lightbulb_outline),
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'CheckboxListTile',
    description: 'A ListTile with a Checkbox.',
    category: WidgetCategory.input,
    whenToUse:
        'When a checkbox needs a tappable label row, such as items in a settings '
        'or multi-select list. For a bare checkbox use Checkbox.',
    commonPitfalls: [
      'It is controlled: update value in onChanged and rebuild.',
      'value can be null only when tristate is true.',
      'The entire tile toggles the value; avoid nesting another tap handler.',
    ],
    relatedWidgets: ['Checkbox', 'SwitchListTile', 'RadioListTile', 'ListTile'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/CheckboxListTile-class.html',
    tags: ['checkbox', 'list', 'selection', 'tile'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => const _CheckboxListTileSample(),
    codeSnippet: '''
class _CheckboxListTileSample extends StatefulWidget {
  const _CheckboxListTileSample();

  @override
  State<_CheckboxListTileSample> createState() => _CheckboxListTileSampleState();
}

class _CheckboxListTileSampleState extends State<_CheckboxListTileSample> {
  bool? _checked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: const Text('Animate Slowly'),
      value: _checked,
      onChanged: (bool? value) {
        setState(() {
          _checked = value;
        });
      },
      secondary: const Icon(Icons.hourglass_empty),
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'RadioListTile',
    description: 'A ListTile with a Radio button.',
    category: WidgetCategory.input,
    whenToUse:
        'When the user picks one option from a mutually exclusive list and each '
        'option benefits from a full tappable row with a label. For a bare radio '
        'use Radio.',
    commonPitfalls: [
      'Radios share state only when grouped; in current Flutter wrap the tiles in '
          'a RadioGroup that owns groupValue and onChanged.',
      'It is controlled: rebuild with the new selected value or nothing changes.',
    ],
    relatedWidgets: ['Radio', 'CheckboxListTile', 'SwitchListTile', 'ListTile'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/RadioListTile-class.html',
    tags: ['radio', 'list', 'single-choice', 'tile'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => const _RadioListTileSample(),
    codeSnippet: '''
enum SingingCharacter { lafayette, jefferson }

class _RadioListTileSample extends StatefulWidget {
  const _RadioListTileSample();

  @override
  State<_RadioListTileSample> createState() => _RadioListTileSampleState();
}

class _RadioListTileSampleState extends State<_RadioListTileSample> {
  SingingCharacter? _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
      children: <Widget>[
        RadioListTile<SingingCharacter>(
          title: const Text('Lafayette'),
          value: SingingCharacter.lafayette,
        ),
        RadioListTile<SingingCharacter>(
          title: const Text('Thomas Jefferson'),
          value: SingingCharacter.jefferson,
        ),
      ],
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'RangeSlider',
    description:
        'A material design range slider for selecting a range of values.',
    category: WidgetCategory.input,
    whenToUse:
        'When the user selects a span between a start and end value, like a price '
        'or date range. For a single value use Slider.',
    commonPitfalls: [
      'values is a RangeValues whose start and end must stay within min and max '
          'and not cross, or it asserts.',
      'It is controlled: store the RangeValues in state and update in onChanged.',
      'Provide labels (and divisions) to show the current values while dragging.',
    ],
    relatedWidgets: ['Slider', 'CupertinoSlider'],
    docsUrl: 'https://api.flutter.dev/flutter/material/RangeSlider-class.html',
    tags: ['slider', 'range', 'min-max', 'value'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => const _RangeSliderSample(),
    codeSnippet: '''
class _RangeSliderSample extends StatefulWidget {
  const _RangeSliderSample();

  @override
  State<_RangeSliderSample> createState() => _RangeSliderSampleState();
}

class _RangeSliderSampleState extends State<_RangeSliderSample> {
  RangeValues _currentRangeValues = const RangeValues(20, 80);

  @override
  Widget build(BuildContext context) {
      children: [
        RangeSlider(
          values: _currentRangeValues,
          max: 100,
          divisions: 10,
          labels: RangeLabels(
            _currentRangeValues.start.round().toString(),
            _currentRangeValues.end.round().toString(),
          ),
          onChanged: (RangeValues values) {
            setState(() {
              _currentRangeValues = values;
            });
          },
        ),
        Text('Range: \${_currentRangeValues.start.round()} - \${_currentRangeValues.end.round()}'),
      ],
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'SegmentedButton',
    description:
        'A material design segmented button for selecting from a set of options.',
    category: WidgetCategory.input,
    whenToUse:
        'When choosing among 2-5 visible, mutually exclusive options (or a few '
        'multi-select ones) and you want all choices shown at once. For many '
        'options a DropdownButton scales better; for grouped one-of-N choices '
        'consider Radio.',
    commonPitfalls: [
      'selected is a Set; for single choice keep exactly one element and rebuild '
          'in onSelectionChanged.',
      'Set multiSelectionEnabled to true to allow more than one selection; '
          'otherwise the set should hold one value.',
      'Too many segments overflow horizontally; keep the option count small.',
    ],
    relatedWidgets: ['ToggleButtons', 'DropdownButton', 'Radio', 'ChoiceChip'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/SegmentedButton-class.html',
    tags: ['segmented', 'selection', 'choice', 'group'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => const _SegmentedButtonSample(),
    codeSnippet: '''
enum Calendar { day, week, month, year }

class _SegmentedButtonSample extends StatefulWidget {
  const _SegmentedButtonSample();

  @override
  State<_SegmentedButtonSample> createState() => _SegmentedButtonSampleState();
}

class _SegmentedButtonSampleState extends State<_SegmentedButtonSample> {
  Calendar _calendarView = Calendar.day;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Calendar>(
      segments: const <ButtonSegment<Calendar>>[
        ButtonSegment<Calendar>(
          value: Calendar.day,
          label: Text('Day'),
          icon: Icon(Icons.calendar_view_day),
        ),
        ButtonSegment<Calendar>(
          value: Calendar.week,
          label: Text('Week'),
          icon: Icon(Icons.calendar_view_week),
        ),
        ButtonSegment<Calendar>(
          value: Calendar.month,
          label: Text('Month'),
          icon: Icon(Icons.calendar_view_month),
        ),
      ],
      selected: <Calendar>{_calendarView},
      onSelectionChanged: (Set<Calendar> newSelection) {
        setState(() {
          _calendarView = newSelection.first;
        });
      },
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'SearchBar',
    description: 'A material design search bar.',
    category: WidgetCategory.input,
    whenToUse:
        'When you want a Material 3 styled search input. To show a suggestions '
        'view or full-screen search overlay, wrap it with SearchAnchor; for typed '
        'selection from a known list use Autocomplete.',
    commonPitfalls: [
      'SearchBar is just the input surface; it does not provide a results '
          'overlay on its own. Use SearchAnchor for that.',
      'Dispose any SearchController or TextEditingController you create.',
    ],
    relatedWidgets: ['SearchAnchor', 'Autocomplete', 'TextField'],
    docsUrl: 'https://api.flutter.dev/flutter/material/SearchBar-class.html',
    tags: ['search', 'input', 'material3', 'query'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => const _SearchBarSample(),
    codeSnippet: '''
class _SearchBarSample extends StatefulWidget {
  const _SearchBarSample();

  @override
  State<_SearchBarSample> createState() => _SearchBarSampleState();
}

class _SearchBarSampleState extends State<_SearchBarSample> {
  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: 'Search...',
      leading: const Icon(Icons.search),
      onChanged: (value) {
        debugPrint('Search query: \$value');
      },
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'FilledButton',
    description: 'A Material Design filled button.',
    category: WidgetCategory.input,
    whenToUse:
        'For the primary, high-emphasis action on a screen in Material 3. Use '
        'ElevatedButton for a raised look, OutlinedButton for medium emphasis, '
        'or TextButton for low emphasis.',
    commonPitfalls: [
      'Passing onPressed: null disables the button; provide a callback to enable '
          'it.',
      'FilledButton.tonal gives the lower-emphasis secondary-container variant.',
    ],
    relatedWidgets: [
      'ElevatedButton',
      'OutlinedButton',
      'TextButton',
      'FloatingActionButton',
    ],
    docsUrl: 'https://api.flutter.dev/flutter/material/FilledButton-class.html',
    tags: ['button', 'action', 'material3', 'primary'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => const _FilledButtonSample(),
    codeSnippet: '''
class _FilledButtonSample extends StatelessWidget {
  const _FilledButtonSample();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        FilledButton(
          onPressed: () {},
          child: const Text('Enabled'),
        ),
        const SizedBox(height: 30),
        const FilledButton(
          onPressed: null,
          child: Text('Disabled'),
        ),
      ],
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'ToggleButtons',
    description: 'A set of toggle buttons.',
    category: WidgetCategory.input,
    whenToUse:
        'For a horizontally joined group of toggles, often icon-only, such as a '
        'text-formatting toolbar. For the modern Material 3 styling and built-in '
        'single/multi-select semantics, prefer SegmentedButton.',
    commonPitfalls: [
      'isSelected is a List<bool> that must be the same length as children; keep '
          'them in sync.',
      'It does not enforce single selection; implement that logic in onPressed '
          'yourself.',
      'It is controlled: update the isSelected list in state and rebuild.',
    ],
    relatedWidgets: ['SegmentedButton', 'IconButton', 'ChoiceChip'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/ToggleButtons-class.html',
    tags: ['toggle', 'selection', 'group', 'toolbar'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => const _ToggleButtonsSample(),
    codeSnippet: '''
class _ToggleButtonsSample extends StatefulWidget {
  const _ToggleButtonsSample();

  @override
  State<_ToggleButtonsSample> createState() => _ToggleButtonsSampleState();
}

class _ToggleButtonsSampleState extends State<_ToggleButtonsSample> {
  final List<bool> _selectedWeather = <bool>[true, false, false];

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      direction: Axis.horizontal,
      onPressed: (int index) {
        setState(() {
          // The button that is tapped is set to true, and the others to false.
          for (int i = 0; i < _selectedWeather.length; i++) {
            _selectedWeather[i] = i == index;
          }
        });
      },
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      selectedBorderColor: Colors.red[700],
      selectedColor: Colors.white,
      fillColor: Colors.red[200],
      color: Colors.red[400],
      constraints: const BoxConstraints(
        minHeight: 40.0,
        minWidth: 80.0,
      ),
      isSelected: _selectedWeather,
      children: const <Widget>[
        Icon(Icons.sunny),
        Icon(Icons.cloud),
        Icon(Icons.ac_unit),
      ],
    );
  }
}
''',
  ),
];

class _CheckboxSample extends StatefulWidget {
  const _CheckboxSample();

  @override
  State<_CheckboxSample> createState() => _CheckboxSampleState();
}

class _CheckboxSampleState extends State<_CheckboxSample> {
  bool _checked = true;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: _checked,
      onChanged: (bool? value) => setState(() => _checked = value ?? false),
    );
  }
}

class _RadioSample extends StatefulWidget {
  const _RadioSample();

  @override
  State<_RadioSample> createState() => _RadioSampleState();
}

class _RadioSampleState extends State<_RadioSample> {
  int _selected = 1;

  @override
  Widget build(BuildContext context) {
    return RadioGroup<int>(
      groupValue: _selected,
      onChanged: (int? value) => setState(() => _selected = value ?? _selected),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Radio<int>(value: 1),
          Text('Option 1'),
          SizedBox(width: 16),
          Radio<int>(value: 2),
          Text('Option 2'),
        ],
      ),
    );
  }
}

class _SwitchSample extends StatefulWidget {
  const _SwitchSample();

  @override
  State<_SwitchSample> createState() => _SwitchSampleState();
}

class _SwitchSampleState extends State<_SwitchSample> {
  bool _on = true;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _on,
      onChanged: (bool value) => setState(() => _on = value),
    );
  }
}

class _SliderSample extends StatefulWidget {
  const _SliderSample();

  @override
  State<_SliderSample> createState() => _SliderSampleState();
}

class _SliderSampleState extends State<_SliderSample> {
  double _value = 0.5;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _value,
      onChanged: (double value) => setState(() => _value = value),
    );
  }
}

class _DropdownButtonSample extends StatefulWidget {
  const _DropdownButtonSample();

  @override
  State<_DropdownButtonSample> createState() => _DropdownButtonSampleState();
}

class _DropdownButtonSampleState extends State<_DropdownButtonSample> {
  String _value = 'One';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _value,
      items: const <String>['One', 'Two', 'Three', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          })
          .toList(),
      onChanged: (String? newValue) {
        if (newValue != null) setState(() => _value = newValue);
      },
    );
  }
}

class _AutocompleteSample extends StatelessWidget {
  const _AutocompleteSample();

  static const List<String> _kOptions = <String>[
    'aardvark',
    'bobcat',
    'chameleon',
  ];

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return _kOptions.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selection) {
        debugPrint('You just selected $selection');
      },
    );
  }
}

class _SwitchListTileSample extends StatefulWidget {
  const _SwitchListTileSample();

  @override
  State<_SwitchListTileSample> createState() => _SwitchListTileSampleState();
}

class _SwitchListTileSampleState extends State<_SwitchListTileSample> {
  bool _lights = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text('Lights'),
      value: _lights,
      onChanged: (bool value) {
        setState(() {
          _lights = value;
        });
      },
      secondary: const Icon(Icons.lightbulb_outline),
    );
  }
}

class _CheckboxListTileSample extends StatefulWidget {
  const _CheckboxListTileSample();

  @override
  State<_CheckboxListTileSample> createState() =>
      _CheckboxListTileSampleState();
}

class _CheckboxListTileSampleState extends State<_CheckboxListTileSample> {
  bool? _checked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: const Text('Animate Slowly'),
      value: _checked,
      onChanged: (bool? value) {
        setState(() {
          _checked = value;
        });
      },
      secondary: const Icon(Icons.hourglass_empty),
    );
  }
}

enum SingingCharacter { lafayette, jefferson }

class _RadioListTileSample extends StatefulWidget {
  const _RadioListTileSample();

  @override
  State<_RadioListTileSample> createState() => _RadioListTileSampleState();
}

class _RadioListTileSampleState extends State<_RadioListTileSample> {
  SingingCharacter? _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    return RadioGroup<SingingCharacter>(
      groupValue: _character,
      onChanged: (SingingCharacter? value) {
        setState(() {
          _character = value;
        });
      },
      child: Column(
        children: <Widget>[
          RadioListTile<SingingCharacter>(
            title: const Text('Lafayette'),
            value: SingingCharacter.lafayette,
          ),
          RadioListTile<SingingCharacter>(
            title: const Text('Thomas Jefferson'),
            value: SingingCharacter.jefferson,
          ),
        ],
      ),
    );
  }
}

class _FormSample extends StatefulWidget {
  const _FormSample();

  @override
  State<_FormSample> createState() => _FormSampleState();
}

class _FormSampleState extends State<_FormSample> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(hintText: 'Enter your email'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

class _RangeSliderSample extends StatefulWidget {
  const _RangeSliderSample();

  @override
  State<_RangeSliderSample> createState() => _RangeSliderSampleState();
}

class _RangeSliderSampleState extends State<_RangeSliderSample> {
  RangeValues _currentRangeValues = const RangeValues(20, 80);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RangeSlider(
          values: _currentRangeValues,
          max: 100,
          divisions: 10,
          labels: RangeLabels(
            _currentRangeValues.start.round().toString(),
            _currentRangeValues.end.round().toString(),
          ),
          onChanged: (RangeValues values) {
            setState(() {
              _currentRangeValues = values;
            });
          },
        ),
        Text(
          'Range: ${_currentRangeValues.start.round()} - ${_currentRangeValues.end.round()}',
        ),
      ],
    );
  }
}

enum Calendar { day, week, month, year }

class _SegmentedButtonSample extends StatefulWidget {
  const _SegmentedButtonSample();

  @override
  State<_SegmentedButtonSample> createState() => _SegmentedButtonSampleState();
}

class _SegmentedButtonSampleState extends State<_SegmentedButtonSample> {
  Calendar _calendarView = Calendar.day;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Calendar>(
      segments: const <ButtonSegment<Calendar>>[
        ButtonSegment<Calendar>(
          value: Calendar.day,
          label: Text('Day'),
          icon: Icon(Icons.calendar_view_day),
        ),
        ButtonSegment<Calendar>(
          value: Calendar.week,
          label: Text('Week'),
          icon: Icon(Icons.calendar_view_week),
        ),
        ButtonSegment<Calendar>(
          value: Calendar.month,
          label: Text('Month'),
          icon: Icon(Icons.calendar_view_month),
        ),
      ],
      selected: <Calendar>{_calendarView},
      onSelectionChanged: (Set<Calendar> newSelection) {
        setState(() {
          _calendarView = newSelection.first;
        });
      },
    );
  }
}

class _SearchBarSample extends StatefulWidget {
  const _SearchBarSample();

  @override
  State<_SearchBarSample> createState() => _SearchBarSampleState();
}

class _SearchBarSampleState extends State<_SearchBarSample> {
  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: 'Search...',
      leading: const Icon(Icons.search),
      onChanged: (value) {
        debugPrint('Search query: $value');
      },
    );
  }
}

class _FilledButtonSample extends StatelessWidget {
  const _FilledButtonSample();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        FilledButton(onPressed: () {}, child: const Text('Enabled')),
        const SizedBox(height: 30),
        const FilledButton(onPressed: null, child: Text('Disabled')),
      ],
    );
  }
}

class _ToggleButtonsSample extends StatefulWidget {
  const _ToggleButtonsSample();

  @override
  State<_ToggleButtonsSample> createState() => _ToggleButtonsSampleState();
}

class _ToggleButtonsSampleState extends State<_ToggleButtonsSample> {
  final List<bool> _selectedWeather = <bool>[true, false, false];

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      direction: Axis.horizontal,
      onPressed: (int index) {
        setState(() {
          // The button that is tapped is set to true, and the others to false.
          for (int i = 0; i < _selectedWeather.length; i++) {
            _selectedWeather[i] = i == index;
          }
        });
      },
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      selectedBorderColor: Colors.red[700],
      selectedColor: Colors.white,
      fillColor: Colors.red[200],
      color: Colors.red[400],
      constraints: const BoxConstraints(minHeight: 40.0, minWidth: 80.0),
      isSelected: _selectedWeather,
      children: const <Widget>[
        Icon(Icons.sunny),
        Icon(Icons.cloud),
        Icon(Icons.ac_unit),
      ],
    );
  }
}

class _RawAutocompleteSample extends StatelessWidget {
  const _RawAutocompleteSample();

  static const List<String> _options = <String>['apple', 'banana', 'cherry'];

  @override
  Widget build(BuildContext context) {
    return RawAutocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        return _options.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
      fieldViewBuilder:
          (
            BuildContext context,
            TextEditingController textEditingController,
            FocusNode focusNode,
            VoidCallback onFieldSubmitted,
          ) {
            return TextFormField(
              controller: textEditingController,
              focusNode: focusNode,
              onFieldSubmitted: (String value) {
                onFieldSubmitted();
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search fruits...',
              ),
            );
          },
      optionsViewBuilder:
          (
            BuildContext context,
            AutocompleteOnSelected<String> onSelected,
            Iterable<String> options,
          ) {
            return Align(
              alignment: Alignment.topLeft,
              child: Material(
                elevation: 4.0,
                child: SizedBox(
                  width: 300,
                  height: 200,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: options.length,
                    itemBuilder: (BuildContext context, int index) {
                      final String option = options.elementAt(index);
                      return ListTile(
                        title: Text(option),
                        onTap: () {
                          onSelected(option);
                        },
                      );
                    },
                  ),
                ),
              ),
            );
          },
    );
  }
}
