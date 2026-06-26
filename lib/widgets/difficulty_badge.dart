import 'package:flutter/material.dart';
import '../models/widget_info.dart';

/// A small colored chip communicating a widget's [WidgetDifficulty].
class DifficultyBadge extends StatelessWidget {
  const DifficultyBadge({super.key, required this.difficulty});

  final WidgetDifficulty difficulty;

  @override
  Widget build(BuildContext context) {
    final (label, color) = switch (difficulty) {
      WidgetDifficulty.beginner => ('Beginner', Colors.green),
      WidgetDifficulty.intermediate => ('Intermediate', Colors.orange),
      WidgetDifficulty.advanced => ('Advanced', Colors.red),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color.shade800,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
