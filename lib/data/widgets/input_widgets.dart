import 'package:flutter/material.dart';
import '../../models/widget_info.dart';

final List<WidgetInfo> inputWidgets = [
  WidgetInfo(
    name: 'TextField',
    description: 'A text input field.',
    category: WidgetCategory.input,
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
    builder: (context) => Checkbox(value: true, onChanged: (bool? value) {}),
    codeSnippet: '''
Checkbox(
  value: true,
  onChanged: (bool? value) {},
)
''',
  ),
  WidgetInfo(
    name: 'Radio',
    description: 'A material design radio button.',
    category: WidgetCategory.input,
    builder: (context) => RadioGroup<int>(
      groupValue: 1,
      onChanged: (int? value) {},
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Radio<int>(value: 1),
          Text('Option 1'),
          Radio<int>(value: 2),
          Text('Option 2'),
        ],
      ),
    ),
    codeSnippet: '''
RadioGroup<int>(
  groupValue: 1,
  onChanged: (int? value) {},
  child: Row(
    children: [
      Radio<int>(value: 1),
      const Text('Option 1'),
      Radio<int>(value: 2),
      const Text('Option 2'),
    ],
  ),
)
''',
  ),
  WidgetInfo(
    name: 'Switch',
    description: 'A material design switch.',
    category: WidgetCategory.input,
    builder: (context) => Switch(value: true, onChanged: (bool value) {}),
    codeSnippet: '''
Switch(
  value: true,
  onChanged: (bool value) {},
)
''',
  ),
  WidgetInfo(
    name: 'Slider',
    description: 'A material design slider.',
    category: WidgetCategory.input,
    builder: (context) => Slider(value: 0.5, onChanged: (double value) {}),
    codeSnippet: '''
Slider(
  value: 0.5,
  onChanged: (double value) {},
)
''',
  ),
  WidgetInfo(
    name: 'DropdownButton',
    description: 'A material design button for selecting from a list of items.',
    category: WidgetCategory.input,
    builder: (context) => DropdownButton<String>(
      value: 'One',
      items: <String>['One', 'Two', 'Three', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          })
          .toList(),
      onChanged: (String? newValue) {},
    ),
    codeSnippet: '''
DropdownButton<String>(
  value: 'One',
  items: <String>['One', 'Two', 'Three', 'Four']
      .map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList(),
  onChanged: (String? newValue) {},
)
''',
  ),
  WidgetInfo(
    name: 'Form',
    description:
        'An optional container for grouping together multiple form field widgets.',
    category: WidgetCategory.input,
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
                'Selected date: \${picked.toString().split('
                ')[0]}',
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
    builder: (context) => ElevatedButton(
      onPressed: () async {
        final TimeOfDay? picked = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        if (picked != null && context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Selected time: \${picked.format(context)}'),
            ),
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
