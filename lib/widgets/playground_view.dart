import 'package:flutter/material.dart';
import '../models/knobs.dart';
import '../theme/catalog_theme.dart';

/// Renders a widget's interactive playground: a live preview on top and a set
/// of editable controls below. Tweaking any control rebuilds the preview.
class PlaygroundView extends StatefulWidget {
  const PlaygroundView({super.key, required this.playground});

  final WidgetPlayground playground;

  @override
  State<PlaygroundView> createState() => _PlaygroundViewState();
}

class _PlaygroundViewState extends State<PlaygroundView> {
  late final Map<String, Object?> _values = {
    for (final knob in widget.playground.knobs) knob.id: knob.initial,
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          constraints: const BoxConstraints(minHeight: 160),
          decoration: flutterCardDecoration(context, elevated: true),
          child: Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 160),
              child: Center(
                key: ValueKey(_values.toString()),
                child: widget.playground.builder(context, Knobs(_values)),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(14),
          decoration: flutterCardDecoration(
            context,
            color: Theme.of(context).colorScheme.surfaceContainerLow,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (final knob in widget.playground.knobs)
                _control(context, knob),
            ],
          ),
        ),
      ],
    );
  }

  void _set(String id, Object? value) => setState(() => _values[id] = value);

  Widget _control(BuildContext context, KnobDef knob) {
    switch (knob) {
      case BoolKnob():
        return SwitchListTile(
          contentPadding: EdgeInsets.zero,
          dense: true,
          title: Text(knob.label),
          value: _values[knob.id]! as bool,
          onChanged: (v) => _set(knob.id, v),
        );

      case DoubleKnob():
        final value = (_values[knob.id]! as double).clamp(knob.min, knob.max);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${knob.label}: ${value.toStringAsFixed(1)}'),
              Slider(
                min: knob.min,
                max: knob.max,
                divisions: knob.divisions,
                value: value,
                label: value.toStringAsFixed(1),
                onChanged: (v) => _set(knob.id, v),
              ),
            ],
          ),
        );

      case ColorKnob():
        final selected = _values[knob.id]! as Color;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              SizedBox(
                width: 96,
                child: Text(
                  knob.label,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final color in knob.options)
                      GestureDetector(
                        onTap: () => _set(knob.id, color),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 120),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: color == selected
                                  ? Theme.of(context).colorScheme.primary
                                  : Colors.transparent,
                              width: 3,
                            ),
                            boxShadow: color == selected
                                ? [
                                    BoxShadow(
                                      color: color.withValues(alpha: 0.22),
                                      blurRadius: 10,
                                      spreadRadius: 1,
                                    ),
                                  ]
                                : null,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );

      case OptionKnob():
        final options = knob.options;
        final labels = knob.labels;
        final selected = _values[knob.id];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(knob.label),
              const SizedBox(height: 6),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (var i = 0; i < options.length; i++)
                    ChoiceChip(
                      label: Text(
                        labels != null && i < labels.length
                            ? labels[i]
                            : '${options[i]}',
                      ),
                      selected: options[i] == selected,
                      onSelected: (_) => _set(knob.id, options[i]),
                    ),
                ],
              ),
            ],
          ),
        );
    }
  }
}
