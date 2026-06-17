import 'package:flutter/material.dart';
import '../models/widget_info.dart';
import 'category_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Widget Catalog'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: WidgetCategory.values.length,
        itemBuilder: (context, index) {
          final category = WidgetCategory.values[index];
          return ListTile(
            title: Text(category.name.toUpperCase()),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryScreen(category: category),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
