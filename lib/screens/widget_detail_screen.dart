import 'package:flutter/material.dart';
import '../models/widget_info.dart';

class WidgetDetailScreen extends StatelessWidget {
  final WidgetInfo widgetInfo;

  const WidgetDetailScreen({super.key, required this.widgetInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widgetInfo.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widgetInfo.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),
            const Text(
              'Live Sample:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(child: widgetInfo.builder(context)),
            ),
            const SizedBox(height: 24),
            if (widgetInfo.codeSnippet != null) ...[
              const Text(
                'Code Snippet:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SelectableText(
                  widgetInfo.codeSnippet!,
                  style: const TextStyle(fontFamily: 'Courier'),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
