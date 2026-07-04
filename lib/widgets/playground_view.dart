import 'package:flutter/material.dart';
import '../models/knobs.dart';

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
          padding: const EdgeInsets.all(16),
          constraints: const BoxConstraints(minHeight: 160),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).dividerColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: widget.playground.builder(context, Knobs(_values)),
          ),
        ),
        const SizedBox(height: 8),
        for (final knob in widget.playground.knobs) _control(context, knob),
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
              Text(knob.label),
              const SizedBox(width: 12),
              Expanded(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final color in knob.options)
                      GestureDetector(
                        onTap: () => _set(knob.id, color),
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: color == selected
                                  ? Theme.of(context).colorScheme.onSurface
                                  : Colors.transparent,
                              width: 3,
                            ),
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
