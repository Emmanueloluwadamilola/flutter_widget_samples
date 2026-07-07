import 'package:flutter/material.dart';
import '../models/widget_info.dart';

/// A small colored chip communicating a widget's [WidgetDifficulty].
class DifficultyBadge extends StatelessWidget {
  const DifficultyBadge({super.key, required this.difficulty});

  final WidgetDifficulty difficulty;

  @override
  Widget build(BuildContext context) {
    final label = switch (difficulty) {
      WidgetDifficulty.beginner => 'Beginner',
      WidgetDifficulty.intermediate => 'Intermediate',
      WidgetDifficulty.advanced => 'Advanced',
    };
    final color = Theme.of(context).colorScheme.primary;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.28)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
