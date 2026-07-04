import 'package:flutter/material.dart';

/// A live-editable control ("knob") shown in a widget's interactive playground.
///
/// Knob *definitions* are immutable and `const`-friendly: they describe a
/// control and its initial value but hold no mutable state. The current values
/// live in [Knobs], which the playground rebuilds as the user tweaks controls.
sealed class KnobDef {
  const KnobDef(this.id, this.label);

  /// Stable key used to read this knob's value from [Knobs].
  final String id;

  /// Human-readable label shown next to the control.
  final String label;

  /// The value the knob starts at.
  Object? get initial;
}

/// An on/off switch.
class BoolKnob extends KnobDef {
  const BoolKnob(super.id, super.label, {this.initial = false});

  @override
  final bool initial;
}

/// A numeric slider between [min] and [max], optionally stepped by [divisions].
class DoubleKnob extends KnobDef {
  const DoubleKnob(
    super.id,
    super.label, {
    required this.min,
    required this.max,
    required this.initial,
    this.divisions,
  });

  final double min;
  final double max;
  final int? divisions;

  @override
  final double initial;
}

/// A swatch picker over a fixed palette.
class ColorKnob extends KnobDef {
  const ColorKnob(
    super.id,
    super.label, {
    required this.options,
    required this.initial,
  });

  final List<Color> options;

  @override
  final Color initial;
}

/// A single-choice picker over a fixed set of [options].
///
/// [labels], when provided, supplies the display text for each option in order;
/// otherwise `toString()` is used.
class OptionKnob<T> extends KnobDef {
  const OptionKnob(
    super.id,
    super.label, {
    required this.options,
    required this.initial,
    this.labels,
  });

  final List<T> options;
  final List<String>? labels;

  @override
  final T initial;
}

/// Type-safe read access to the current knob values inside a playground
/// builder. Ids must match the [KnobDef.id]s declared for the playground.
class Knobs {
  const Knobs(this._values);

  final Map<String, Object?> _values;

  bool boolean(String id) => _values[id]! as bool;

  double number(String id) => _values[id]! as double;

  Color color(String id) => _values[id]! as Color;

  T option<T>(String id) => _values[id]! as T;
}

/// Describes a widget's interactive playground: the set of editable [knobs]
/// and a [builder] that renders the widget from the current [Knobs] values.
///
/// Attach one to a `WidgetInfo` to give it a live, tweakable preview. The
/// builder runs on every knob change, so keep it cheap and side-effect free.
class WidgetPlayground {
  const WidgetPlayground({required this.knobs, required this.builder});

  final List<KnobDef> knobs;
  final Widget Function(BuildContext context, Knobs knobs) builder;
}
