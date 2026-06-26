import 'package:flutter/material.dart';
import '../../models/widget_info.dart';

final List<WidgetInfo> animationWidgets = [
  WidgetInfo(
    name: 'AnimatedContainer',
    description:
        'A container that gradually changes its values over a period of time.',
    category: WidgetCategory.animation,
    builder: (context) => const _AnimatedContainerSample(),
    codeSnippet: '''
class _AnimatedContainerSample extends StatefulWidget {
  const _AnimatedContainerSample();

  @override
  State<_AnimatedContainerSample> createState() => _AnimatedContainerSampleState();
}

class _AnimatedContainerSampleState extends State<_AnimatedContainerSample> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: AnimatedContainer(
        width: selected ? 200.0 : 100.0,
        height: selected ? 100.0 : 200.0,
        color: selected ? Colors.red : Colors.blue,
        alignment: selected ? Alignment.center : AlignmentDirectional.topCenter,
        duration: const Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
        child: const FlutterLogo(size: 75),
      ),
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'AnimatedOpacity',
    description:
        'Animated version of Opacity which automatically transitions the child\'s opacity over a given duration.',
    category: WidgetCategory.animation,
    builder: (context) => const _AnimatedOpacitySample(),
    codeSnippet: '''
class _AnimatedOpacitySample extends StatefulWidget {
  const _AnimatedOpacitySample();

  @override
  State<_AnimatedOpacitySample> createState() => _AnimatedOpacitySampleState();
}

class _AnimatedOpacitySampleState extends State<_AnimatedOpacitySample> {
  double opacityLevel = 1.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedOpacity(
          opacity: opacityLevel,
          duration: const Duration(seconds: 1),
          child: const FlutterLogo(size: 50),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              opacityLevel = opacityLevel == 0 ? 1.0 : 0.0;
            });
          },
          child: const Text('Fade Logo'),
        ),
      ],
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'AnimatedSwitcher',
    description:
        'A widget that automatically transitions between a new child and the previous child.',
    category: WidgetCategory.animation,
    builder: (context) => const _AnimatedSwitcherSample(),
    codeSnippet: '''
class _AnimatedSwitcherSample extends StatefulWidget {
  const _AnimatedSwitcherSample();

  @override
  State<_AnimatedSwitcherSample> createState() => _AnimatedSwitcherSampleState();
}

class _AnimatedSwitcherSampleState extends State<_AnimatedSwitcherSample> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(scale: animation, child: child);
          },
          child: Text(
            '\$_count',
            key: ValueKey<int>(_count),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        ElevatedButton(
          child: const Text('Increment'),
          onPressed: () {
            setState(() {
              _count += 1;
            });
          },
        ),
      ],
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'AnimatedCrossFade',
    description:
        'A widget that cross-fades between two given children and animates itself between their sizes.',
    category: WidgetCategory.animation,
    builder: (context) => const _AnimatedCrossFadeSample(),
    codeSnippet: '''
class _AnimatedCrossFadeSample extends StatefulWidget {
  const _AnimatedCrossFadeSample();

  @override
  State<_AnimatedCrossFadeSample> createState() => _AnimatedCrossFadeSampleState();
}

class _AnimatedCrossFadeSampleState extends State<_AnimatedCrossFadeSample> {
  bool _first = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedCrossFade(
          duration: const Duration(seconds: 1),
          firstChild: const FlutterLogo(style: FlutterLogoStyle.horizontal, size: 100.0),
          secondChild: const FlutterLogo(style: FlutterLogoStyle.stacked, size: 100.0),
          crossFadeState: _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        ),
        ElevatedButton(
          child: const Text('Toggle'),
          onPressed: () {
            setState(() {
              _first = !_first;
            });
          },
        ),
      ],
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'AnimatedPositioned',
    description:
        'Animated version of Positioned which automatically transitions the child\'s position over a given duration.',
    category: WidgetCategory.animation,
    builder: (context) => const _AnimatedPositionedSample(),
    codeSnippet: '''
class _AnimatedPositionedSample extends StatefulWidget {
  const _AnimatedPositionedSample();

  @override
  State<_AnimatedPositionedSample> createState() => _AnimatedPositionedSampleState();
}

class _AnimatedPositionedSampleState extends State<_AnimatedPositionedSample> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            width: _selected ? 200.0 : 50.0,
            height: _selected ? 50.0 : 200.0,
            top: _selected ? 50.0 : 150.0,
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selected = !_selected;
                });
              },
              child: Container(
                color: Colors.blue,
                child: const Center(child: Text('Tap me')),
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
    name: 'AnimatedBuilder',
    description: 'A general-purpose widget for building animations.',
    category: WidgetCategory.animation,
    builder: (context) => const _AnimatedBuilderSample(),
    codeSnippet: '''
class _AnimatedBuilderSample extends StatefulWidget {
  const _AnimatedBuilderSample();

  @override
  State<_AnimatedBuilderSample> createState() => _AnimatedBuilderSampleState();
}

class _AnimatedBuilderSampleState extends State<_AnimatedBuilderSample> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: Container(
        width: 100.0,
        height: 100.0,
        color: Colors.green,
        child: const Center(child: Text('Whee!')),
      ),
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: _controller.value * 2.0 * 3.14159,
          child: child,
        );
      },
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'AnimatedAlign',
    description:
        'Animated version of Align which automatically transitions the child\'s position over a given duration.',
    category: WidgetCategory.animation,
    builder: (context) => const _AnimatedAlignSample(),
    codeSnippet: '''
class _AnimatedAlignSample extends StatefulWidget {
  const _AnimatedAlignSample();

  @override
  State<_AnimatedAlignSample> createState() => _AnimatedAlignSampleState();
}

class _AnimatedAlignSampleState extends State<_AnimatedAlignSample> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selected = !_selected;
        });
      },
      child: Container(
        width: 200,
        height: 200,
        color: Colors.grey.shade300,
        child: AnimatedAlign(
          alignment: _selected ? Alignment.topRight : Alignment.bottomLeft,
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          child: const FlutterLogo(size: 50.0),
        ),
      ),
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'AnimatedList',
    description:
        'A scrolling container that animates items when they are inserted or removed.',
    category: WidgetCategory.animation,
    builder: (context) => const _AnimatedListSample(),
    codeSnippet: '''
class _AnimatedListSample extends StatefulWidget {
  const _AnimatedListSample();

  @override
  State<_AnimatedListSample> createState() => _AnimatedListSampleState();
}

class _AnimatedListSampleState extends State<_AnimatedListSample> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late ListModel<int> _list;
  int? _selectedItem;
  int _nextItem = 3;

  @override
  void initState() {
    super.initState();
    _list = ListModel<int>(
      listKey: _listKey,
      initialItems: <int>[0, 1, 2],
      removedItemBuilder: _buildRemovedItem,
    );
  }

  // Used to build list items that haven't been removed.
  Widget _buildItem(BuildContext context, int index, Animation<double> animation) {
    return CardItem(
      animation: animation,
      item: _list[index],
      selected: _selectedItem == _list[index],
      onTap: () {
        setState(() {
          _selectedItem = _selectedItem == _list[index] ? null : _list[index];
        });
      },
    );
  }

  // Used to build an item after it has been removed from the list. This
  // method is needed because a removed item remains visible until its
  // animation has completed (even though it's gone as far this ListModel is
  // concerned).
  // The widget will be used by the [AnimatedListState.removeItem] method's
  // [AnimatedListRemovedItemBuilder] parameter.
  Widget _buildRemovedItem(int item, BuildContext context, Animation<double> animation) {
    return CardItem(
      animation: animation,
      item: item,
      // No gesture detector here: we don't want removed items to be interactive.
    );
  }

  void _insert() {
    final int index = _selectedItem == null ? _list.length : _list.indexOf(_selectedItem!);
    _list.insert(index, _nextItem++);
  }

  void _remove() {
    if (_selectedItem != null) {
      _list.removeAt(_list.indexOf(_selectedItem!));
      setState(() {
        _selectedItem = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.add_circle),
                onPressed: _insert,
                tooltip: 'insert a new item',
              ),
              IconButton(
                icon: const Icon(Icons.remove_circle),
                onPressed: _remove,
                tooltip: 'remove the selected item',
              ),
            ],
          ),
          Expanded(
            child: AnimatedList(
              key: _listKey,
              initialItemCount: _list.length,
              itemBuilder: _buildItem,
            ),
          ),
        ],
      ),
    );
  }
}

class ListModel<E> {
  ListModel({
    required this.listKey,
    required this.removedItemBuilder,
    Iterable<E>? initialItems,
  }) : _items = List<E>.from(initialItems ?? <E>[]);

  final GlobalKey<AnimatedListState> listKey;
  final dynamic removedItemBuilder;
  final List<E> _items;

  AnimatedListState? get _animatedList => listKey.currentState;

  void insert(int index, E item) {
    _items.insert(index, item);
    _animatedList!.insertItem(index);
  }

  E removeAt(int index) {
    final E removedItem = _items.removeAt(index);
    if (removedItem != null) {
      _animatedList!.removeItem(
        index,
        (BuildContext context, Animation<double> animation) {
          return removedItemBuilder(removedItem, context, animation);
        },
      );
    }
    return removedItem;
  }

  int get length => _items.length;

  E operator [](int index) => _items[index];

  int indexOf(E item) => _items.indexOf(item);
}

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    this.onTap,
    this.selected = false,
    required this.animation,
    required this.item,
  });

  final VoidCallback? onTap;
  final bool selected;
  final Animation<double> animation;
  final int item;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headlineMedium!;
    if (selected) {
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
    }
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizeTransition(
        sizeFactor: animation,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: SizedBox(
            height: 80.0,
            child: Card(
              color: Colors.primaries[item % Colors.primaries.length],
              child: Center(
                child: Text('Item \$item', style: textStyle),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'Hero',
    description:
        'A widget that marks its child as being a candidate for hero animations.',
    category: WidgetCategory.animation,
    builder: (context) => const _HeroSample(),
    codeSnippet: '''
class _HeroSample extends StatelessWidget {
  const _HeroSample();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 20.0),
        ListTile(
          leading: Hero(
            tag: 'hero-rectangle',
            child: Container(
              width: 50,
              height: 50,
              color: Colors.blue,
            ),
          ),
          onTap: () => _gotoDetailsPage(context),
          title: const Text(
            'Tap on the icon to view hero animation transition.',
          ),
        ),
      ],
    );
  }

  void _gotoDetailsPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Second Page'),
        ),
        body: Center(
          child: Hero(
            tag: 'hero-rectangle',
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    ));
  }
}
''',
  ),
  WidgetInfo(
    name: 'AnimatedDefaultTextStyle',
    description:
        'Animated version of DefaultTextStyle which automatically transitions the default text style (the text style to apply to descendant Text widgets without explicit style) over a given duration.',
    category: WidgetCategory.animation,
    builder: (context) => const _AnimatedDefaultTextStyleSample(),
    codeSnippet: '''
class _AnimatedDefaultTextStyleSample extends StatefulWidget {
  const _AnimatedDefaultTextStyleSample();

  @override
  State<_AnimatedDefaultTextStyleSample> createState() => _AnimatedDefaultTextStyleSampleState();
}

class _AnimatedDefaultTextStyleSampleState extends State<_AnimatedDefaultTextStyleSample> {
  bool _first = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: 120,
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            style: TextStyle(
              fontSize: _first ? 20 : 50,
              color: _first ? Colors.blue : Colors.red,
              fontWeight: _first ? FontWeight.w100 : FontWeight.bold,
            ),
            child: const Text('Flutter'),
          ),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              _first = !_first;
            });
          },
          child: const Text(
            'Switch',
          ),
        ),
      ],
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'FadeTransition',
    description: 'Animates the opacity of a widget.',
    category: WidgetCategory.animation,
    builder: (context) => const _FadeTransitionSample(),
    codeSnippet: '''
class _FadeTransitionSample extends StatefulWidget {
  const _FadeTransitionSample();

  @override
  State<_FadeTransitionSample> createState() => _FadeTransitionSampleState();
}

class _FadeTransitionSampleState extends State<_FadeTransitionSample> with TickerProviderStateMixin {
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
    return Container(
      color: Colors.white,
      child: FadeTransition(
        opacity: _animation,
        child: const Padding(padding: EdgeInsets.all(8), child: FlutterLogo(size: 100.0)),
      ),
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'ScaleTransition',
    description: 'Animates the scale of a transformed widget.',
    category: WidgetCategory.animation,
    builder: (context) => const _ScaleTransitionSample(),
    codeSnippet: '''
class _ScaleTransitionSample extends StatefulWidget {
  const _ScaleTransitionSample();

  @override
  State<_ScaleTransitionSample> createState() => _ScaleTransitionSampleState();
}

class _ScaleTransitionSampleState extends State<_ScaleTransitionSample> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: FlutterLogo(size: 100.0),
      ),
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'SlideTransition',
    description:
        'Animates the position of a widget relative to its normal position.',
    category: WidgetCategory.animation,
    builder: (context) => const _SlideTransitionSample(),
    codeSnippet: '''
class _SlideTransitionSample extends StatefulWidget {
  const _SlideTransitionSample();

  @override
  State<_SlideTransitionSample> createState() => _SlideTransitionSampleState();
}

class _SlideTransitionSampleState extends State<_SlideTransitionSample> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticIn,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: FlutterLogo(size: 100.0),
      ),
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'RotationTransition',
    description: 'Animates the rotation of a widget.',
    category: WidgetCategory.animation,
    builder: (context) => const _RotationTransitionSample(),
    codeSnippet: '''
class _RotationTransitionSample extends StatefulWidget {
  const _RotationTransitionSample();

  @override
  State<_RotationTransitionSample> createState() => _RotationTransitionSampleState();
}

class _RotationTransitionSampleState extends State<_RotationTransitionSample> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: FlutterLogo(size: 100.0),
      ),
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'AnimatedPadding',
    description:
        'Animated version of Padding which automatically transitions the padding over a given duration.',
    category: WidgetCategory.animation,
    builder: (context) => const _AnimatedPaddingSample(),
    codeSnippet: '''
class _AnimatedPaddingSample extends StatefulWidget {
  const _AnimatedPaddingSample();

  @override
  State<_AnimatedPaddingSample> createState() => _AnimatedPaddingSampleState();
}

class _AnimatedPaddingSampleState extends State<_AnimatedPaddingSample> {
  double _padding = 8.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedPadding(
          padding: EdgeInsets.all(_padding),
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
          child: Container(
            color: Colors.blue,
            child: const FlutterLogo(size: 50),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _padding = _padding == 8.0 ? 40.0 : 8.0;
            });
          },
          child: const Text('Toggle Padding'),
        ),
      ],
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'TweenAnimationBuilder',
    description:
        'Widget builder that animates a property of a Widget to a target value.',
    category: WidgetCategory.animation,
    builder: (context) => const _TweenAnimationBuilderSample(),
    codeSnippet: '''
class _TweenAnimationBuilderSample extends StatefulWidget {
  const _TweenAnimationBuilderSample();

  @override
  State<_TweenAnimationBuilderSample> createState() => _TweenAnimationBuilderSampleState();
}

class _TweenAnimationBuilderSampleState extends State<_TweenAnimationBuilderSample> {
  double _targetValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: _targetValue),
          duration: const Duration(seconds: 1),
          builder: (BuildContext context, double value, Widget? child) {
            return Transform.rotate(
              angle: value * 2 * 3.14159,
              child: child,
            );
          },
          child: const FlutterLogo(size: 100),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _targetValue = _targetValue == 0.0 ? 1.0 : 0.0;
            });
          },
          child: const Text('Rotate'),
        ),
      ],
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'AnimatedIcon',
    description: 'A widget that shows an animated icon.',
    category: WidgetCategory.animation,
    builder: (context) => const _AnimatedIconSample(),
    codeSnippet: '''
class _AnimatedIconSample extends StatefulWidget {
  const _AnimatedIconSample();

  @override
  State<_AnimatedIconSample> createState() => _AnimatedIconSampleState();
}

class _AnimatedIconSampleState extends State<_AnimatedIconSample> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleOnPressed() {
    setState(() {
      _isPlaying = !_isPlaying;
      if (_isPlaying) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 50,
      icon: AnimatedIcon(
        icon: AnimatedIcons.play_pause,
        progress: _controller,
      ),
      onPressed: _handleOnPressed,
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'SizeTransition',
    description: 'Animates its own size and clips its child.',
    category: WidgetCategory.animation,
    builder: (context) => const _SizeTransitionSample(),
    codeSnippet: '''
class _SizeTransitionSample extends StatefulWidget {
  const _SizeTransitionSample();

  @override
  State<_SizeTransitionSample> createState() => _SizeTransitionSampleState();
}

class _SizeTransitionSampleState extends State<_SizeTransitionSample> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _animation,
      axis: Axis.horizontal,
      axisAlignment: -1,
      child: const Center(
        child: FlutterLogo(size: 200.0),
      ),
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'DecoratedBoxTransition',
    description: 'Animates the properties of a DecoratedBox.',
    category: WidgetCategory.animation,
    builder: (context) => const _DecoratedBoxTransitionSample(),
    codeSnippet: '''
class _DecoratedBoxTransitionSample extends StatefulWidget {
  const _DecoratedBoxTransitionSample();

  @override
  State<_DecoratedBoxTransitionSample> createState() => _DecoratedBoxTransitionSampleState();
}

class _DecoratedBoxTransitionSampleState extends State<_DecoratedBoxTransitionSample> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat(reverse: true);
  late final DecorationTween _decorationTween = DecorationTween(
    begin: BoxDecoration(
      color: const Color(0xFFFFFFFF),
      border: Border.all(style: BorderStyle.none),
      borderRadius: BorderRadius.circular(60.0),
      boxShadow: const <BoxShadow>[
        BoxShadow(
          color: Color(0x66666666),
          blurRadius: 10.0,
          spreadRadius: 3.0,
          offset: Offset(0, 6.0),
        ),
      ],
    ),
    end: BoxDecoration(
      color: const Color(0xFFFFFFFF),
      border: Border.all(
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.zero,
      // No shadow.
    ),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Center(
        child: DecoratedBoxTransition(
          decoration: _decorationTween.animate(_controller),
          child: Container(
            width: 200,
            height: 200,
            padding: const EdgeInsets.all(10),
            child: const FlutterLogo(),
          ),
        ),
      ),
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'AnimatedPhysicalModel',
    description: 'Animated version of PhysicalModel.',
    category: WidgetCategory.animation,
    builder: (context) => const _AnimatedPhysicalModelSample(),
    codeSnippet: '''
class _AnimatedPhysicalModelSample extends StatefulWidget {
  const _AnimatedPhysicalModelSample();

  @override
  State<_AnimatedPhysicalModelSample> createState() => _AnimatedPhysicalModelSampleState();
}

class _AnimatedPhysicalModelSampleState extends State<_AnimatedPhysicalModelSample> {
  bool _first = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AnimatedPhysicalModel(
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          elevation: _first ? 0 : 10.0,
          shape: BoxShape.rectangle,
          shadowColor: Colors.black,
          color: _first ? Colors.blue : Colors.red,
          borderRadius: _first ? const BorderRadius.all(Radius.circular(0)) : const BorderRadius.all(Radius.circular(20)),
          child: Container(
            height: 120.0,
            width: 120.0,
            color: Colors.blue[50],
            child: const Center(child: Text('Click me!')),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          child: const Text('Animate'),
          onPressed: () {
            setState(() {
              _first = !_first;
            });
          },
        ),
      ],
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'AlignTransition',
    description: 'Animated version of Align.',
    category: WidgetCategory.animation,
    builder: (context) => const _AlignTransitionSample(),
    codeSnippet: '''
class _AlignTransitionSample extends StatefulWidget {
  const _AlignTransitionSample();

  @override
  State<_AlignTransitionSample> createState() => _AlignTransitionSampleState();
}

class _AlignTransitionSampleState extends State<_AlignTransitionSample> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<AlignmentGeometry> _animation = Tween<AlignmentGeometry>(
    begin: Alignment.bottomLeft,
    end: Alignment.center,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.decelerate,
    ),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: AlignTransition(
        alignment: _animation,
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: FlutterLogo(size: 150.0),
        ),
      ),
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'CompositedTransformTarget',
    description:
        'A widget that marks a child as a target for a CompositedTransformFollower.',
    category: WidgetCategory.animation,
    builder: (context) => const _CompositedTransformSample(),
    codeSnippet: '''
CompositedTransformTarget(
  link: _layerLink,
  child: Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        width: 100,
        height: 100,
        color: Colors.blue,
        child: const Center(child: Text('Target')),
      ),
      CompositedTransformFollower(
        link: _layerLink,
        offset: const Offset(110, 0),
        child: Container(
          width: 80,
          height: 80,
          color: Colors.red.withOpacity(0.5),
          child: const Center(child: Text('Follower')),
        ),
      ),
    ],
  ),
)
''',
  ),
  WidgetInfo(
    name: 'AnimatedRotation',
    description: 'A version of RotationTransition that implicitly animates.',
    category: WidgetCategory.animation,
    builder: (context) => const _AnimatedRotationSample(),
    codeSnippet: '''
class _AnimatedRotationSample extends StatefulWidget {
  const _AnimatedRotationSample();

  @override
  State<_AnimatedRotationSample> createState() => _AnimatedRotationSampleState();
}

class _AnimatedRotationSampleState extends State<_AnimatedRotationSample> {
  double turns = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedRotation(
          turns: turns,
          duration: const Duration(seconds: 1),
          child: const Icon(Icons.refresh, size: 50, color: Colors.blue),
        ),
        ElevatedButton(
          onPressed: () => setState(() => turns += 0.25),
          child: const Text('Rotate +1/4'),
        ),
      ],
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'AnimatedScale',
    description: 'A version of ScaleTransition that implicitly animates.',
    category: WidgetCategory.animation,
    builder: (context) => const _AnimatedScaleSample(),
    codeSnippet: '''
class _AnimatedScaleSample extends StatefulWidget {
  const _AnimatedScaleSample();

  @override
  State<_AnimatedScaleSample> createState() => _AnimatedScaleSampleState();
}

class _AnimatedScaleSampleState extends State<_AnimatedScaleSample> {
  double scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedScale(
          scale: scale,
          duration: const Duration(seconds: 1),
          child: const FlutterLogo(size: 50),
        ),
        ElevatedButton(
          onPressed: () => setState(() => scale = scale == 1.0 ? 2.0 : 1.0),
          child: const Text('Toggle Scale'),
        ),
      ],
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'AnimatedSlide',
    description: 'A version of SlideTransition that implicitly animates.',
    category: WidgetCategory.animation,
    builder: (context) => const _AnimatedSlideSample(),
    codeSnippet: '''
class _AnimatedSlideSample extends StatefulWidget {
  const _AnimatedSlideSample();

  @override
  State<_AnimatedSlideSample> createState() => _AnimatedSlideSampleState();
}

class _AnimatedSlideSampleState extends State<_AnimatedSlideSample> {
  Offset offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 100,
          width: 200,
          color: Colors.grey[200],
          child: AnimatedSlide(
            offset: offset,
            duration: const Duration(seconds: 1),
            child: const Icon(Icons.airplanemode_active, size: 40, color: Colors.blue),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_upward),
              onPressed: () => setState(() => offset -= const Offset(0, 0.5)),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_downward),
              onPressed: () => setState(() => offset += const Offset(0, 0.5)),
            ),
          ],
        ),
      ],
    );
  }
}
''',
  ),
];

class _AnimatedPaddingSample extends StatefulWidget {
  const _AnimatedPaddingSample();

  @override
  State<_AnimatedPaddingSample> createState() => _AnimatedPaddingSampleState();
}

class _AnimatedPaddingSampleState extends State<_AnimatedPaddingSample> {
  double _padding = 8.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedPadding(
          padding: EdgeInsets.all(_padding),
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
          child: Container(
            color: Colors.blue,
            child: const FlutterLogo(size: 50),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _padding = _padding == 8.0 ? 40.0 : 8.0;
            });
          },
          child: const Text('Toggle Padding'),
        ),
      ],
    );
  }
}

class _AnimatedSizeSample extends StatefulWidget {
  const _AnimatedSizeSample();

  @override
  State<_AnimatedSizeSample> createState() => _AnimatedSizeSampleState();
}

class _AnimatedSizeSampleState extends State<_AnimatedSizeSample>
    with SingleTickerProviderStateMixin {
  bool _large = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedSize(
          duration: const Duration(seconds: 1),
          curve: Curves.easeIn,
          child: Container(
            width: _large ? 200.0 : 100.0,
            height: _large ? 200.0 : 100.0,
            color: Colors.purple,
            child: const Center(child: FlutterLogo(size: 50)),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _large = !_large;
            });
          },
          child: const Text('Toggle Size'),
        ),
      ],
    );
  }
}

class _TweenAnimationBuilderSample extends StatefulWidget {
  const _TweenAnimationBuilderSample();

  @override
  State<_TweenAnimationBuilderSample> createState() =>
      _TweenAnimationBuilderSampleState();
}

class _TweenAnimationBuilderSampleState
    extends State<_TweenAnimationBuilderSample> {
  double _targetValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: _targetValue),
          duration: const Duration(seconds: 1),
          builder: (BuildContext context, double value, Widget? child) {
            return Transform.rotate(angle: value * 2 * 3.14159, child: child);
          },
          child: const FlutterLogo(size: 100),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _targetValue = _targetValue == 0.0 ? 1.0 : 0.0;
            });
          },
          child: const Text('Rotate'),
        ),
      ],
    );
  }
}

class _FadeTransitionSample extends StatefulWidget {
  const _FadeTransitionSample();

  @override
  State<_FadeTransitionSample> createState() => _FadeTransitionSampleState();
}

class _FadeTransitionSampleState extends State<_FadeTransitionSample>
    with TickerProviderStateMixin {
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
    return Container(
      color: Colors.white,
      child: FadeTransition(
        opacity: _animation,
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: FlutterLogo(size: 100.0),
        ),
      ),
    );
  }
}

class _ScaleTransitionSample extends StatefulWidget {
  const _ScaleTransitionSample();

  @override
  State<_ScaleTransitionSample> createState() => _ScaleTransitionSampleState();
}

class _ScaleTransitionSampleState extends State<_ScaleTransitionSample>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: FlutterLogo(size: 100.0),
      ),
    );
  }
}

class _SlideTransitionSample extends StatefulWidget {
  const _SlideTransitionSample();

  @override
  State<_SlideTransitionSample> createState() => _SlideTransitionSampleState();
}

class _SlideTransitionSampleState extends State<_SlideTransitionSample>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0.0),
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticIn));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: FlutterLogo(size: 100.0),
      ),
    );
  }
}

class _RotationTransitionSample extends StatefulWidget {
  const _RotationTransitionSample();

  @override
  State<_RotationTransitionSample> createState() =>
      _RotationTransitionSampleState();
}

class _RotationTransitionSampleState extends State<_RotationTransitionSample>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: FlutterLogo(size: 100.0),
      ),
    );
  }
}

class _HeroSample extends StatelessWidget {
  const _HeroSample();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 20.0),
        ListTile(
          leading: Hero(
            tag: 'hero-rectangle',
            child: Container(width: 50, height: 50, color: Colors.blue),
          ),
          onTap: () => _gotoDetailsPage(context),
          title: const Text(
            'Tap on the icon to view hero animation transition.',
          ),
        ),
      ],
    );
  }

  void _gotoDetailsPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => Scaffold(
          appBar: AppBar(title: const Text('Second Page')),
          body: Center(
            child: Hero(
              tag: 'hero-rectangle',
              child: Container(width: 200, height: 200, color: Colors.blue),
            ),
          ),
        ),
      ),
    );
  }
}

class _AnimatedDefaultTextStyleSample extends StatefulWidget {
  const _AnimatedDefaultTextStyleSample();

  @override
  State<_AnimatedDefaultTextStyleSample> createState() =>
      _AnimatedDefaultTextStyleSampleState();
}

class _AnimatedDefaultTextStyleSampleState
    extends State<_AnimatedDefaultTextStyleSample> {
  bool _first = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: 120,
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            style: TextStyle(
              fontSize: _first ? 20 : 50,
              color: _first ? Colors.blue : Colors.red,
              fontWeight: _first ? FontWeight.w100 : FontWeight.bold,
            ),
            child: const Text('Flutter'),
          ),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              _first = !_first;
            });
          },
          child: const Text('Switch'),
        ),
      ],
    );
  }
}

class _AnimatedAlignSample extends StatefulWidget {
  const _AnimatedAlignSample();

  @override
  State<_AnimatedAlignSample> createState() => _AnimatedAlignSampleState();
}

class _AnimatedAlignSampleState extends State<_AnimatedAlignSample> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selected = !_selected;
        });
      },
      child: Container(
        width: 200,
        height: 200,
        color: Colors.grey.shade300,
        child: AnimatedAlign(
          alignment: _selected ? Alignment.topRight : Alignment.bottomLeft,
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          child: const FlutterLogo(size: 50.0),
        ),
      ),
    );
  }
}

class _AnimatedListSample extends StatefulWidget {
  const _AnimatedListSample();

  @override
  State<_AnimatedListSample> createState() => _AnimatedListSampleState();
}

class _AnimatedListSampleState extends State<_AnimatedListSample> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late ListModel<int> _list;
  int? _selectedItem;
  int _nextItem = 3;

  @override
  void initState() {
    super.initState();
    _list = ListModel<int>(
      listKey: _listKey,
      initialItems: <int>[0, 1, 2],
      removedItemBuilder: _buildRemovedItem,
    );
  }

  // Used to build list items that haven't been removed.
  Widget _buildItem(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) {
    return CardItem(
      animation: animation,
      item: _list[index],
      selected: _selectedItem == _list[index],
      onTap: () {
        setState(() {
          _selectedItem = _selectedItem == _list[index] ? null : _list[index];
        });
      },
    );
  }

  // Used to build an item after it has been removed from the list. This
  // method is needed because a removed item remains visible until its
  // animation has completed (even though it's gone as far this ListModel is
  // concerned).
  // The widget will be used by the [AnimatedListState.removeItem] method's
  // [AnimatedListRemovedItemBuilder] parameter.
  Widget _buildRemovedItem(
    int item,
    BuildContext context,
    Animation<double> animation,
  ) {
    return CardItem(
      animation: animation,
      item: item,
      // No gesture detector here: we don't want removed items to be interactive.
    );
  }

  void _insert() {
    final int index = _selectedItem == null
        ? _list.length
        : _list.indexOf(_selectedItem!);
    _list.insert(index, _nextItem++);
  }

  void _remove() {
    if (_selectedItem != null) {
      _list.removeAt(_list.indexOf(_selectedItem!));
      setState(() {
        _selectedItem = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.add_circle),
                onPressed: _insert,
                tooltip: 'insert a new item',
              ),
              IconButton(
                icon: const Icon(Icons.remove_circle),
                onPressed: _remove,
                tooltip: 'remove the selected item',
              ),
            ],
          ),
          Expanded(
            child: AnimatedList(
              key: _listKey,
              initialItemCount: _list.length,
              itemBuilder: _buildItem,
            ),
          ),
        ],
      ),
    );
  }
}

class ListModel<E> {
  ListModel({
    required this.listKey,
    required this.removedItemBuilder,
    Iterable<E>? initialItems,
  }) : _items = List<E>.from(initialItems ?? <E>[]);

  final GlobalKey<AnimatedListState> listKey;
  final dynamic removedItemBuilder;
  final List<E> _items;

  AnimatedListState? get _animatedList => listKey.currentState;

  void insert(int index, E item) {
    _items.insert(index, item);
    _animatedList!.insertItem(index);
  }

  E removeAt(int index) {
    final E removedItem = _items.removeAt(index);
    if (removedItem != null) {
      _animatedList!.removeItem(index, (
        BuildContext context,
        Animation<double> animation,
      ) {
        return removedItemBuilder(removedItem, context, animation);
      });
    }
    return removedItem;
  }

  int get length => _items.length;

  E operator [](int index) => _items[index];

  int indexOf(E item) => _items.indexOf(item);
}

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    this.onTap,
    this.selected = false,
    required this.animation,
    required this.item,
  });

  final VoidCallback? onTap;
  final bool selected;
  final Animation<double> animation;
  final int item;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headlineMedium!;
    if (selected) {
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
    }
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizeTransition(
        sizeFactor: animation,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: SizedBox(
            height: 80.0,
            child: Card(
              color: Colors.primaries[item % Colors.primaries.length],
              child: Center(child: Text('Item $item', style: textStyle)),
            ),
          ),
        ),
      ),
    );
  }
}

class _AnimatedBuilderSample extends StatefulWidget {
  const _AnimatedBuilderSample();

  @override
  State<_AnimatedBuilderSample> createState() => _AnimatedBuilderSampleState();
}

class _AnimatedBuilderSampleState extends State<_AnimatedBuilderSample>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: Container(
        width: 100.0,
        height: 100.0,
        color: Colors.green,
        child: const Center(child: Text('Whee!')),
      ),
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: _controller.value * 2.0 * 3.14159,
          child: child,
        );
      },
    );
  }
}

class _AnimatedPositionedSample extends StatefulWidget {
  const _AnimatedPositionedSample();

  @override
  State<_AnimatedPositionedSample> createState() =>
      _AnimatedPositionedSampleState();
}

class _AnimatedPositionedSampleState extends State<_AnimatedPositionedSample> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            width: _selected ? 200.0 : 50.0,
            height: _selected ? 50.0 : 200.0,
            top: _selected ? 50.0 : 150.0,
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selected = !_selected;
                });
              },
              child: Container(
                color: Colors.blue,
                child: const Center(child: Text('Tap me')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AnimatedSwitcherSample extends StatefulWidget {
  const _AnimatedSwitcherSample();

  @override
  State<_AnimatedSwitcherSample> createState() =>
      _AnimatedSwitcherSampleState();
}

class _AnimatedSwitcherSampleState extends State<_AnimatedSwitcherSample> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(scale: animation, child: child);
          },
          child: Text(
            '$_count',
            key: ValueKey<int>(_count),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        ElevatedButton(
          child: const Text('Increment'),
          onPressed: () {
            setState(() {
              _count += 1;
            });
          },
        ),
      ],
    );
  }
}

class _AnimatedCrossFadeSample extends StatefulWidget {
  const _AnimatedCrossFadeSample();

  @override
  State<_AnimatedCrossFadeSample> createState() =>
      _AnimatedCrossFadeSampleState();
}

class _AnimatedCrossFadeSampleState extends State<_AnimatedCrossFadeSample> {
  bool _first = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedCrossFade(
          duration: const Duration(seconds: 1),
          firstChild: const FlutterLogo(
            style: FlutterLogoStyle.horizontal,
            size: 100.0,
          ),
          secondChild: const FlutterLogo(
            style: FlutterLogoStyle.stacked,
            size: 100.0,
          ),
          crossFadeState: _first
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
        ),
        ElevatedButton(
          child: const Text('Toggle'),
          onPressed: () {
            setState(() {
              _first = !_first;
            });
          },
        ),
      ],
    );
  }
}

class _AnimatedContainerSample extends StatefulWidget {
  const _AnimatedContainerSample();

  @override
  State<_AnimatedContainerSample> createState() =>
      _AnimatedContainerSampleState();
}

class _AnimatedIconSample extends StatefulWidget {
  const _AnimatedIconSample();

  @override
  State<_AnimatedIconSample> createState() => _AnimatedIconSampleState();
}

class _AnimatedIconSampleState extends State<_AnimatedIconSample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleOnPressed() {
    setState(() {
      _isPlaying = !_isPlaying;
      if (_isPlaying) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 50,
      icon: AnimatedIcon(icon: AnimatedIcons.play_pause, progress: _controller),
      onPressed: _handleOnPressed,
    );
  }
}

class _AnimatedContainerSampleState extends State<_AnimatedContainerSample> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: AnimatedContainer(
        width: selected ? 200.0 : 100.0,
        height: selected ? 100.0 : 200.0,
        color: selected ? Colors.red : Colors.blue,
        alignment: selected ? Alignment.center : AlignmentDirectional.topCenter,
        duration: const Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
        child: const FlutterLogo(size: 75),
      ),
    );
  }
}

class _AnimatedOpacitySample extends StatefulWidget {
  const _AnimatedOpacitySample();

  @override
  State<_AnimatedOpacitySample> createState() => _AnimatedOpacitySampleState();
}

class _AnimatedOpacitySampleState extends State<_AnimatedOpacitySample> {
  double opacityLevel = 1.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedOpacity(
          opacity: opacityLevel,
          duration: const Duration(seconds: 1),
          child: const FlutterLogo(size: 50),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              opacityLevel = opacityLevel == 0 ? 1.0 : 0.0;
            });
          },
          child: const Text('Fade Logo'),
        ),
      ],
    );
  }
}

class _SizeTransitionSample extends StatefulWidget {
  const _SizeTransitionSample();

  @override
  State<_SizeTransitionSample> createState() => _SizeTransitionSampleState();
}

class _SizeTransitionSampleState extends State<_SizeTransitionSample>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _animation,
      axis: Axis.horizontal,
      alignment: Alignment.centerLeft,
      child: const Center(child: FlutterLogo(size: 200.0)),
    );
  }
}

class _DecoratedBoxTransitionSample extends StatefulWidget {
  const _DecoratedBoxTransitionSample();

  @override
  State<_DecoratedBoxTransitionSample> createState() =>
      _DecoratedBoxTransitionSampleState();
}

class _DecoratedBoxTransitionSampleState
    extends State<_DecoratedBoxTransitionSample>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat(reverse: true);
  late final DecorationTween _decorationTween = DecorationTween(
    begin: BoxDecoration(
      color: const Color(0xFFFFFFFF),
      border: Border.all(style: BorderStyle.none),
      borderRadius: BorderRadius.circular(60.0),
      boxShadow: const <BoxShadow>[
        BoxShadow(
          color: Color(0x66666666),
          blurRadius: 10.0,
          spreadRadius: 3.0,
          offset: Offset(0, 6.0),
        ),
      ],
    ),
    end: BoxDecoration(
      color: const Color(0xFFFFFFFF),
      border: Border.all(style: BorderStyle.none),
      borderRadius: BorderRadius.zero,
      // No shadow.
    ),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Center(
        child: DecoratedBoxTransition(
          decoration: _decorationTween.animate(_controller),
          child: Container(
            width: 200,
            height: 200,
            padding: const EdgeInsets.all(10),
            child: const FlutterLogo(),
          ),
        ),
      ),
    );
  }
}

class _AnimatedPhysicalModelSample extends StatefulWidget {
  const _AnimatedPhysicalModelSample();

  @override
  State<_AnimatedPhysicalModelSample> createState() =>
      _AnimatedPhysicalModelSampleState();
}

class _AnimatedPhysicalModelSampleState
    extends State<_AnimatedPhysicalModelSample> {
  bool _first = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AnimatedPhysicalModel(
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          elevation: _first ? 0 : 10.0,
          shape: BoxShape.rectangle,
          shadowColor: Colors.black,
          color: _first ? Colors.blue : Colors.red,
          borderRadius: _first
              ? const BorderRadius.all(Radius.circular(0))
              : const BorderRadius.all(Radius.circular(20)),
          child: Container(
            height: 120.0,
            width: 120.0,
            color: Colors.blue[50],
            child: const Center(child: Text('Click me!')),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          child: const Text('Animate'),
          onPressed: () {
            setState(() {
              _first = !_first;
            });
          },
        ),
      ],
    );
  }
}

class _AlignTransitionSample extends StatefulWidget {
  const _AlignTransitionSample();

  @override
  State<_AlignTransitionSample> createState() => _AlignTransitionSampleState();
}

class _AlignTransitionSampleState extends State<_AlignTransitionSample>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<AlignmentGeometry> _animation = Tween<AlignmentGeometry>(
    begin: Alignment.bottomLeft,
    end: Alignment.center,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.decelerate));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: AlignTransition(
        alignment: _animation,
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: FlutterLogo(size: 150.0),
        ),
      ),
    );
  }
}

class _CompositedTransformSample extends StatefulWidget {
  const _CompositedTransformSample();

  @override
  State<_CompositedTransformSample> createState() =>
      _CompositedTransformSampleState();
}

class _CompositedTransformSampleState
    extends State<_CompositedTransformSample> {
  final LayerLink _layerLink = LayerLink();

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.blue,
            child: const Center(child: Text('Target')),
          ),
          CompositedTransformFollower(
            link: _layerLink,
            offset: const Offset(110, 0),
            child: Container(
              width: 80,
              height: 80,
              color: Colors.red.withValues(alpha: 0.5),
              child: const Center(child: Text('Follower')),
            ),
          ),
        ],
      ),
    );
  }
}

class _AnimatedRotationSample extends StatefulWidget {
  const _AnimatedRotationSample();

  @override
  State<_AnimatedRotationSample> createState() =>
      _AnimatedRotationSampleState();
}

class _AnimatedRotationSampleState extends State<_AnimatedRotationSample> {
  double turns = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedRotation(
          turns: turns,
          duration: const Duration(seconds: 1),
          child: const Icon(Icons.refresh, size: 50, color: Colors.blue),
        ),
        ElevatedButton(
          onPressed: () => setState(() => turns += 0.25),
          child: const Text('Rotate +1/4'),
        ),
      ],
    );
  }
}

class _AnimatedScaleSample extends StatefulWidget {
  const _AnimatedScaleSample();

  @override
  State<_AnimatedScaleSample> createState() => _AnimatedScaleSampleState();
}

class _AnimatedScaleSampleState extends State<_AnimatedScaleSample> {
  double scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedScale(
          scale: scale,
          duration: const Duration(seconds: 1),
          child: const FlutterLogo(size: 50),
        ),
        ElevatedButton(
          onPressed: () => setState(() => scale = scale == 1.0 ? 2.0 : 1.0),
          child: const Text('Toggle Scale'),
        ),
      ],
    );
  }
}

class _AnimatedSlideSample extends StatefulWidget {
  const _AnimatedSlideSample();

  @override
  State<_AnimatedSlideSample> createState() => _AnimatedSlideSampleState();
}

class _AnimatedSlideSampleState extends State<_AnimatedSlideSample> {
  Offset offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 100,
          width: 200,
          color: Colors.grey[200],
          child: AnimatedSlide(
            offset: offset,
            duration: const Duration(seconds: 1),
            child: const Icon(
              Icons.airplanemode_active,
              size: 40,
              color: Colors.blue,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_upward),
              onPressed: () => setState(() => offset -= const Offset(0, 0.5)),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_downward),
              onPressed: () => setState(() => offset += const Offset(0, 0.5)),
            ),
          ],
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// AUDIT BATCH 2 – Animation & Transition Widgets
// ─────────────────────────────────────────────────────────────────────────────

final List<WidgetInfo> animationWidgetsExtra = [
  // 1 ─────────────────────────────────────────
  WidgetInfo(
    name: 'AnimatedModalBarrier',
    description:
        'A widget that prevents user interaction and animates its color.',
    category: WidgetCategory.animation,
    builder: (context) => const _AuditAnimatedModalBarrierSample(),
    codeSnippet: '''
AnimatedModalBarrier(
  color: _colorAnimation,
  dismissible: true,
)
''',
  ),

  // 2 ─────────────────────────────────────────
  WidgetInfo(
    name: 'AnimatedSize',
    description:
        'Smoothly transitions its size whenever its child\'s size changes.',
    category: WidgetCategory.animation,
    builder: (context) => const _AuditAnimatedSizeSample(),
    codeSnippet: '''
AnimatedSize(
  duration: const Duration(milliseconds: 500),
  child: _large ? LargeWidget() : SmallWidget(),
)
''',
  ),

  // 3 ─────────────────────────────────────────
  WidgetInfo(
    name: 'DefaultTextStyleTransition',
    description: 'Animates the properties of a DefaultTextStyle.',
    category: WidgetCategory.animation,
    builder: (context) => const _AuditDefaultTextStyleTransitionSample(),
    codeSnippet: '''
DefaultTextStyleTransition(
  style: _styleAnimation,
  child: const Text('Flutter'),
)
''',
  ),

  // 4 ─────────────────────────────────────────
  WidgetInfo(
    name: 'MatrixTransition',
    description: 'Animates the Matrix4 of a transformed widget.',
    category: WidgetCategory.animation,
    builder: (context) => const _AuditMatrixTransitionSample(),
    codeSnippet: '''
MatrixTransition(
  animation: _controller,
  onTransform: (double value) {
    return Matrix4.identity()
      ..setEntry(3, 2, 0.001)
      ..rotateY(value * 2 * math.pi);
  },
  child: const Icon(Icons.refresh, size: 100),
)
''',
  ),

  // 5 ─────────────────────────────────────────
  WidgetInfo(
    name: 'PositionedTransition',
    description: 'Animates the position of a widget within a Stack.',
    category: WidgetCategory.animation,
    builder: (context) => const _AuditPositionedTransitionSample(),
    codeSnippet: '''
PositionedTransition(
  rect: _rectAnimation,
  child: const FlutterLogo(),
)
''',
  ),

  // 6 ─────────────────────────────────────────
  WidgetInfo(
    name: 'RelativePositionedTransition',
    description: 'Animates a widget\'s position relative to its parent.',
    category: WidgetCategory.animation,
    builder: (context) => const _AuditRelativePositionedTransitionSample(),
    codeSnippet: '''
RelativePositionedTransition(
  rect: _rectAnimation,
  size: const Size(200, 200),
  child: const FlutterLogo(),
)
''',
  ),

  // 7 ─────────────────────────────────────────
  WidgetInfo(
    name: 'RepeatingAnimationBuilder',
    description: 'A builder that repeats an animation indefinitely.',
    category: WidgetCategory.animation,
    builder: (context) => const _AuditRepeatingAnimationBuilderSample(),
    codeSnippet: '''
RepeatingAnimationBuilder<double>(
  tween: Tween(begin: 0.0, end: 1.0),
  duration: const Duration(seconds: 2),
  builder: (context, value, child) => Opacity(opacity: value, child: child),
  child: const Text('Pulse'),
)
''',
  ),
];

// ─── Stateful helpers for audit batch 2 ──────────────────────────────────────

class _AuditAnimatedModalBarrierSample extends StatefulWidget {
  const _AuditAnimatedModalBarrierSample();

  @override
  State<_AuditAnimatedModalBarrierSample> createState() =>
      _AuditAnimatedModalBarrierSampleState();
}

class _AuditAnimatedModalBarrierSampleState
    extends State<_AuditAnimatedModalBarrierSample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _colorAnimation = ColorTween(
      begin: Colors.blue.withAlpha(100),
      end: Colors.red.withAlpha(100),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Text('Under the barrier'),
              AnimatedModalBarrier(color: _colorAnimation, dismissible: true),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () => _controller.isCompleted
              ? _controller.reverse()
              : _controller.forward(),
          child: const Text('Animate Color'),
        ),
      ],
    );
  }
}

class _AuditAnimatedSizeSample extends StatefulWidget {
  const _AuditAnimatedSizeSample();

  @override
  State<_AuditAnimatedSizeSample> createState() =>
      _AuditAnimatedSizeSampleState();
}

class _AuditAnimatedSizeSampleState extends State<_AuditAnimatedSizeSample> {
  bool _large = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _large = !_large),
      child: Container(
        color: Colors.amberAccent,
        child: AnimatedSize(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          child: Container(
            width: _large ? 200 : 100,
            height: _large ? 200 : 100,
            color: Colors.blue.withAlpha(150),
            child: const Center(child: Text('Tap Me')),
          ),
        ),
      ),
    );
  }
}

class _AuditDefaultTextStyleTransitionSample extends StatefulWidget {
  const _AuditDefaultTextStyleTransitionSample();

  @override
  State<_AuditDefaultTextStyleTransitionSample> createState() =>
      _AuditDefaultTextStyleTransitionSampleState();
}

class _AuditDefaultTextStyleTransitionSampleState
    extends State<_AuditDefaultTextStyleTransitionSample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<TextStyle> _styleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _styleAnimation = TextStyleTween(
      begin: const TextStyle(
        fontSize: 20,
        color: Colors.blue,
        fontWeight: FontWeight.normal,
      ),
      end: const TextStyle(
        fontSize: 40,
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyleTransition(
      style: _styleAnimation,
      child: const Text('Animating Text'),
    );
  }
}

class _AuditMatrixTransitionSample extends StatefulWidget {
  const _AuditMatrixTransitionSample();

  @override
  State<_AuditMatrixTransitionSample> createState() =>
      _AuditMatrixTransitionSampleState();
}

class _AuditMatrixTransitionSampleState
    extends State<_AuditMatrixTransitionSample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MatrixTransition(
      animation: _controller,
      onTransform: (double value) {
        return Matrix4.identity()
          ..setEntry(3, 2, 0.002) // Perspective
          ..rotateY(value * 2 * 3.14159); // PI
      },
      child: const Card(
        color: Colors.blue,
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Icon(Icons.flutter_dash, size: 64, color: Colors.white),
        ),
      ),
    );
  }
}

class _AuditPositionedTransitionSample extends StatefulWidget {
  const _AuditPositionedTransitionSample();

  @override
  State<_AuditPositionedTransitionSample> createState() =>
      _AuditPositionedTransitionSampleState();
}

class _AuditPositionedTransitionSampleState
    extends State<_AuditPositionedTransitionSample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<RelativeRect> _rectAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _rectAnimation = RelativeRectTween(
      begin: const RelativeRect.fromLTRB(0, 0, 100, 100),
      end: const RelativeRect.fromLTRB(100, 100, 0, 0),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: Colors.grey[200],
      child: Stack(
        children: [
          PositionedTransition(
            rect: _rectAnimation,
            child: Container(color: Colors.red),
          ),
        ],
      ),
    );
  }
}

class _AuditRelativePositionedTransitionSample extends StatefulWidget {
  const _AuditRelativePositionedTransitionSample();

  @override
  State<_AuditRelativePositionedTransitionSample> createState() =>
      _AuditRelativePositionedTransitionSampleState();
}

class _AuditRelativePositionedTransitionSampleState
    extends State<_AuditRelativePositionedTransitionSample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Rect?> _rectAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _rectAnimation = RectTween(
      begin: const Rect.fromLTRB(0, 0, 50, 50),
      end: const Rect.fromLTRB(150, 150, 200, 200),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: Colors.grey[300],
      child: Stack(
        children: [
          RelativePositionedTransition(
            rect: _rectAnimation,
            size: const Size(200, 200),
            child: Container(color: Colors.green),
          ),
        ],
      ),
    );
  }
}

class _AuditRepeatingAnimationBuilderSample extends StatelessWidget {
  const _AuditRepeatingAnimationBuilderSample();

  @override
  Widget build(BuildContext context) {
    return RepeatingAnimationBuilder<double>(
      tween: Tween(begin: 0.5, end: 1.0),
      duration: const Duration(seconds: 1),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Opacity(opacity: value, child: child),
        );
      },
      child: const Card(
        color: Colors.deepPurple,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Indefinite Pulse',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

// Low-level implementation of RepeatingAnimationBuilder for the sample
class RepeatingAnimationBuilder<T> extends StatefulWidget {
  final Tween<T> tween;
  final Duration duration;
  final Widget Function(BuildContext, T, Widget?) builder;
  final Widget? child;

  const RepeatingAnimationBuilder({
    super.key,
    required this.tween,
    required this.duration,
    required this.builder,
    this.child,
  });

  @override
  State<RepeatingAnimationBuilder<T>> createState() =>
      _RepeatingAnimationBuilderState<T>();
}

class _RepeatingAnimationBuilderState<T>
    extends State<RepeatingAnimationBuilder<T>>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<T> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this)
      ..repeat(reverse: true);
    _animation = widget.tween.animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) =>
          widget.builder(context, _animation.value, child),
      child: widget.child,
    );
  }
}
