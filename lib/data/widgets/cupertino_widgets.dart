import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/widget_info.dart';

final List<WidgetInfo> cupertinoWidgets = [
  WidgetInfo(
    name: 'CupertinoButton',
    description: 'An iOS-style button.',
    category: WidgetCategory.cupertino,
    builder: (context) => CupertinoButton(
      color: CupertinoColors.activeBlue,
      onPressed: () {},
      child: const Text('Cupertino Button'),
    ),
    codeSnippet: '''
CupertinoButton(
  color: CupertinoColors.activeBlue,
  onPressed: () {},
  child: const Text('Cupertino Button'),
)
''',
  ),
  WidgetInfo(
    name: 'CupertinoActivityIndicator',
    description: 'An iOS-style activity indicator.',
    category: WidgetCategory.cupertino,
    builder: (context) => const CupertinoActivityIndicator(radius: 20),
    codeSnippet: '''
CupertinoActivityIndicator(radius: 20)
''',
  ),
  WidgetInfo(
    name: 'CupertinoTextField',
    description: 'An iOS-style text field.',
    category: WidgetCategory.cupertino,
    builder: (context) => const SizedBox(
      width: 300,
      child: CupertinoTextField(placeholder: 'Enter text'),
    ),
    codeSnippet: '''
CupertinoTextField(
  placeholder: 'Enter text',
)
''',
  ),
  WidgetInfo(
    name: 'CupertinoActionSheet',
    description: 'An iOS-style action sheet.',
    category: WidgetCategory.cupertino,
    builder: (context) => CupertinoButton(
      child: const Text('Show Action Sheet'),
      onPressed: () {
        showCupertinoModalPopup<void>(
          context: context,
          builder: (BuildContext context) => CupertinoActionSheet(
            title: const Text('Title'),
            message: const Text('Message'),
            actions: <CupertinoActionSheetAction>[
              CupertinoActionSheetAction(
                child: const Text('Action One'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              CupertinoActionSheetAction(
                child: const Text('Action Two'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    ),
    codeSnippet: '''
showCupertinoModalPopup<void>(
  context: context,
  builder: (BuildContext context) => CupertinoActionSheet(
    title: const Text('Title'),
    message: const Text('Message'),
    actions: <CupertinoActionSheetAction>[
      CupertinoActionSheetAction(
        child: const Text('Action One'),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      CupertinoActionSheetAction(
        child: const Text('Action Two'),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ],
  ),
)
''',
  ),
  WidgetInfo(
    name: 'CupertinoPicker',
    description: 'An iOS-style picker control.',
    category: WidgetCategory.cupertino,
    builder: (context) => SizedBox(
      height: 200,
      child: CupertinoPicker(
        itemExtent: 32.0,
        onSelectedItemChanged: (int index) {},
        children: const <Widget>[
          Text('Item 1'),
          Text('Item 2'),
          Text('Item 3'),
          Text('Item 4'),
          Text('Item 5'),
        ],
      ),
    ),
    codeSnippet: '''
CupertinoPicker(
  itemExtent: 32.0,
  onSelectedItemChanged: (int index) {},
  children: const <Widget>[
    Text('Item 1'),
    Text('Item 2'),
    Text('Item 3'),
    Text('Item 4'),
    Text('Item 5'),
  ],
)
''',
  ),
  WidgetInfo(
    name: 'CupertinoAlertDialog',
    description: 'An iOS-style alert dialog.',
    category: WidgetCategory.cupertino,
    builder: (context) => CupertinoButton(
      child: const Text('Show Alert Dialog'),
      onPressed: () {
        showCupertinoDialog<void>(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
            title: const Text('Alert'),
            content: const Text('Proceed with destructive action?'),
            actions: <CupertinoDialogAction>[
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('No'),
              ),
              CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Yes'),
              ),
            ],
          ),
        );
      },
    ),
    codeSnippet: '''
showCupertinoDialog<void>(
  context: context,
  builder: (BuildContext context) => CupertinoAlertDialog(
    title: const Text('Alert'),
    content: const Text('Proceed with destructive action?'),
    actions: <CupertinoDialogAction>[
      CupertinoDialogAction(
        isDefaultAction: true,
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('No'),
      ),
      CupertinoDialogAction(
        isDestructiveAction: true,
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Yes'),
      ),
    ],
  ),
)
''',
  ),
  WidgetInfo(
    name: 'CupertinoSearchTextField',
    description: 'An iOS-style search text field.',
    category: WidgetCategory.cupertino,
    builder: (context) => const Padding(
      padding: EdgeInsets.all(16.0),
      child: CupertinoSearchTextField(),
    ),
    codeSnippet: '''
Padding(
  padding: EdgeInsets.all(16.0),
  child: CupertinoSearchTextField(),
)
''',
  ),
  WidgetInfo(
    name: 'CupertinoSwitch',
    description: 'An iOS-style switch.',
    category: WidgetCategory.cupertino,
    builder: (context) => const _CupertinoSwitchSample(),
    codeSnippet: '''
class _CupertinoSwitchSample extends StatefulWidget {
  const _CupertinoSwitchSample();

  @override
  State<_CupertinoSwitchSample> createState() => _CupertinoSwitchSampleState();
}

class _CupertinoSwitchSampleState extends State<_CupertinoSwitchSample> {
  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: _switchValue,
      onChanged: (bool? value) {
        setState(() {
          _switchValue = value ?? false;
        });
      },
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'CupertinoSlider',
    description: 'An iOS-style slider.',
    category: WidgetCategory.cupertino,
    builder: (context) => const _CupertinoSliderSample(),
    codeSnippet: '''
class _CupertinoSliderSample extends StatefulWidget {
  const _CupertinoSliderSample();

  @override
  State<_CupertinoSliderSample> createState() => _CupertinoSliderSampleState();
}

class _CupertinoSliderSampleState extends State<_CupertinoSliderSample> {
  double _currentSliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Text('\$_currentSliderValue'),
          CupertinoSlider(
            key: const Key('slider'),
            value: _currentSliderValue,
            divisions: 5,
            max: 100,
            activeColor: CupertinoColors.systemPurple,
            thumbColor: CupertinoColors.systemPurple,
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
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
    name: 'CupertinoSegmentedControl',
    description: 'An iOS-style segmented control.',
    category: WidgetCategory.cupertino,
    builder: (context) => const _CupertinoSegmentedControlSample(),
    codeSnippet: '''
class _CupertinoSegmentedControlSample extends StatefulWidget {
  const _CupertinoSegmentedControlSample();

  @override
  State<_CupertinoSegmentedControlSample> createState() => _CupertinoSegmentedControlSampleState();
}

class _CupertinoSegmentedControlSampleState extends State<_CupertinoSegmentedControlSample> {
  int? _groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoSegmentedControl<int>(
      children: const <int, Widget>{
        0: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text('Midnight'),
        ),
        1: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text('Viridian'),
        ),
        2: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text('Cerulean'),
        ),
      },
      onValueChanged: (int? value) {
        setState(() {
          _groupValue = value;
        });
      },
      groupValue: _groupValue,
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'CupertinoContextMenu',
    description:
        'An iOS-style full-screen modal popup that opens when the child is long-pressed.',
    category: WidgetCategory.cupertino,
    builder: (context) => SizedBox(
      height: 100,
      width: 100,
      child: CupertinoContextMenu(
        actions: <Widget>[
          CupertinoContextMenuAction(
            onPressed: () {
              Navigator.pop(context);
            },
            isDefaultAction: true,
            trailingIcon: CupertinoIcons.doc_on_clipboard_fill,
            child: const Text('Copy'),
          ),
          CupertinoContextMenuAction(
            onPressed: () {
              Navigator.pop(context);
            },
            trailingIcon: CupertinoIcons.share,
            child: const Text('Share'),
          ),
          CupertinoContextMenuAction(
            onPressed: () {
              Navigator.pop(context);
            },
            trailingIcon: CupertinoIcons.heart,
            child: const Text('Favorite'),
          ),
          CupertinoContextMenuAction(
            onPressed: () {
              Navigator.pop(context);
            },
            isDestructiveAction: true,
            trailingIcon: CupertinoIcons.delete,
            child: const Text('Delete'),
          ),
        ],
        child: Container(
          decoration: BoxDecoration(
            color: CupertinoColors.systemYellow,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: const Center(child: FlutterLogo(size: 50.0)),
        ),
      ),
    ),
    codeSnippet: '''
CupertinoContextMenu(
  actions: <Widget>[
    CupertinoContextMenuAction(
      onPressed: () {
        Navigator.pop(context);
      },
      isDefaultAction: true,
      trailingIcon: CupertinoIcons.doc_on_clipboard_fill,
      child: const Text('Copy'),
    ),
    CupertinoContextMenuAction(
      onPressed: () {
        Navigator.pop(context);
      },
      trailingIcon: CupertinoIcons.share,
      child: const Text('Share'),
    ),
    CupertinoContextMenuAction(
      onPressed: () {
        Navigator.pop(context);
      },
      trailingIcon: CupertinoIcons.heart,
      child: const Text('Favorite'),
    ),
    CupertinoContextMenuAction(
      onPressed: () {
        Navigator.pop(context);
      },
      isDestructiveAction: true,
      trailingIcon: CupertinoIcons.delete,
      child: const Text('Delete'),
    ),
  ],
  child: Container(
    decoration: BoxDecoration(
      color: CupertinoColors.systemYellow,
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: const Center(
      child: FlutterLogo(size: 50.0),
    ),
  ),
)
''',
  ),
  WidgetInfo(
    name: 'CupertinoDatePicker',
    description: 'An iOS-style date picker.',
    category: WidgetCategory.cupertino,
    builder: (context) => SizedBox(
      height: 200,
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.date,
        initialDateTime: DateTime.now(),
        onDateTimeChanged: (DateTime newDateTime) {},
      ),
    ),
    codeSnippet: '''
CupertinoDatePicker(
  mode: CupertinoDatePickerMode.date,
  initialDateTime: DateTime.now(),
  onDateTimeChanged: (DateTime newDateTime) {},
)
''',
  ),
  WidgetInfo(
    name: 'CupertinoTimerPicker',
    description: 'An iOS-style countdown timer picker.',
    category: WidgetCategory.cupertino,
    builder: (context) => SizedBox(
      height: 200,
      child: CupertinoTimerPicker(
        mode: CupertinoTimerPickerMode.hm,
        onTimerDurationChanged: (Duration newDuration) {},
      ),
    ),
    codeSnippet: '''
CupertinoTimerPicker(
  mode: CupertinoTimerPickerMode.hm,
  onTimerDurationChanged: (Duration newDuration) {},
)
''',
  ),
  WidgetInfo(
    name: 'CupertinoNavigationBar',
    description: 'An iOS-style navigation bar.',
    category: WidgetCategory.cupertino,
    builder: (context) => const SizedBox(
      height: 44,
      child: CupertinoNavigationBar(
        middle: Text('Cupertino Navigation Bar'),
        leading: Icon(CupertinoIcons.back),
        trailing: Icon(CupertinoIcons.search),
      ),
    ),
    codeSnippet: '''
CupertinoNavigationBar(
  middle: const Text('Cupertino Navigation Bar'),
  leading: const Icon(CupertinoIcons.back),
  trailing: const Icon(CupertinoIcons.search),
)
''',
  ),
  WidgetInfo(
    name: 'CupertinoPageScaffold',
    description: 'An iOS-style page scaffold.',
    category: WidgetCategory.cupertino,
    builder: (context) => const SizedBox(
      height: 300,
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('CupertinoPageScaffold'),
        ),
        child: Center(child: Text('Content')),
      ),
    ),
    codeSnippet: '''
CupertinoPageScaffold(
  navigationBar: CupertinoNavigationBar(
    middle: Text('CupertinoPageScaffold'),
  ),
  child: Center(child: Text('Content')),
)
''',
  ),
  WidgetInfo(
    name: 'CupertinoScrollbar',
    description: 'An iOS-style scrollbar.',
    category: WidgetCategory.cupertino,
    builder: (context) => const _CupertinoScrollbarSample(),
    codeSnippet: '''
class _CupertinoScrollbarSample extends StatefulWidget {
  const _CupertinoScrollbarSample();

  @override
  State<_CupertinoScrollbarSample> createState() => _CupertinoScrollbarSampleState();
}

class _CupertinoScrollbarSampleState extends State<_CupertinoScrollbarSample> {
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
      child: CupertinoScrollbar(
        controller: _controller,
        thumbVisibility: true,
        child: ListView.builder(
          controller: _controller,
          itemCount: 50,
          itemBuilder: (context, index) => ListTile(
            title: Text('Item \$index'),
          ),
        ),
      ),
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'CupertinoSlidingSegmentedControl',
    description: 'An iOS-style sliding segmented control.',
    category: WidgetCategory.cupertino,
    builder: (context) => const _CupertinoSlidingSegmentedControlSample(),
    codeSnippet: '''
class _CupertinoSlidingSegmentedControlSample extends StatefulWidget {
  const _CupertinoSlidingSegmentedControlSample();

  @override
  State<_CupertinoSlidingSegmentedControlSample> createState() =>
      _CupertinoSlidingSegmentedControlSampleState();
}

class _CupertinoSlidingSegmentedControlSampleState
    extends State<_CupertinoSlidingSegmentedControlSample> {
  int? _groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl<int>(
      groupValue: _groupValue,
      children: const <int, Widget>{
        0: Text('Option 1'),
        1: Text('Option 2'),
        2: Text('Option 3'),
      },
      onValueChanged: (int? value) {
        setState(() {
          _groupValue = value;
        });
      },
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'CupertinoTabScaffold',
    description: 'An iOS-style tab navigation scaffold.',
    category: WidgetCategory.cupertino,
    builder: (context) => const _CupertinoTabScaffoldSample(),
    codeSnippet: '''
CupertinoTabScaffold(
  tabBar: CupertinoTabBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.settings),
        label: 'Settings',
      ),
    ],
  ),
  tabBuilder: (BuildContext context, int index) {
    return CupertinoTabView(
      builder: (BuildContext context) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text('Page \${index + 1}'),
          ),
          child: Center(
            child: CupertinoButton(
              child: const Text('Next page'),
              onPressed: () {
                Navigator.of(context).push(
                  CupertinoPageRoute<void>(
                    builder: (BuildContext context) {
                      return CupertinoPageScaffold(
                        navigationBar: CupertinoNavigationBar(
                          middle: Text('Page \${index + 1} Detail'),
                        ),
                        child: const Center(child: Text('Detail')),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  },
)
''',
  ),
  WidgetInfo(
    name: 'CupertinoFormSection',
    description: 'An iOS-style form section.',
    category: WidgetCategory.cupertino,
    builder: (context) => CupertinoFormSection(
      header: const Text('SECTION 1'),
      children: [
        CupertinoFormRow(
          prefix: const Text('Prefix'),
          child: CupertinoTextField(
            placeholder: 'Enter text',
            decoration: null,
          ),
        ),
      ],
    ),
    codeSnippet: '''
CupertinoFormSection(
  header: const Text('SECTION 1'),
  children: [
    CupertinoFormRow(
      prefix: const Text('Prefix'),
      child: CupertinoTextField(
        placeholder: 'Enter text',
        decoration: null,
      ),
    ),
  ],
)
''',
  ),
  WidgetInfo(
    name: 'CupertinoListSection',
    description: 'An iOS-style list section.',
    category: WidgetCategory.cupertino,
    builder: (context) => CupertinoListSection(
      header: const Text('Header'),
      children: [
        CupertinoListTile(
          title: const Text('Title'),
          subtitle: const Text('Subtitle'),
          additionalInfo: const Text('Info'),
          trailing: const CupertinoListTileChevron(),
          onTap: () {},
        ),
      ],
    ),
    codeSnippet: '''
CupertinoListSection(
  header: const Text('Header'),
  children: [
    CupertinoListTile(
      title: const Text('Title'),
      subtitle: const Text('Subtitle'),
      additionalInfo: const Text('Info'),
      trailing: const CupertinoListTileChevron(),
      onTap: () {},
    ),
  ],
)
''',
  ),
  WidgetInfo(
    name: 'CupertinoSliverRefreshControl',
    description: 'An iOS-style pull-to-refresh control for slivers.',
    category: WidgetCategory.cupertino,
    builder: (context) => const _CupertinoSliverRefreshControlSample(),
    codeSnippet: '''
class _CupertinoSliverRefreshControlSample extends StatefulWidget {
  const _CupertinoSliverRefreshControlSample();

  @override
  State<_CupertinoSliverRefreshControlSample> createState() =>
      _CupertinoSliverRefreshControlSampleState();
}

class _CupertinoSliverRefreshControlSampleState
    extends State<_CupertinoSliverRefreshControlSample> {
  List<Color> colors = [Colors.red, Colors.green, Colors.blue];

  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      colors = List.of(colors.reversed); // Simple data change
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: CustomScrollView(
        slivers: [
          CupertinoSliverRefreshControl(
            onRefresh: _refresh,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                height: 50,
                color: colors[index % colors.length],
                alignment: Alignment.center,
                child: Text('Item \$index'),
              ),
              childCount: 20,
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
    name: 'CupertinoTextSelectionToolbar',
    description: 'An iOS-style resource-saving text selection toolbar.',
    category: WidgetCategory.cupertino,
    builder: (context) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Toolbar is typically shown on selection, here is a demo:'),
        const SizedBox(height: 20),
        CupertinoTextSelectionToolbar(
          anchorAbove: const Offset(150, 50),
          anchorBelow: const Offset(150, 100),
          children: <Widget>[
            CupertinoTextSelectionToolbarButton(
              onPressed: () {},
              child: const Text('Copy'),
            ),
            CupertinoTextSelectionToolbarButton(
              onPressed: () {},
              child: const Text('Paste'),
            ),
          ],
        ),
      ],
    ),
    codeSnippet: '''
CupertinoTextSelectionToolbar(
  anchorAbove: const Offset(150, 50),
  anchorBelow: const Offset(150, 100),
  children: <Widget>[
    CupertinoTextSelectionToolbarButton(
      onPressed: () {},
      child: const Text('Copy'),
    ),
    CupertinoTextSelectionToolbarButton(
      onPressed: () {},
      child: const Text('Paste'),
    ),
  ],
)
''',
  ),
  WidgetInfo(
    name: 'CupertinoApp',
    description: 'An application that uses Cupertino design.',
    category: WidgetCategory.cupertino,
    builder: (context) => SizedBox(
      height: 400,
      child: CupertinoApp(
        home: CupertinoPageScaffold(
          navigationBar: const CupertinoNavigationBar(
            middle: Text('CupertinoApp Home'),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('This is inside a CupertinoApp'),
                const SizedBox(height: 20),
                CupertinoButton.filled(
                  onPressed: () {},
                  child: const Text('Button'),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    codeSnippet: '''
CupertinoApp(
  home: CupertinoPageScaffold(
    navigationBar: const CupertinoNavigationBar(
      middle: Text('CupertinoApp Home'),
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('This is inside a CupertinoApp'),
          const SizedBox(height: 20),
          CupertinoButton.filled(
            onPressed: () {},
            child: const Text('Button'),
          ),
        ],
      ),
    ),
  ),
)
''',
  ),
  WidgetInfo(
    name: 'CupertinoActionSheetAction',
    description: 'A button typically used in a CupertinoActionSheet.',
    category: WidgetCategory.cupertino,
    builder: (context) => Center(
      child: CupertinoActionSheetAction(
        onPressed: () {},
        child: const Text('A Standalone Action Button'),
      ),
    ),
    codeSnippet: '''
CupertinoActionSheetAction(
  onPressed: () {},
  child: const Text('A Standalone Action Button'),
)
''',
  ),
  WidgetInfo(
    name: 'CupertinoAdaptiveTextSelectionToolbar',
    description: 'Default Cupertino context menu for text selection.',
    category: WidgetCategory.cupertino,
    builder: (context) => const Center(
      child: SelectionArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Select this text to see the'),
            Text('Adaptive Text Selection Toolbar'),
          ],
        ),
      ),
    ),
    codeSnippet: '''
SelectionArea(
  child: Column(
    children: [
      Text('Select this text to see the'),
      Text('Adaptive Text Selection Toolbar'),
    ],
  ),
)
''',
  ),
  WidgetInfo(
    name: 'CupertinoCheckbox',
    description: 'An iOS-style checkbox.',
    category: WidgetCategory.cupertino,
    builder: (context) => const _CupertinoCheckboxSample(),
    codeSnippet: '''
class _CupertinoCheckboxSample extends StatefulWidget {
  const _CupertinoCheckboxSample();

  @override
  State<_CupertinoCheckboxSample> createState() => _CupertinoCheckboxSampleState();
}

class _CupertinoCheckboxSampleState extends State<_CupertinoCheckboxSample> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoCheckbox(
      value: _checked,
      onChanged: (bool? value) {
        setState(() {
          _checked = value ?? false;
        });
      },
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'CupertinoContextMenuAction',
    description: 'A button in a CupertinoContextMenu.',
    category: WidgetCategory.cupertino,
    builder: (context) => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Commonly used in CupertinoContextMenu:'),
          const SizedBox(height: 10),
          CupertinoContextMenuAction(
            onPressed: () {},
            trailingIcon: CupertinoIcons.share,
            child: const Text('Share Action'),
          ),
          CupertinoContextMenuAction(
            onPressed: () {},
            isDestructiveAction: true,
            trailingIcon: CupertinoIcons.delete,
            child: const Text('Delete Action'),
          ),
        ],
      ),
    ),
    codeSnippet: '''
Column(
  children: [
    CupertinoContextMenuAction(
      onPressed: () {},
      trailingIcon: CupertinoIcons.share,
      child: const Text('Share Action'),
    ),
    CupertinoContextMenuAction(
      onPressed: () {},
      isDestructiveAction: true,
      trailingIcon: CupertinoIcons.delete,
      child: const Text('Delete Action'),
    ),
  ],
)
''',
  ),
  WidgetInfo(
    name: 'CupertinoDesktopTextSelectionToolbar',
    description: 'A macOS-style text selection toolbar.',
    category: WidgetCategory.cupertino,
    builder: (context) => SizedBox(
      height: 100,
      width: 400,
      child: Center(
        child: CupertinoDesktopTextSelectionToolbar(
          anchor: const Offset(200, 50),
          children: <Widget>[
            CupertinoDesktopTextSelectionToolbarButton(
              onPressed: () {},
              child: const Text('Copy'),
            ),
            CupertinoDesktopTextSelectionToolbarButton(
              onPressed: () {},
              child: const Text('Paste'),
            ),
          ],
        ),
      ),
    ),
    codeSnippet: '''
CupertinoDesktopTextSelectionToolbar(
  anchor: const Offset(200, 50),
  children: <Widget>[
    CupertinoDesktopTextSelectionToolbarButton(
      onPressed: () {},
      child: const Text('Copy'),
    ),
    CupertinoDesktopTextSelectionToolbarButton(
      onPressed: () {},
      child: const Text('Paste'),
    ),
  ],
)
''',
  ),
  WidgetInfo(
    name: 'CupertinoDesktopTextSelectionToolbarButton',
    description: 'A button in a macOS context menu.',
    category: WidgetCategory.cupertino,
    builder: (context) => Center(
      child: Container(
        color: CupertinoColors.systemGrey6,
        child: CupertinoDesktopTextSelectionToolbarButton(
          onPressed: () {},
          child: const Text('Action'),
        ),
      ),
    ),
    codeSnippet: '''
CupertinoDesktopTextSelectionToolbarButton(
  onPressed: () {},
  child: const Text('Action'),
)
''',
  ),
  WidgetInfo(
    name: 'CupertinoDialogAction',
    description: 'A button typically used in a CupertinoAlertDialog.',
    category: WidgetCategory.cupertino,
    builder: (context) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CupertinoDialogAction(
          onPressed: () {},
          child: const Text('Normal Action'),
        ),
        CupertinoDialogAction(
          isDestructiveAction: true,
          onPressed: () {},
          child: const Text('Destructive Action'),
        ),
      ],
    ),
    codeSnippet: '''
Column(
  children: [
    CupertinoDialogAction(
      onPressed: () {},
      child: const Text('Normal Action'),
    ),
    CupertinoDialogAction(
      isDestructiveAction: true,
      onPressed: () {},
      child: const Text('Destructive Action'),
    ),
  ],
)
''',
  ),
  WidgetInfo(
    name: 'CupertinoFormRow',
    description: 'An iOS-style form row.',
    category: WidgetCategory.cupertino,
    builder: (context) => CupertinoFormRow(
      prefix: const Text('Label'),
      child: const CupertinoTextField(placeholder: 'Input'),
    ),
    codeSnippet: '''
CupertinoFormRow(
  prefix: const Text('Label'),
  child: const CupertinoTextField(
    placeholder: 'Input',
  ),
)
''',
  ),
  WidgetInfo(
    name: 'CupertinoFullscreenDialogTransition',
    description: 'Transition for summoning fullscreen dialogs.',
    category: WidgetCategory.cupertino,
    builder: (context) => const _CupertinoFullscreenDialogTransitionSample(),
    codeSnippet: '''
class _CupertinoFullscreenDialogTransitionSample extends StatefulWidget {
  const _CupertinoFullscreenDialogTransitionSample();

  @override
  State<_CupertinoFullscreenDialogTransitionSample> createState() =>
      _CupertinoFullscreenDialogTransitionSampleState();
}

class _CupertinoFullscreenDialogTransitionSampleState
    extends State<_CupertinoFullscreenDialogTransitionSample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
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
        CupertinoButton.filled(
          onPressed: () {
            if (_controller.isCompleted) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          },
          child: const Text('Toggle Transition'),
        ),
        Expanded(
          child: CupertinoFullscreenDialogTransition(
            primaryRouteAnimation: _controller,
            secondaryRouteAnimation:
                const AlwaysStoppedAnimation<double>(0.0), // No secondary transition
            linearTransition: true,
            child: Container(
              color: CupertinoColors.systemYellow,
              alignment: Alignment.center,
              child: const Text('Fullscreen Dialog Child'),
            ),
          ),
        ),
      ],
    );
  }
}
''',
  ),
];

class _CupertinoSwitchSample extends StatefulWidget {
  const _CupertinoSwitchSample();

  @override
  State<_CupertinoSwitchSample> createState() => _CupertinoSwitchSampleState();
}

class _CupertinoSwitchSampleState extends State<_CupertinoSwitchSample> {
  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: _switchValue,
      onChanged: (bool? value) {
        setState(() {
          _switchValue = value ?? false;
        });
      },
    );
  }
}

class _CupertinoSliderSample extends StatefulWidget {
  const _CupertinoSliderSample();

  @override
  State<_CupertinoSliderSample> createState() => _CupertinoSliderSampleState();
}

class _CupertinoSliderSampleState extends State<_CupertinoSliderSample> {
  double _currentSliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Text('$_currentSliderValue'),
          CupertinoSlider(
            key: const Key('slider'),
            value: _currentSliderValue,
            divisions: 5,
            max: 100,
            activeColor: CupertinoColors.systemPurple,
            thumbColor: CupertinoColors.systemPurple,
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

class _CupertinoSegmentedControlSample extends StatefulWidget {
  const _CupertinoSegmentedControlSample();

  @override
  State<_CupertinoSegmentedControlSample> createState() =>
      _CupertinoSegmentedControlSampleState();
}

class _CupertinoSegmentedControlSampleState
    extends State<_CupertinoSegmentedControlSample> {
  int? _groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoSegmentedControl<int>(
      children: const <int, Widget>{
        0: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text('Midnight'),
        ),
        1: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text('Viridian'),
        ),
        2: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text('Cerulean'),
        ),
      },
      onValueChanged: (int? value) {
        setState(() {
          _groupValue = value;
        });
      },
      groupValue: _groupValue,
    );
  }
}

class _CupertinoSlidingSegmentedControlSample extends StatefulWidget {
  const _CupertinoSlidingSegmentedControlSample();

  @override
  State<_CupertinoSlidingSegmentedControlSample> createState() =>
      _CupertinoSlidingSegmentedControlSampleState();
}

class _CupertinoSlidingSegmentedControlSampleState
    extends State<_CupertinoSlidingSegmentedControlSample> {
  int? _groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl<int>(
      groupValue: _groupValue,
      children: const <int, Widget>{
        0: Text('Option 1'),
        1: Text('Option 2'),
        2: Text('Option 3'),
      },
      onValueChanged: (int? value) {
        setState(() {
          _groupValue = value;
        });
      },
    );
  }
}

class _CupertinoTabScaffoldSample extends StatelessWidget {
  const _CupertinoTabScaffoldSample();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings),
              label: 'Settings',
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (BuildContext context) {
              return CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  middle: Text('Page ${index + 1}'),
                ),
                child: Center(
                  child: CupertinoButton(
                    child: const Text('Next page'),
                    onPressed: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute<void>(
                          builder: (BuildContext context) {
                            return CupertinoPageScaffold(
                              navigationBar: CupertinoNavigationBar(
                                middle: Text('Page ${index + 1} Detail'),
                              ),
                              child: const Center(child: Text('Detail')),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _CupertinoSliverRefreshControlSample extends StatefulWidget {
  const _CupertinoSliverRefreshControlSample();

  @override
  State<_CupertinoSliverRefreshControlSample> createState() =>
      _CupertinoSliverRefreshControlSampleState();
}

class _CupertinoSliverRefreshControlSampleState
    extends State<_CupertinoSliverRefreshControlSample> {
  List<Color> colors = [Colors.red, Colors.green, Colors.blue];

  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      colors = List.of(colors.reversed); // Simple data change
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: CustomScrollView(
        slivers: [
          CupertinoSliverRefreshControl(onRefresh: _refresh),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                height: 50,
                color: colors[index % colors.length],
                alignment: Alignment.center,
                child: Text('Item $index'),
              ),
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class _CupertinoCheckboxSample extends StatefulWidget {
  const _CupertinoCheckboxSample();

  @override
  State<_CupertinoCheckboxSample> createState() =>
      _CupertinoCheckboxSampleState();
}

class _CupertinoCheckboxSampleState extends State<_CupertinoCheckboxSample> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Check me: '),
        CupertinoCheckbox(
          value: _checked,
          onChanged: (bool? value) {
            setState(() {
              _checked = value ?? false;
            });
          },
        ),
      ],
    );
  }
}

class _CupertinoFullscreenDialogTransitionSample extends StatefulWidget {
  const _CupertinoFullscreenDialogTransitionSample();

  @override
  State<_CupertinoFullscreenDialogTransitionSample> createState() =>
      _CupertinoFullscreenDialogTransitionSampleState();
}

class _CupertinoFullscreenDialogTransitionSampleState
    extends State<_CupertinoFullscreenDialogTransitionSample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
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
        CupertinoButton.filled(
          onPressed: () {
            if (_controller.isCompleted) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          },
          child: const Text('Toggle Transition'),
        ),
        Expanded(
          child: CupertinoFullscreenDialogTransition(
            primaryRouteAnimation: _controller,
            secondaryRouteAnimation: const AlwaysStoppedAnimation<double>(
              0.0,
            ), // No secondary transition
            linearTransition: true,
            child: Container(
              color: CupertinoColors.systemYellow,
              alignment: Alignment.center,
              child: const Text('Fullscreen Dialog Child'),
            ),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// AUDIT BATCH 4 – Cupertino Widgets
// ─────────────────────────────────────────────────────────────────────────────

final List<WidgetInfo> cupertinoWidgetsExtra = [
  // 1 ─────────────────────────────────────────
  WidgetInfo(
    name: 'CupertinoListTile',
    description: 'An iOS-style list tile, with a title, leading, and trailing.',
    category: WidgetCategory.cupertino,
    builder: (context) => const _AuditCupertinoListTileSample(),
    codeSnippet: '''
CupertinoListTile(
  title: const Text('Cupertino List Tile'),
  subtitle: const Text('Standard iOS UI element'),
  leading: const Icon(CupertinoIcons.star),
  trailing: const CupertinoListTileChevron(),
  onTap: () {},
)
''',
  ),

  // 2 ─────────────────────────────────────────
  WidgetInfo(
    name: 'CupertinoPopupSurface',
    description: 'A rounded rectangular surface for iOS popups.',
    category: WidgetCategory.cupertino,
    builder: (context) => const _AuditCupertinoPopupSurfaceSample(),
    codeSnippet: '''
CupertinoPopupSurface(
  child: Container(
    padding: const EdgeInsets.all(16),
    child: const Text('Popup Content'),
  ),
)
''',
  ),

  // 3 ─────────────────────────────────────────
  WidgetInfo(
    name: 'CupertinoRadio',
    description: 'An iOS-style radio button.',
    category: WidgetCategory.cupertino,
    builder: (context) => const _AuditCupertinoRadioSample(),
    codeSnippet: '''
CupertinoRadio<int>(
  value: 1,
  groupValue: _selected,
  onChanged: (val) => setState(() => _selected = val!),
)
''',
  ),

  // 4 ─────────────────────────────────────────
  WidgetInfo(
    name: 'CupertinoSliverNavigationBar',
    description:
        'An iOS-style navigation bar that collapses with a large title.',
    category: WidgetCategory.cupertino,
    builder: (context) => const _AuditCupertinoSliverNavSample(),
    codeSnippet: '''
CustomScrollView(
  slivers: [
    CupertinoSliverNavigationBar(
      largeTitle: Text('Library'),
    ),
    SliverFillRemaining(child: Center(child: Text('Content'))),
  ],
)
''',
  ),

  // 5 ─────────────────────────────────────────
  WidgetInfo(
    name: 'CupertinoMagnifier',
    description: 'An iOS-style magnifier lens used for text selection.',
    category: WidgetCategory.cupertino,
    builder: (context) => const _AuditCupertinoMagnifierSample(),
    codeSnippet: '''
CupertinoMagnifier(
  size: const Size(100, 50),
  offset: const Offset(0, -60),
)
''',
  ),
];

// ─── Stateful helpers for audit batch 4 ──────────────────────────────────────

class _AuditCupertinoListTileSample extends StatelessWidget {
  const _AuditCupertinoListTileSample();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoListTile(
          title: const Text('Notifications'),
          leading: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: CupertinoColors.systemRed,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Icon(
              CupertinoIcons.bell_fill,
              color: CupertinoColors.white,
              size: 20,
            ),
          ),
          trailing: const CupertinoListTileChevron(),
          onTap: () {},
        ),
        CupertinoListTile(
          title: const Text('Do Not Disturb'),
          subtitle: const Text('On'),
          leading: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: CupertinoColors.systemPurple,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Icon(
              CupertinoIcons.moon_fill,
              color: CupertinoColors.white,
              size: 20,
            ),
          ),
          trailing: const CupertinoListTileChevron(),
          onTap: () {},
        ),
      ],
    );
  }
}

class _AuditCupertinoPopupSurfaceSample extends StatelessWidget {
  const _AuditCupertinoPopupSurfaceSample();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoButton.filled(
        child: const Text('Show Popup'),
        onPressed: () {
          showCupertinoModalPopup(
            context: context,
            builder: (context) => CupertinoPopupSurface(
              child: Container(
                color: CupertinoColors.systemBackground.resolveFrom(context),
                width: double.infinity,
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('This is a Popup Surface'),
                    const SizedBox(height: 20),
                    CupertinoButton(
                      child: const Text('Close'),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _AuditCupertinoRadioSample extends StatefulWidget {
  const _AuditCupertinoRadioSample();

  @override
  State<_AuditCupertinoRadioSample> createState() =>
      _AuditCupertinoRadioSampleState();
}

class _AuditCupertinoRadioSampleState
    extends State<_AuditCupertinoRadioSample> {
  int _selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CupertinoListTile(
          title: const Text('Option A'),
          trailing: CupertinoRadio<int>(
            value: 1,
            // ignore: deprecated_member_use
            groupValue: _selectedValue,
            // ignore: deprecated_member_use
            onChanged: (val) => setState(() => _selectedValue = val!),
          ),
        ),
        CupertinoListTile(
          title: const Text('Option B'),
          trailing: CupertinoRadio<int>(
            value: 2,
            // ignore: deprecated_member_use
            groupValue: _selectedValue,
            // ignore: deprecated_member_use
            onChanged: (val) => setState(() => _selectedValue = val!),
          ),
        ),
      ],
    );
  }
}

class _AuditCupertinoSliverNavSample extends StatelessWidget {
  const _AuditCupertinoSliverNavSample();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ClipRect(
        child: CustomScrollView(
          slivers: [
            const CupertinoSliverNavigationBar(
              largeTitle: Text('Audit Library'),
              trailing: Icon(CupertinoIcons.add),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => CupertinoListTile(
                  title: Text('Book $index'),
                  subtitle: const Text('Classic Literature'),
                ),
                childCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AuditCupertinoMagnifierSample extends StatefulWidget {
  const _AuditCupertinoMagnifierSample();

  @override
  State<_AuditCupertinoMagnifierSample> createState() =>
      _AuditCupertinoMagnifierSampleState();
}

class _AuditCupertinoMagnifierSampleState
    extends State<_AuditCupertinoMagnifierSample> {
  Offset _dragOffset = Offset.zero;
  bool _showMagnifier = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Drag the icon to see magnifier'),
        const SizedBox(height: 20),
        Stack(
          alignment: Alignment.center,
          children: [
            if (_showMagnifier)
              Positioned(
                left: _dragOffset.dx,
                top: _dragOffset.dy - 60,
                child: const CupertinoMagnifier(size: Size(120, 60)),
              ),
            GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  _dragOffset += details.delta;
                  _showMagnifier = true;
                });
              },
              onPanEnd: (_) => setState(() => _showMagnifier = false),
              child: const Icon(
                CupertinoIcons.search,
                size: 80,
                color: CupertinoColors.activeBlue,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _CupertinoScrollbarSample extends StatefulWidget {
  const _CupertinoScrollbarSample();

  @override
  State<_CupertinoScrollbarSample> createState() =>
      _CupertinoScrollbarSampleState();
}

class _CupertinoScrollbarSampleState extends State<_CupertinoScrollbarSample> {
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
      child: CupertinoScrollbar(
        controller: _controller,
        thumbVisibility: true,
        child: ListView.builder(
          controller: _controller,
          itemCount: 50,
          itemBuilder: (context, index) =>
              ListTile(title: Text('Item \$index')),
        ),
      ),
    );
  }
}
