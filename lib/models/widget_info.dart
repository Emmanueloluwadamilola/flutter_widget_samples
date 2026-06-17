import 'package:flutter/material.dart';

enum WidgetCategory {
  layout,
  text,
  input,
  assets,
  material,
  cupertino,
  interaction,
  styling,
  scrolling,
  async,
  animation,
  painting,
  effects,
  accessibility,
  utility,
}

class WidgetInfo {
  final String name;
  final String description;
  final WidgetCategory category;
  final WidgetBuilder builder;
  final String? codeSnippet;

  const WidgetInfo({
    required this.name,
    required this.description,
    required this.category,
    required this.builder,
    this.codeSnippet,
  });
}
