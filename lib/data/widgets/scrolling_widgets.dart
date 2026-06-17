import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../models/widget_info.dart';

final List<WidgetInfo> scrollingWidgets = [
  WidgetInfo(
    name: 'ListView',
    description: 'A scrollable list of widgets arranged linearly.',
    category: WidgetCategory.scrolling,
    builder: (context) => SizedBox(
      height: 200,
      child: ListView(
        children: const [
          ListTile(title: Text('Item 1'), tileColor: Colors.grey),
          ListTile(title: Text('Item 2')),
          ListTile(title: Text('Item 3'), tileColor: Colors.grey),
          ListTile(title: Text('Item 4')),
          ListTile(title: Text('Item 5'), tileColor: Colors.grey),
        ],
      ),
    ),
    codeSnippet: '''
ListView(
  children: const [
    ListTile(title: Text('Item 1'), tileColor: Colors.grey),
    ListTile(title: Text('Item 2')),
    ListTile(title: Text('Item 3'), tileColor: Colors.grey),
    ListTile(title: Text('Item 4')),
    ListTile(title: Text('Item 5'), tileColor: Colors.grey),
  ],
)
''',
  ),
  WidgetInfo(
    name: 'GridView',
    description: 'A scrollable, 2D array of widgets.',
    category: WidgetCategory.scrolling,
    builder: (context) => SizedBox(
      height: 200,
      child: GridView.count(
        crossAxisCount: 3,
        children: List.generate(9, (index) {
          return Center(
            child: Container(
              width: 50,
              height: 50,
              color: Colors.primaries[index % Colors.primaries.length],
              child: Center(
                child: Text(
                  '$index',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        }),
      ),
    ),
    codeSnippet: '''
GridView.count(
  crossAxisCount: 3,
  children: List.generate(9, (index) {
    return Center(
      child: Container(
        width: 50,
        height: 50,
        color: Colors.primaries[index % Colors.primaries.length],
        child: Center(child: Text('\$index')),
      ),
    );
  }),
)
''',
  ),
  WidgetInfo(
    name: 'SingleChildScrollView',
    description: 'A box in which a single widget can be scrolled.',
    category: WidgetCategory.scrolling,
    builder: (context) => SizedBox(
      height: 100,
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(20, (index) => Text('Line $index')),
        ),
      ),
    ),
    codeSnippet: '''
SingleChildScrollView(
  child: Column(
    children: List.generate(20, (index) => Text('Line \$index')),
  ),
)
''',
  ),
  WidgetInfo(
    name: 'PageView',
    description: 'A scrollable list that works page by page.',
    category: WidgetCategory.scrolling,
    builder: (context) => SizedBox(
      height: 200,
      child: PageView(
        children: [
          Container(
            color: Colors.red,
            child: const Center(child: Text('Page 1')),
          ),
          Container(
            color: Colors.green,
            child: const Center(child: Text('Page 2')),
          ),
          Container(
            color: Colors.blue,
            child: const Center(child: Text('Page 3')),
          ),
        ],
      ),
    ),
    codeSnippet: '''
PageView(
  children: [
    Container(color: Colors.red, child: const Center(child: Text('Page 1'))),
    Container(color: Colors.green, child: const Center(child: Text('Page 2'))),
    Container(color: Colors.blue, child: const Center(child: Text('Page 3'))),
  ],
)
''',
  ),
  WidgetInfo(
    name: 'RefreshIndicator',
    description:
        'A widget that supports the Material "swipe to refresh" idiom.',
    category: WidgetCategory.scrolling,
    builder: (context) => SizedBox(
      height: 200,
      child: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
        },
        child: ListView(
          children: const [
            ListTile(title: Text('Pull down to refresh')),
            ListTile(title: Text('Item 1')),
            ListTile(title: Text('Item 2')),
          ],
        ),
      ),
    ),
    codeSnippet: '''
RefreshIndicator(
  onRefresh: () async {
    await Future.delayed(const Duration(seconds: 1));
  },
  child: ListView(
    children: const [
      ListTile(title: Text('Pull down to refresh')),
      ListTile(title: Text('Item 1')),
      ListTile(title: Text('Item 2')),
    ],
  ),
)
''',
  ),
  WidgetInfo(
    name: 'ReorderableListView',
    description:
        'A list whose items the user can interactively reorder by dragging.',
    category: WidgetCategory.scrolling,
    builder: (context) => const _ReorderableListViewSample(),
    codeSnippet: '''
class _ReorderableListViewSample extends StatefulWidget {
  const _ReorderableListViewSample();

  @override
  State<_ReorderableListViewSample> createState() => _ReorderableListViewSampleState();
}

class _ReorderableListViewSampleState extends State<_ReorderableListViewSample> {
  final List<int> _items = List<int>.generate(5, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ReorderableListView(
        children: <Widget>[
          for (int index = 0; index < _items.length; index += 1)
            ListTile(
              key: Key('\$index'),
              title: Text('Item \${_items[index]}'),
            ),
        ],
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final int item = _items.removeAt(oldIndex);
            _items.insert(newIndex, item);
          });
        },
      ),
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'CustomScrollView & Slivers',
    description:
        'A ScrollView that creates custom scroll effects using slivers.',
    category: WidgetCategory.scrolling,
    builder: (context) => SizedBox(
      height: 300,
      child: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            pinned: true,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('SliverAppBar'),
              background: FlutterLogo(),
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('Grid Item \$index'),
              );
            }, childCount: 10),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text('List Item \$index'),
              );
            }, childCount: 10),
          ),
        ],
      ),
    ),
    codeSnippet: '''
CustomScrollView(
  slivers: <Widget>[
    const SliverAppBar(
      pinned: true,
      expandedHeight: 150.0,
      flexibleSpace: FlexibleSpaceBar(
        title: Text('SliverAppBar'),
        background: FlutterLogo(),
      ),
    ),
    SliverGrid(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.0,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 4.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.teal[100 * (index % 9)],
            child: Text('Grid Item \$index'),
          );
        },
        childCount: 10,
      ),
    ),
    SliverFixedExtentList(
      itemExtent: 50.0,
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.lightBlue[100 * (index % 9)],
            child: Text('List Item \$index'),
          );
        },
        childCount: 10,
      ),
    ),
  ],
)
''',
  ),
  WidgetInfo(
    name: 'Scrollbar',
    description: 'A material design scrollbar.',
    category: WidgetCategory.scrolling,
    builder: (context) => const _ScrollbarSample(),
    codeSnippet: '''
class _ScrollbarSample extends StatefulWidget {
  const _ScrollbarSample();

  @override
  State<_ScrollbarSample> createState() => _ScrollbarSampleState();
}

class _ScrollbarSampleState extends State<_ScrollbarSample> {
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _controller,
      thumbVisibility: true,
      child: ListView.builder(
        controller: _controller,
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(title: Text('Item \$index'));
        },
      ),
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'NestedScrollView',
    description:
        'A scrolling view inside of which can be nested other scrolling views, with their scroll positions being intrinsically linked.',
    category: WidgetCategory.scrolling,
    builder: (context) => const _NestedScrollViewSample(),
    codeSnippet: '''
class _NestedScrollViewSample extends StatelessWidget {
  const _NestedScrollViewSample();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: const Text('NestedScrollView'),
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
            ),
          ];
        },
        body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 50,
              child: Center(child: Text('Item \$index')),
            );
          },
        ),
      ),
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'DraggableScrollableSheet',
    description:
        'A container for a Scrollable that responds to drag gestures by resizing the scrollable.',
    category: WidgetCategory.scrolling,
    builder: (context) => const _DraggableScrollableSheetSample(),
    codeSnippet: '''
class _DraggableScrollableSheetSample extends StatelessWidget {
  const _DraggableScrollableSheetSample();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Stack(
        children: [
          Container(color: Colors.grey[300]),
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.1,
            maxChildSize: 0.9,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                color: Colors.blue[100],
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 25,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(title: Text('Item \$index'));
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'NotificationListener',
    description:
        'A widget that listens for Notifications bubbling up the tree.',
    category: WidgetCategory.scrolling,
    builder: (context) => const _NotificationListenerSample(),
    codeSnippet: '''
class _NotificationListenerSample extends StatefulWidget {
  const _NotificationListenerSample();

  @override
  State<_NotificationListenerSample> createState() => _NotificationListenerSampleState();
}

class _NotificationListenerSampleState extends State<_NotificationListenerSample> {
  String _notification = 'Scroll to see notifications';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(_notification),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              setState(() {
                if (notification is ScrollStartNotification) {
                  _notification = 'Scroll started';
                } else if (notification is ScrollEndNotification) {
                  _notification = 'Scroll ended';
                }
              });
              return true;
            },
            child: ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) => ListTile(title: Text('Item \$index')),
            ),
          ),
        ),
      ],
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'ListWheelScrollView',
    description: 'A scrollable list that works like a wheel.',
    category: WidgetCategory.scrolling,
    builder: (context) => const _ListWheelScrollViewSample(),
    codeSnippet: '''
ListWheelScrollView(
  itemExtent: 50,
  children: List.generate(
    20,
    (index) => Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.primaries[index % Colors.primaries.length],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text('Item \$index', style: const TextStyle(fontSize: 20)),
    ),
  ),
)
''',
  ),
  WidgetInfo(
    name: 'SliverToBoxAdapter',
    description: 'A sliver that contains a single box widget.',
    category: WidgetCategory.scrolling,
    builder: (context) => SizedBox(
      height: 300,
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(title: Text('SliverToBoxAdapter'), pinned: true),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
              child: Center(
                child: Text('This is a standard box widget inside a sliver'),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(title: Text('Item \$index')),
              childCount: 20,
            ),
          ),
        ],
      ),
    ),
    codeSnippet: '''
CustomScrollView(
  slivers: [
    const SliverAppBar(
      title: Text('SliverToBoxAdapter'),
      pinned: true,
    ),
    const SliverToBoxAdapter(
      child: SizedBox(
        height: 100,
        child: Center(
          child: Text('This is a standard box widget inside a sliver'),
        ),
      ),
    ),
    SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => ListTile(title: Text('Item \$index')),
        childCount: 20,
      ),
    ),
  ],
)
''',
  ),
  WidgetInfo(
    name: 'SliverPadding',
    description:
        'A sliver that applies padding on each side of another sliver.',
    category: WidgetCategory.scrolling,
    builder: (context) => SizedBox(
      height: 300,
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(title: Text('SliverPadding')),
          SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Card(
                  color: Colors.blue[100],
                  child: ListTile(title: Text('Padded Item $index')),
                ),
                childCount: 5,
              ),
            ),
          ),
        ],
      ),
    ),
    codeSnippet: '''
CustomScrollView(
  slivers: [
    const SliverAppBar(title: Text('SliverPadding')),
    SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => Card(
            color: Colors.blue[100],
            child: ListTile(title: Text('Padded Item \$index')),
          ),
          childCount: 5,
        ),
      ),
    ),
  ],
)
''',
  ),
  WidgetInfo(
    name: 'SliverFixedExtentList',
    description:
        'A sliver that places its children in a linear array with a fixed extent.',
    category: WidgetCategory.scrolling,
    builder: (context) => SizedBox(
      height: 300,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text('List Item $index'),
              );
            }, childCount: 10),
          ),
        ],
      ),
    ),
    codeSnippet: '''
SliverFixedExtentList(
  itemExtent: 50.0,
  delegate: SliverChildBuilderDelegate(
    (BuildContext context, int index) {
      return Container(
        alignment: Alignment.center,
        color: Colors.lightBlue[100 * (index % 9)],
        child: Text('List Item \$index'),
      );
    },
    childCount: 10,
  ),
)
''',
  ),
  WidgetInfo(
    name: 'SliverGrid',
    description:
        'A sliver that places multiple box children in a two-dimensional arrangement.',
    category: WidgetCategory.scrolling,
    builder: (context) => SizedBox(
      height: 300,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('Grid Item $index'),
              );
            }, childCount: 20),
          ),
        ],
      ),
    ),
    codeSnippet: '''
SliverGrid(
  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: 200.0,
    mainAxisSpacing: 10.0,
    crossAxisSpacing: 10.0,
    childAspectRatio: 4.0,
  ),
  delegate: SliverChildBuilderDelegate(
    (BuildContext context, int index) {
      return Container(
        alignment: Alignment.center,
        color: Colors.teal[100 * (index % 9)],
        child: Text('Grid Item \$index'),
      );
    },
    childCount: 20,
  ),
)
''',
  ),
  WidgetInfo(
    name: 'SliverPersistentHeader',
    description:
        'A sliver whose size varies when the sliver is scrolled to the edge of the viewport opposite the sliver\'s GrowthDirection.',
    category: WidgetCategory.scrolling,
    builder: (context) => const _SliverPersistentHeaderSample(),
    codeSnippet: '''
class _SliverPersistentHeaderSample extends StatelessWidget {
  const _SliverPersistentHeaderSample();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: _MyHeaderDelegate(
              minHeight: 60.0,
              maxHeight: 150.0,
              child: Container(
                color: Colors.blue,
                alignment: Alignment.center,
                child: const Text(
                  'Sticky Header',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(title: Text('Item \$index')),
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class _MyHeaderDelegate extends SliverPersistentHeaderDelegate {
  _MyHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_MyHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
''',
  ),
  WidgetInfo(
    name: 'SliverOpacity',
    description: 'A sliver that makes its child partially transparent.',
    category: WidgetCategory.scrolling,
    builder: (context) => const _SliverOpacitySample(),
    codeSnippet: '''
class _SliverOpacitySample extends StatelessWidget {
  const _SliverOpacitySample();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            title: Text('SliverOpacity'),
            pinned: true,
          ),
          SliverOpacity(
            opacity: 0.5,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    color: index.isEven ? Colors.blue : Colors.green,
                    height: 50.0,
                    child: Center(
                      child: Text(
                        'Item \$index (50% Opacity)',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
                childCount: 5,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: index.isEven ? Colors.blue : Colors.green,
                  height: 50.0,
                  child: Center(
                    child: Text(
                      'Item \${index + 5} (100% Opacity)',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
              childCount: 5,
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
    name: 'SliverAnimatedList',
    description:
        'A sliver that animates items when they are inserted or removed.',
    category: WidgetCategory.scrolling,
    builder: (context) => const _SliverAnimatedListSample(),
    codeSnippet: '''
class _SliverAnimatedListSample extends StatefulWidget {
  const _SliverAnimatedListSample();

  @override
  State<_SliverAnimatedListSample> createState() => _SliverAnimatedListSampleState();
}

class _SliverAnimatedListSampleState extends State<_SliverAnimatedListSample> {
  final GlobalKey<SliverAnimatedListState> _listKey = GlobalKey<SliverAnimatedListState>();
  final List<int> _list = <int>[0, 1, 2];
  int _nextItem = 3;

  void _insert() {
    final int index = _list.length;
    _list.insert(index, _nextItem++);
    _listKey.currentState!.insertItem(index);
  }

  void _remove() {
    if (_list.isNotEmpty) {
      final int index = _list.length - 1;
      final int item = _list.removeAt(index);
      _listKey.currentState!.removeItem(
        index,
        (BuildContext context, Animation<double> animation) {
          return SizeTransition(
            sizeFactor: animation,
            child: Card(
              color: Colors.red,
              child: ListTile(
                title: Text(
                  'Item \$item',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: const Text('SliverAnimatedList'),
            pinned: true,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.add_circle),
                onPressed: _insert,
                tooltip: 'Insert a new item',
              ),
              IconButton(
                icon: const Icon(Icons.remove_circle),
                onPressed: _remove,
                tooltip: 'Remove the last item',
              ),
            ],
          ),
          SliverAnimatedList(
            key: _listKey,
            initialItemCount: _list.length,
            itemBuilder: (BuildContext context, int index, Animation<double> animation) {
              return SizeTransition(
                sizeFactor: animation,
                child: Card(
                  color: Colors.primaries[index % Colors.primaries.length],
                  child: ListTile(
                    title: Text(
                      'Item \${_list[index]}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'SliverFillRemaining',
    description: 'A sliver that fills the remaining space in the viewport.',
    category: WidgetCategory.scrolling,
    builder: (context) => SizedBox(
      height: 300,
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(title: Text('SliverFillRemaining'), pinned: true),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(title: Text('Item \$index')),
              childCount: 5,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              color: Colors.blue[100],
              child: const Center(
                child: Text('This fills the remaining space'),
              ),
            ),
          ),
        ],
      ),
    ),
    codeSnippet: '''
CustomScrollView(
  slivers: [
    const SliverAppBar(title: Text('SliverFillRemaining'), pinned: true),
    SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => ListTile(title: Text('Item \$index')),
        childCount: 5,
      ),
    ),
    SliverFillRemaining(
      hasScrollBody: false,
      child: Container(
        color: Colors.blue[100],
        child: const Center(
          child: Text('This fills the remaining space'),
        ),
      ),
    ),
  ],
)
''',
  ),
  WidgetInfo(
    name: 'SliverFillViewport',
    description:
        'A sliver that contains multiple box children that each fill the viewport.',
    category: WidgetCategory.scrolling,
    builder: (context) => SizedBox(
      height: 300,
      child: CustomScrollView(
        slivers: [
          SliverFillViewport(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                color: Colors.primaries[index % Colors.primaries.length],
                child: Center(child: Text('Page \$index')),
              ),
              childCount: 5,
            ),
          ),
        ],
      ),
    ),
    codeSnippet: '''
CustomScrollView(
  slivers: [
    SliverFillViewport(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Container(
          color: Colors.primaries[index % Colors.primaries.length],
          child: Center(child: Text('Page \$index')),
        ),
        childCount: 5,
      ),
    ),
  ],
)
''',
  ),
  WidgetInfo(
    name: 'SliverLayoutBuilder',
    description:
        'A sliver that builds a sliver that can depend on its layout constraints.',
    category: WidgetCategory.scrolling,
    builder: (context) => SizedBox(
      height: 300,
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(title: Text('SliverLayoutBuilder'), pinned: true),
          SliverLayoutBuilder(
            builder: (BuildContext context, SliverConstraints constraints) {
              if (constraints.userScrollDirection == ScrollDirection.forward) {
                return SliverToBoxAdapter(
                  child: Container(
                    color: Colors.green,
                    height: 100,
                    child: const Center(child: Text('Scrolling Up')),
                  ),
                );
              } else {
                return SliverToBoxAdapter(
                  child: Container(
                    color: Colors.red,
                    height: 100,
                    child: const Center(child: Text('Scrolling Down')),
                  ),
                );
              }
            },
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(title: Text('Item \$index')),
              childCount: 20,
            ),
          ),
        ],
      ),
    ),
    codeSnippet: '''
SliverLayoutBuilder(
  builder: (BuildContext context, SliverConstraints constraints) {
    return SliverToBoxAdapter(
      child: Center(
        child: Text('Max scroll extent: \${constraints.scrollOffset}'),
      ),
    );
  },
)
''',
  ),
  WidgetInfo(
    name: 'SliverMainAxisGroup',
    description:
        'A sliver that places multiple slivers in a linear array along the main axis.',
    category: WidgetCategory.scrolling,
    builder: (context) => const _SliverMainAxisGroupSample(),
    codeSnippet: '''
class _SliverMainAxisGroupSample extends StatelessWidget {
  const _SliverMainAxisGroupSample();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(title: Text('SliverMainAxisGroup'), pinned: true),
          SliverMainAxisGroup(
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: _MyHeaderDelegate(
                  minHeight: 40,
                  maxHeight: 60,
                  child: Container(
                    color: Colors.red,
                    alignment: Alignment.center,
                    child: const Text('Sticky Group Header', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(title: Text('Group Item \$index')),
                  childCount: 5,
                ),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(title: Text('Outside Group Item \$index')),
              childCount: 10,
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
    name: 'SliverCrossAxisGroup',
    description:
        'A sliver that places multiple slivers in a linear array along the cross axis.',
    category: WidgetCategory.scrolling,
    builder: (context) => const _SliverCrossAxisGroupSample(),
    codeSnippet: '''
class _SliverCrossAxisGroupSample extends StatelessWidget {
  const _SliverCrossAxisGroupSample();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(title: Text('SliverCrossAxisGroup'), pinned: true),
          SliverCrossAxisGroup(
            slivers: [
              SliverConstrainedCrossAxis(
                maxExtent: 100,
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Container(
                      height: 50,
                      color: Colors.amber[100 * (index % 9 + 1)],
                      alignment: Alignment.center,
                      child: Text('Left \$index'),
                    ),
                    childCount: 10,
                  ),
                ),
              ),
              SliverCrossAxisExpanded(
                flex: 2,
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Container(
                      height: 50,
                      color: Colors.teal[100 * (index % 9 + 1)],
                      alignment: Alignment.center,
                      child: Text('Right \$index'),
                    ),
                    childCount: 15,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'ScrollConfiguration',
    description: 'Controls how a Scrollable widget behaves.',
    category: WidgetCategory.scrolling,
    builder: (context) => const _ScrollConfigurationSample(),
    codeSnippet: '''
class _ScrollConfigurationSample extends StatelessWidget {
  const _ScrollConfigurationSample();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          scrollbars: false,
          overscroll: false,
        ),
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) => ListTile(
            title: Text('Item \$index (No Scrollbar/Glow)'),
          ),
        ),
      ),
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'SliverFadeTransition',
    description: 'Animates the opacity of a sliver.',
    category: WidgetCategory.scrolling,
    builder: (context) => const _SliverFadeTransitionSample(),
    codeSnippet: '''
class _SliverFadeTransitionSample extends StatefulWidget {
  const _SliverFadeTransitionSample();

  @override
  State<_SliverFadeTransitionSample> createState() =>
      _SliverFadeTransitionSampleState();
}

class _SliverFadeTransitionSampleState
    extends State<_SliverFadeTransitionSample>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(title: Text('SliverFadeTransition'), pinned: true),
          SliverFadeTransition(
            opacity: _animation,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                  color: Colors.indigo,
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text('Fading Item \$index',
                          style: const TextStyle(color: Colors.white))),
                ),
                childCount: 5,
              ),
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
    name: 'SliverIgnorePointer',
    description: 'A sliver that is invisible directly during hit testing.',
    category: WidgetCategory.scrolling,
    builder: (context) => const _SliverIgnorePointerSample(),
    codeSnippet: '''
class _SliverIgnorePointerSample extends StatefulWidget {
  const _SliverIgnorePointerSample();

  @override
  State<_SliverIgnorePointerSample> createState() => _SliverIgnorePointerSampleState();
}

class _SliverIgnorePointerSampleState extends State<_SliverIgnorePointerSample> {
  bool _ignoring = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _ignoring = !_ignoring;
                });
              },
              child: Text(_ignoring ? 'Enable Click' : 'Disable Click'),
            ),
          ),
          SliverIgnorePointer(
            ignoring: _ignoring,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(
                  title: Text('Item \$index (\${_ignoring ? "Ignored" : "Clickable"})'),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Clicked Item \$index')),
                    );
                  },
                ),
                childCount: 5,
              ),
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
    name: 'SliverSafeArea',
    description:
        'A sliver that insets its child by sufficient padding to avoid operating system intrusions.',
    category: WidgetCategory.scrolling,
    builder: (context) => const _SliverSafeAreaSample(),
    codeSnippet: '''
SliverSafeArea(
  sliver: SliverList(
    delegate: SliverChildListDelegate([
      Container(
        height: 100,
        color: Colors.orange,
        child: const Center(
          child: Text('This sliver avoids system intrusions.'),
        ),
      ),
    ]),
  ),
)
''',
  ),
];

class _ListWheelScrollViewSample extends StatelessWidget {
  const _ListWheelScrollViewSample();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListWheelScrollView(
        itemExtent: 50,
        children: List.generate(
          20,
          (index) => Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.primaries[index % Colors.primaries.length],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text('Item $index', style: const TextStyle(fontSize: 20)),
          ),
        ),
      ),
    );
  }
}

class _DraggableScrollableSheetSample extends StatelessWidget {
  const _DraggableScrollableSheetSample();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Stack(
        children: [
          Container(color: Colors.grey[300]),
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.1,
            maxChildSize: 0.9,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                color: Colors.blue[100],
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 25,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(title: Text('Item $index'));
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _NotificationListenerSample extends StatefulWidget {
  const _NotificationListenerSample();

  @override
  State<_NotificationListenerSample> createState() =>
      _NotificationListenerSampleState();
}

class _NotificationListenerSampleState
    extends State<_NotificationListenerSample> {
  String _notification = 'Scroll to see notifications';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(_notification),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              setState(() {
                if (notification is ScrollStartNotification) {
                  _notification = 'Scroll started';
                } else if (notification is ScrollEndNotification) {
                  _notification = 'Scroll ended';
                }
              });
              return true;
            },
            child: ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) =>
                  ListTile(title: Text('Item $index')),
            ),
          ),
        ),
      ],
    );
  }
}

class _NestedScrollViewSample extends StatelessWidget {
  const _NestedScrollViewSample();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: const Text('NestedScrollView'),
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
            ),
          ];
        },
        body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 50,
              child: Center(child: Text('Item $index')),
            );
          },
        ),
      ),
    );
  }
}

class _ScrollbarSample extends StatefulWidget {
  const _ScrollbarSample();

  @override
  State<_ScrollbarSample> createState() => _ScrollbarSampleState();
}

class _ScrollbarSampleState extends State<_ScrollbarSample> {
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Scrollbar(
        controller: _controller,
        thumbVisibility: true,
        child: ListView.builder(
          controller: _controller,
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(title: Text('Item $index'));
          },
        ),
      ),
    );
  }
}

class _ReorderableListViewSample extends StatefulWidget {
  const _ReorderableListViewSample();

  @override
  State<_ReorderableListViewSample> createState() =>
      _ReorderableListViewSampleState();
}

class _ReorderableListViewSampleState
    extends State<_ReorderableListViewSample> {
  final List<int> _items = List<int>.generate(5, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ReorderableListView(
        children: <Widget>[
          for (int index = 0; index < _items.length; index += 1)
            ListTile(key: Key('$index'), title: Text('Item ${_items[index]}')),
        ],
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final int item = _items.removeAt(oldIndex);
            _items.insert(newIndex, item);
          });
        },
      ),
    );
  }
}

class _SliverPersistentHeaderSample extends StatelessWidget {
  const _SliverPersistentHeaderSample();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: _MyHeaderDelegate(
              minHeight: 60.0,
              maxHeight: 150.0,
              child: Container(
                color: Colors.blue,
                alignment: Alignment.center,
                child: const Text(
                  'Sticky Header',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(title: Text('Item $index')),
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class _MyHeaderDelegate extends SliverPersistentHeaderDelegate {
  _MyHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_MyHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class _SliverOpacitySample extends StatelessWidget {
  const _SliverOpacitySample();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(title: Text('SliverOpacity'), pinned: true),
          SliverOpacity(
            opacity: 0.5,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((
                BuildContext context,
                int index,
              ) {
                return Container(
                  color: index.isEven ? Colors.blue : Colors.green,
                  height: 50.0,
                  child: Center(
                    child: Text(
                      'Item \$index (50% Opacity)',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }, childCount: 5),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              return Container(
                color: index.isEven ? Colors.blue : Colors.green,
                height: 50.0,
                child: Center(
                  child: Text(
                    'Item \${index + 5} (100% Opacity)',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            }, childCount: 5),
          ),
        ],
      ),
    );
  }
}

class _SliverAnimatedListSample extends StatefulWidget {
  const _SliverAnimatedListSample();

  @override
  State<_SliverAnimatedListSample> createState() =>
      _SliverAnimatedListSampleState();
}

class _SliverAnimatedListSampleState extends State<_SliverAnimatedListSample> {
  final GlobalKey<SliverAnimatedListState> _listKey =
      GlobalKey<SliverAnimatedListState>();
  final List<int> _list = <int>[0, 1, 2];
  int _nextItem = 3;

  void _insert() {
    final int index = _list.length;
    _list.insert(index, _nextItem++);
    _listKey.currentState!.insertItem(index);
  }

  void _remove() {
    if (_list.isNotEmpty) {
      final int index = _list.length - 1;
      final int item = _list.removeAt(index);
      _listKey.currentState!.removeItem(index, (
        BuildContext context,
        Animation<double> animation,
      ) {
        return SizeTransition(
          sizeFactor: animation,
          child: Card(
            color: Colors.red,
            child: ListTile(
              title: Text(
                'Item $item',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: const Text('SliverAnimatedList'),
            pinned: true,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.add_circle),
                onPressed: _insert,
                tooltip: 'Insert a new item',
              ),
              IconButton(
                icon: const Icon(Icons.remove_circle),
                onPressed: _remove,
                tooltip: 'Remove the last item',
              ),
            ],
          ),
          SliverAnimatedList(
            key: _listKey,
            initialItemCount: _list.length,
            itemBuilder:
                (BuildContext context, int index, Animation<double> animation) {
                  return SizeTransition(
                    sizeFactor: animation,
                    child: Card(
                      color: Colors.primaries[index % Colors.primaries.length],
                      child: ListTile(
                        title: Text(
                          'Item \${_list[index]}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
          ),
        ],
      ),
    );
  }
}

class _SliverMainAxisGroupSample extends StatelessWidget {
  const _SliverMainAxisGroupSample();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(title: Text('SliverMainAxisGroup'), pinned: true),
          SliverMainAxisGroup(
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: _MyHeaderDelegate(
                  minHeight: 40,
                  maxHeight: 60,
                  child: Container(
                    color: Colors.red,
                    alignment: Alignment.center,
                    child: const Text(
                      'Sticky Group Header',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) =>
                      ListTile(title: Text('Group Item $index')),
                  childCount: 5,
                ),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) =>
                  ListTile(title: Text('Outside Group Item $index')),
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class _SliverCrossAxisGroupSample extends StatelessWidget {
  const _SliverCrossAxisGroupSample();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(title: Text('SliverCrossAxisGroup'), pinned: true),
          SliverCrossAxisGroup(
            slivers: [
              SliverConstrainedCrossAxis(
                maxExtent: 100,
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Container(
                      height: 50,
                      color: Colors.amber[100 * (index % 9 + 1)],
                      alignment: Alignment.center,
                      child: Text('Left $index'),
                    ),
                    childCount: 10,
                  ),
                ),
              ),
              SliverCrossAxisExpanded(
                flex: 2,
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Container(
                      height: 50,
                      color: Colors.teal[100 * (index % 9 + 1)],
                      alignment: Alignment.center,
                      child: Text('Right $index'),
                    ),
                    childCount: 15,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ScrollConfigurationSample extends StatelessWidget {
  const _ScrollConfigurationSample();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(
          context,
        ).copyWith(scrollbars: false, overscroll: false),
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) =>
              ListTile(title: Text('Item $index (No Scrollbar/Glow)')),
        ),
      ),
    );
  }
}

class _SliverFadeTransitionSample extends StatefulWidget {
  const _SliverFadeTransitionSample();

  @override
  State<_SliverFadeTransitionSample> createState() =>
      _SliverFadeTransitionSampleState();
}

class _SliverFadeTransitionSampleState
    extends State<_SliverFadeTransitionSample>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(title: Text('SliverFadeTransition'), pinned: true),
          SliverFadeTransition(
            opacity: _animation,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                  color: Colors.indigo,
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'Fading Item $index',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                childCount: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SliverIgnorePointerSample extends StatefulWidget {
  const _SliverIgnorePointerSample();

  @override
  State<_SliverIgnorePointerSample> createState() =>
      _SliverIgnorePointerSampleState();
}

class _SliverIgnorePointerSampleState
    extends State<_SliverIgnorePointerSample> {
  bool _ignoring = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _ignoring = !_ignoring;
                });
              },
              child: Text(_ignoring ? 'Enable Click' : 'Disable Click'),
            ),
          ),
          SliverIgnorePointer(
            ignoring: _ignoring,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(
                  title: Text(
                    'Item $index (${_ignoring ? "Ignored" : "Clickable"})',
                  ),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Clicked Item $index')),
                    );
                  },
                ),
                childCount: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SliverSafeAreaSample extends StatelessWidget {
  const _SliverSafeAreaSample();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: CustomScrollView(
        slivers: [
          SliverSafeArea(
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  height: 100,
                  color: Colors.orange,
                  child: const Center(
                    child: Text(
                      'This sliver avoids system intrusions.',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(height: 500, color: Colors.blue[100]),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// AUDIT BATCH 3 – Scrolling & Sliver Widgets
// ─────────────────────────────────────────────────────────────────────────────

final List<WidgetInfo> scrollingWidgetsExtra = [
  // 1 ─────────────────────────────────────────
  WidgetInfo(
    name: 'SliverList',
    description:
        'A sliver that places multiple box children in a linear array.',
    category: WidgetCategory.scrolling,
    builder: (context) => const _AuditSliverListSample(),
    codeSnippet: '''
CustomScrollView(
  slivers: [
    SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Container(
          height: 50,
          color: Colors.blue[100 * (index % 9)],
          child: Center(child: Text('Item \$index')),
        ),
        childCount: 20,
      ),
    ),
  ],
)
''',
  ),

  // 2 ─────────────────────────────────────────
  WidgetInfo(
    name: 'SliverPrototypeExtentList',
    description:
        'A sliver that places its children in a linear array with the same extent as a prototype widget.',
    category: WidgetCategory.scrolling,
    builder: (context) => const _AuditSliverPrototypeSample(),
    codeSnippet: '''
SliverPrototypeExtentList(
  prototypeItem: const ListTile(title: Text('Prototype')),
  delegate: SliverChildBuilderDelegate(
    (context, index) => ListTile(title: Text('Item \$index')),
    childCount: 20,
  ),
)
''',
  ),

  // 3 ─────────────────────────────────────────
  WidgetInfo(
    name: 'TwoDimensionalScrollView',
    description: 'A widget for scrolling in two dimensions.',
    category: WidgetCategory.scrolling,
    builder: (context) => const _AuditTwoDimensionalSample(),
    codeSnippet: '''
// Simplified representation of a 2D Scroll View implementation
TwoDimensionalScrollView(
  viewportBuilder: (context, verticalOffset, horizontalOffset) {
    return RenderTwoDimensionalViewport(
      // Implement required configuration
    );
  },
)
''',
  ),

  // 4 ─────────────────────────────────────────
  WidgetInfo(
    name: 'SliverConstrainedCrossAxis',
    description: 'A sliver that constrains its child\'s cross-axis size.',
    category: WidgetCategory.scrolling,
    builder: (context) => const _AuditSliverConstrainedSample(),
    codeSnippet: '''
SliverConstrainedCrossAxis(maxExtent: 200, sliver: SliverToBoxAdapter(child: Container(color: Colors.red, height: 100)))
''',
  ),

  // 5 ─────────────────────────────────────────
  WidgetInfo(
    name: 'SliverAnimatedGrid',
    description:
        'A sliver that animates items as they are added or removed from a grid.',
    category: WidgetCategory.scrolling,
    builder: (context) => const _AuditSliverAnimatedGridSample(),
    codeSnippet: '''
SliverAnimatedGrid(
  initialItemCount: _items.length,
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
  itemBuilder: (context, index, animation) => 
      ScaleTransition(scale: animation, child: GridItem(index)),
)
''',
  ),
];

// ─── Stateful helpers for audit batch 3 ──────────────────────────────────────

class _AuditSliverListSample extends StatelessWidget {
  const _AuditSliverListSample();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                height: 50,
                color: Colors.teal[100 * ((index % 8) + 1)],
                child: Center(child: Text('Sliver List Item $index')),
              ),
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class _AuditSliverPrototypeSample extends StatelessWidget {
  const _AuditSliverPrototypeSample();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: CustomScrollView(
        slivers: [
          SliverPrototypeExtentList(
            prototypeItem: const ListTile(
              leading: Icon(Icons.star),
              title: Text('Prototype Height'),
              subtitle: Text('Items will match this size'),
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                leading: CircleAvatar(child: Text('$index')),
                title: Text('Prototype Item $index'),
                subtitle: const Text('Matching extent height'),
              ),
              childCount: 15,
            ),
          ),
        ],
      ),
    );
  }
}

class _AuditTwoDimensionalSample extends StatelessWidget {
  const _AuditTwoDimensionalSample();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.grid_4x4, size: 60, color: Colors.blue),
            const SizedBox(height: 16),
            const Text(
              'TwoDimensionalScrollView',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'This is a base class for widgets that scroll in two dimensions. '
                'It provides the framework for complex layouts like spreadsheet grids.',
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('View Documentation'),
            ),
          ],
        ),
      ),
    );
  }
}

class _AuditSliverConstrainedSample extends StatelessWidget {
  const _AuditSliverConstrainedSample();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: CustomScrollView(
        slivers: [
          SliverConstrainedCrossAxis(
            maxExtent: 250,
            sliver: SliverToBoxAdapter(
              child: Container(
                color: Colors.orange.withAlpha(200),
                height: 100,
                child: const Center(
                  child: Text('Constrained Cross Axis (Max 250)'),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.blue.withAlpha(200),
              height: 50,
              child: const Center(child: Text('Full Width Sliver')),
            ),
          ),
        ],
      ),
    );
  }
}

class _AuditSliverAnimatedGridSample extends StatefulWidget {
  const _AuditSliverAnimatedGridSample();

  @override
  State<_AuditSliverAnimatedGridSample> createState() =>
      _AuditSliverAnimatedGridSampleState();
}

class _AuditSliverAnimatedGridSampleState
    extends State<_AuditSliverAnimatedGridSample> {
  final GlobalKey<SliverAnimatedGridState> _gridKey =
      GlobalKey<SliverAnimatedGridState>();
  final List<int> _items = [0, 1, 2, 3, 4, 5];
  int _counter = 6;

  void _addItem() {
    final index = _items.length;
    _items.add(_counter++);
    _gridKey.currentState?.insertItem(index);
  }

  void _removeItem() {
    if (_items.isNotEmpty) {
      final index = _items.length - 1;
      final item = _items.removeAt(index);
      _gridKey.currentState?.removeItem(
        index,
        (context, animation) => _buildItem(item, animation),
      );
    }
  }

  Widget _buildItem(int item, Animation<double> animation) {
    return ScaleTransition(
      scale: animation,
      child: Card(
        color: Colors.purple[100 * ((item % 8) + 1)],
        child: Center(child: Text('Item $item')),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _addItem,
                child: const Text('Add Item'),
              ),
              ElevatedButton(
                onPressed: _removeItem,
                child: const Text('Remove Item'),
              ),
            ],
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAnimatedGrid(
                  key: _gridKey,
                  initialItemCount: _items.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index, animation) {
                    return _buildItem(_items[index], animation);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
