import 'package:flutter/material.dart';
import '../../models/widget_info.dart';

final List<WidgetInfo> asyncWidgets = [
  WidgetInfo(
    name: 'FutureBuilder',
    description:
        'Widget that builds itself based on the latest snapshot of interaction with a Future.',
    category: WidgetCategory.async,
    builder: (context) => FutureBuilder<String>(
      future: Future.delayed(const Duration(seconds: 2), () => 'Data Loaded'),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Text('Result: ${snapshot.data}');
        }
      },
    ),
    codeSnippet: '''
FutureBuilder<String>(
  future: Future.delayed(const Duration(seconds: 2), () => 'Data Loaded'),
  builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const CircularProgressIndicator();
    } else if (snapshot.hasError) {
      return Text('Error: \${snapshot.error}');
    } else {
      return Text('Result: \${snapshot.data}');
    }
  },
)
''',
  ),
  WidgetInfo(
    name: 'StreamBuilder',
    description:
        'Widget that builds itself based on the latest snapshot of interaction with a Stream.',
    category: WidgetCategory.async,
    builder: (context) => StreamBuilder<int>(
      stream: Stream.periodic(const Duration(seconds: 1), (i) => i).take(10),
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Text('Select lot');
          case ConnectionState.waiting:
            return const Text('Awaiting bids...');
          case ConnectionState.active:
            return Text('\$${snapshot.data}');
          case ConnectionState.done:
            return const Text('\$10 (closed)');
        }
      },
    ),
    codeSnippet: '''
StreamBuilder<int>(
  stream: Stream.periodic(const Duration(seconds: 1), (i) => i).take(10),
  builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: \${snapshot.error}');
    }
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        return const Text('Select lot');
      case ConnectionState.waiting:
        return const Text('Awaiting bids...');
      case ConnectionState.active:
        return Text('\$ \${snapshot.data}');
      case ConnectionState.done:
        return const Text('\$10 (closed)');
    }
  },
)
''',
  ),
  WidgetInfo(
    name: 'ValueListenableBuilder',
    description:
        'A widget that builds itself based on the value of a ValueListenable and rebuilds when the value changes.',
    category: WidgetCategory.async,
    builder: (context) => const _ValueListenableBuilderSample(),
    codeSnippet: '''
class _ValueListenableBuilderSample extends StatefulWidget {
  const _ValueListenableBuilderSample();

  @override
  State<_ValueListenableBuilderSample> createState() => _ValueListenableBuilderSampleState();
}

class _ValueListenableBuilderSampleState extends State<_ValueListenableBuilderSample> {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder<int>(
          valueListenable: _counter,
          builder: (BuildContext context, int value, Widget? child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('Value: \$value'),
                child!,
              ],
            );
          },
          child: const Text('Static child'),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => _counter.value += 1,
          child: const Text('Increment'),
        ),
      ],
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'ListenableBuilder',
    description:
        'A widget that rebuilds when a Listenable notifies its listeners.',
    category: WidgetCategory.async,
    builder: (context) => const _ListenableBuilderSample(),
    codeSnippet: '''
class _ListenableBuilderSample extends StatefulWidget {
  const _ListenableBuilderSample();

  @override
  State<_ListenableBuilderSample> createState() => _ListenableBuilderSampleState();
}

class _ListenableBuilderSampleState extends State<_ListenableBuilderSample> {
  final _CounterModel _model = _CounterModel();

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListenableBuilder(
          listenable: _model,
          builder: (BuildContext context, Widget? child) {
            return Text('Counter: \${_model.counter}');
          },
        ),
        ElevatedButton(
          onPressed: _model.increment,
          child: const Text('Increment'),
        ),
      ],
    );
  }
}

class _CounterModel extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;
  void increment() {
    _counter++;
    notifyListeners();
  }
}
''',
  ),
];

class _ValueListenableBuilderSample extends StatefulWidget {
  const _ValueListenableBuilderSample();

  @override
  State<_ValueListenableBuilderSample> createState() =>
      _ValueListenableBuilderSampleState();
}

class _ValueListenableBuilderSampleState
    extends State<_ValueListenableBuilderSample> {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder<int>(
          valueListenable: _counter,
          builder: (BuildContext context, int value, Widget? child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[Text('Value: $value'), child!],
            );
          },
          child: const Text('Static child'),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => _counter.value += 1,
          child: const Text('Increment'),
        ),
      ],
    );
  }
}

class _ListenableBuilderSample extends StatefulWidget {
  const _ListenableBuilderSample();

  @override
  State<_ListenableBuilderSample> createState() =>
      _ListenableBuilderSampleState();
}

class _ListenableBuilderSampleState extends State<_ListenableBuilderSample> {
  final _CounterModel _model = _CounterModel();

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListenableBuilder(
          listenable: _model,
          builder: (BuildContext context, Widget? child) {
            return Text('Counter: ${_model.counter}');
          },
        ),
        ElevatedButton(
          onPressed: _model.increment,
          child: const Text('Increment'),
        ),
      ],
    );
  }
}

class _CounterModel extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;
  void increment() {
    _counter++;
    notifyListeners();
  }
}
