import 'package:flutter/material.dart';
import '../../models/widget_info.dart';

final List<WidgetInfo> materialWidgets = [
  WidgetInfo(
    name: 'Card',
    description: 'A material design card.',
    category: WidgetCategory.material,
    whenToUse:
        'To group related content on an elevated, rounded surface. Use Card.outlined for a border or Card.filled for a tonal fill, or a Container when you need full decoration control.',
    commonPitfalls: [
      'A Card sizes to its child; give the child constraints or it may collapse.',
      'clipBehavior defaults to Clip.none, so child ink splashes and images can overflow the rounded corners.',
    ],
    relatedWidgets: ['Card.filled', 'Card.outlined', 'Container', 'Material'],
    docsUrl: 'https://api.flutter.dev/flutter/material/Card-class.html',
    tags: ['surface', 'elevation', 'group'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => const Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('This is a Card'),
      ),
    ),
    codeSnippet: '''
Card(
  child: Padding(
    padding: EdgeInsets.all(16.0),
    child: Text('This is a Card'),
  ),
)
''',
  ),
  WidgetInfo(
    name: 'FloatingActionButton',
    description: 'A circular icon button that hovers over content.',
    category: WidgetCategory.material,
    whenToUse:
        'For the single most important action on a screen, anchored above content. Use FloatingActionButton.extended when you need an accompanying label.',
    commonPitfalls: [
      'Place it via Scaffold.floatingActionButton rather than in the body so it floats correctly.',
      'Multiple FABs on one screen need unique heroTag values or the hero animation throws.',
    ],
    relatedWidgets: ['Scaffold', 'IconButton', 'ElevatedButton'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/FloatingActionButton-class.html',
    tags: ['button', 'action', 'fab'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) =>
        FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
    codeSnippet: '''
FloatingActionButton(
  onPressed: () {},
  child: const Icon(Icons.add),
)
''',
  ),
  WidgetInfo(
    name: 'AppBar',
    description: 'A material design app bar.',
    category: WidgetCategory.material,
    whenToUse:
        'As the top bar of a screen for title, navigation and actions. Use it inside Scaffold.appBar; for a collapsing/scrolling bar use a SliverAppBar instead.',
    commonPitfalls: [
      'Placing an AppBar in the body instead of Scaffold.appBar loses safe-area and elevation behavior.',
      'leading is auto-populated with a back or drawer button; set automaticallyImplyLeading: false to suppress it.',
    ],
    relatedWidgets: ['Scaffold', 'BottomAppBar', 'NavigationBar'],
    docsUrl: 'https://api.flutter.dev/flutter/material/AppBar-class.html',
    tags: ['appbar', 'navigation', 'toolbar'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => SizedBox(
      height: 56,
      child: AppBar(
        title: const Text('AppBar Title'),
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.settings)],
      ),
    ),
    codeSnippet: '''
AppBar(
  title: const Text('AppBar Title'),
  leading: const Icon(Icons.menu),
  actions: const [Icon(Icons.settings)],
)
''',
  ),
  WidgetInfo(
    name: 'Chip',
    description: 'A material design chip.',
    category: WidgetCategory.material,
    whenToUse:
        'To display a compact attribute, tag or piece of information. For interactive chips prefer ActionChip, FilterChip, ChoiceChip or InputChip.',
    commonPitfalls: [
      'A plain Chip is not tappable; use one of the interactive chip variants for onPressed/onSelected behavior.',
      'Long labels do not wrap; constrain width or they overflow.',
    ],
    relatedWidgets: ['ActionChip', 'FilterChip', 'InputChip', 'ChoiceChip'],
    docsUrl: 'https://api.flutter.dev/flutter/material/Chip-class.html',
    tags: ['chip', 'tag', 'label'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => const Chip(
      avatar: CircleAvatar(child: Text('A')),
      label: Text('Chip Label'),
    ),
    codeSnippet: '''
Chip(
  avatar: CircleAvatar(child: Text('A')),
  label: Text('Chip Label'),
)
''',
  ),
  WidgetInfo(
    name: 'CircularProgressIndicator',
    description: 'A material design circular progress indicator.',
    category: WidgetCategory.material,
    whenToUse:
        'To show indeterminate or determinate progress in a small circular area. Use LinearProgressIndicator for a horizontal bar.',
    commonPitfalls: [
      'With no value it spins forever; pass value (0.0-1.0) for determinate progress.',
      'It has no intrinsic size constraints in some layouts; wrap in a SizedBox to control diameter.',
    ],
    relatedWidgets: ['LinearProgressIndicator', 'RefreshIndicator'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/CircularProgressIndicator-class.html',
    tags: ['progress', 'loading', 'spinner'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => const CircularProgressIndicator(),
    codeSnippet: '''
CircularProgressIndicator()
''',
  ),
  WidgetInfo(
    name: 'LinearProgressIndicator',
    description: 'A material design linear progress indicator.',
    category: WidgetCategory.material,
    whenToUse:
        'To show progress along a horizontal bar, such as a download or form step. Use CircularProgressIndicator for a compact circular alternative.',
    commonPitfalls: [
      'It expands to its parent\'s full width; constrain it with a SizedBox or it fills the row.',
      'Omitting value yields an indeterminate animation rather than a fixed fill.',
    ],
    relatedWidgets: ['CircularProgressIndicator', 'RefreshIndicator'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/LinearProgressIndicator-class.html',
    tags: ['progress', 'loading', 'bar'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) =>
        const SizedBox(width: 200, child: LinearProgressIndicator()),
    codeSnippet: '''
LinearProgressIndicator()
''',
  ),
  WidgetInfo(
    name: 'Divider',
    description: 'A thin horizontal line, with padding on either side.',
    category: WidgetCategory.material,
    whenToUse:
        'To draw a thin horizontal rule separating content, typically between list items. Use VerticalDivider for vertical separation.',
    commonPitfalls: [
      'Its height includes surrounding space, not just the line thickness; tune thickness and height separately.',
      'A zero-height parent will hide it; it needs vertical room in the layout.',
    ],
    relatedWidgets: ['Divider', 'ListTile', 'ListView'],
    docsUrl: 'https://api.flutter.dev/flutter/material/Divider-class.html',
    tags: ['divider', 'separator', 'line'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) =>
        const SizedBox(width: 200, child: Divider(color: Colors.black)),
    codeSnippet: '''
Divider(color: Colors.black)
''',
  ),
  WidgetInfo(
    name: 'ListTile',
    description:
        'A single fixed-height row that typically contains some text as well as a leading or trailing icon.',
    category: WidgetCategory.material,
    whenToUse:
        'For a fixed-height row with leading/trailing icons, a title and subtitle, ideal inside lists and drawers. Use CheckboxListTile/SwitchListTile/RadioListTile when the row also toggles a value.',
    commonPitfalls: [
      'It needs a Material ancestor for ink splashes; place it inside a Card, ListView or Material.',
      'It enforces a fixed height; very tall subtitles get clipped, so use isThreeLine for longer content.',
    ],
    relatedWidgets: [
      'CheckboxListTile',
      'SwitchListTile',
      'RadioListTile',
      'ListView',
    ],
    docsUrl: 'https://api.flutter.dev/flutter/material/ListTile-class.html',
    tags: ['list', 'row', 'tile'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => const SizedBox(
      width: 300,
      child: Card(
        child: ListTile(
          leading: Icon(Icons.album),
          title: Text('The Enchanted Nightingale'),
          subtitle: Text('Music by Julie Gable. Lyrics by Sidney Bartleby.'),
        ),
      ),
    ),
    codeSnippet: '''
ListTile(
  leading: Icon(Icons.album),
  title: Text('The Enchanted Nightingale'),
  subtitle: Text('Music by Julie Gable. Lyrics by Sidney Bartleby.'),
)
''',
  ),
  WidgetInfo(
    name: 'Tooltip',
    description: 'A material design tooltip.',
    category: WidgetCategory.material,
    whenToUse:
        'To reveal a short text hint on long-press or hover over an icon or control. Wrap the target widget directly.',
    commonPitfalls: [
      'The child must be able to receive pointer events; wrapping a fully transparent area shows nothing.',
      'Very long messages can overflow the screen edge; keep tooltip text short.',
    ],
    relatedWidgets: ['IconButton', 'Icon'],
    docsUrl: 'https://api.flutter.dev/flutter/material/Tooltip-class.html',
    tags: ['tooltip', 'hint', 'hover'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => const Tooltip(
      message: 'I am a Tooltip',
      child: Icon(Icons.info, size: 50),
    ),
    codeSnippet: '''
Tooltip(
  message: 'I am a Tooltip',
  child: Icon(Icons.info, size: 50),
)
''',
  ),
  WidgetInfo(
    name: 'ExpansionTile',
    description:
        'A single-line list tile that produces a dynamically expanded list of other widgets.',
    category: WidgetCategory.material,
    whenToUse:
        'For a single self-managing collapsible row in a list. For a coordinated set of panels with shared expand state use ExpansionPanelList.',
    commonPitfalls: [
      'It manages its own expansion state unless you supply controlled callbacks; rebuilds can reset it without a maintainState/PageStorageKey.',
      'Children render only when expanded, so measuring their size before expansion is unreliable.',
    ],
    relatedWidgets: ['ExpansionPanelList', 'ExpansionPanel', 'ListTile'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/ExpansionTile-class.html',
    tags: ['expand', 'collapse', 'accordion'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => const Card(
      child: ExpansionTile(
        title: Text('Expand me'),
        children: [
          ListTile(title: Text('Child 1')),
          ListTile(title: Text('Child 2')),
        ],
      ),
    ),
    codeSnippet: '''
ExpansionTile(
  title: Text('Expand me'),
  children: [
    ListTile(title: Text('Child 1')),
    ListTile(title: Text('Child 2')),
  ],
)
''',
  ),
  WidgetInfo(
    name: 'ExpansionPanelList',
    description: 'A material design expansion panel list.',
    category: WidgetCategory.material,
    whenToUse:
        'To render a list of independently expandable panels with custom headers and bodies. For a simpler single collapsible row, use ExpansionTile.',
    commonPitfalls: [
      'You must track each panel\'s isExpanded yourself and rebuild in expansionCallback.',
      'It is not scrollable on its own; wrap it in a SingleChildScrollView when it can exceed the viewport.',
    ],
    relatedWidgets: ['ExpansionPanel', 'ExpansionTile', 'ListView'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/ExpansionPanelList-class.html',
    tags: ['expand', 'panel', 'accordion'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => const _ExpansionPanelListSample(),
    codeSnippet: '''
class _ExpansionPanelListSample extends StatefulWidget {
  const _ExpansionPanelListSample();

  @override
  State<_ExpansionPanelListSample> createState() => _ExpansionPanelListSampleState();
}

class _ExpansionPanelListSampleState extends State<_ExpansionPanelListSample> {
  final List<Item> _data = generateItems(3);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _data[index].isExpanded = !isExpanded;
          });
        },
        children: _data.map<ExpansionPanel>((Item item) {
          return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(title: Text(item.headerValue));
            },
            body: ListTile(
              title: Text(item.expandedValue),
              subtitle: const Text('Tap the trash can icon to delete'),
              trailing: const Icon(Icons.delete),
              onTap: () {
                setState(() {
                  _data.removeWhere((Item currentItem) => item == currentItem);
                });
              },
            ),
            isExpanded: item.isExpanded,
          );
        }).toList(),
      ),
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel \$index',
      expandedValue: 'This is item number \$index',
    );
  });
}
''',
  ),
  WidgetInfo(
    name: 'SnackBar',
    description:
        'A lightweight message with an optional action which briefly displays at the bottom of the screen.',
    category: WidgetCategory.material,
    whenToUse:
        'For a brief, transient message at the bottom of the screen, optionally with a single action. Use MaterialBanner for a persistent message that stays until dismissed.',
    commonPitfalls: [
      'Show it via ScaffoldMessenger.of(context), not Scaffold.of, or it will not display reliably.',
      'Calling showSnackBar repeatedly queues them; clear the queue with removeCurrentSnackBar if needed.',
    ],
    relatedWidgets: ['MaterialBanner', 'Scaffold', 'BottomSheet'],
    docsUrl: 'https://api.flutter.dev/flutter/material/SnackBar-class.html',
    tags: ['snackbar', 'toast', 'message'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Yay! A SnackBar!'),
            action: SnackBarAction(label: 'Undo', onPressed: () {}),
          ),
        );
      },
      child: const Text('Show SnackBar'),
    ),
    codeSnippet: '''
ElevatedButton(
  onPressed: () {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Yay! A SnackBar!'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {},
        ),
      ),
    );
  },
  child: const Text('Show SnackBar'),
)
''',
  ),
  WidgetInfo(
    name: 'AlertDialog',
    description: 'A material design alert dialog.',
    category: WidgetCategory.material,
    whenToUse:
        'To interrupt the user for a confirmation or short decision. Use SimpleDialog for a list of choices, or BottomSheet for non-blocking options.',
    commonPitfalls: [
      'Show it with showDialog, not by adding it to the tree directly.',
      'Long content does not scroll by default; wrap content in a SingleChildScrollView or it overflows.',
    ],
    relatedWidgets: ['SimpleDialog', 'AboutDialog', 'BottomSheet'],
    docsUrl: 'https://api.flutter.dev/flutter/material/AlertDialog-class.html',
    tags: ['dialog', 'modal', 'confirm'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('AlertDialog Title'),
            content: const Text('This is the content of the alert dialog.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
      child: const Text('Show AlertDialog'),
    ),
    codeSnippet: '''
showDialog(
  context: context,
  builder: (context) => AlertDialog(
    title: const Text('AlertDialog Title'),
    content: const Text('This is the content of the alert dialog.'),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Cancel'),
      ),
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('OK'),
      ),
    ],
  ),
)
''',
  ),
  WidgetInfo(
    name: 'BottomSheet',
    description: 'A material design bottom sheet.',
    category: WidgetCategory.material,
    whenToUse:
        'To surface supplementary content or actions from the bottom edge. Use showModalBottomSheet for a blocking sheet, or a Drawer for primary navigation.',
    commonPitfalls: [
      'A bare BottomSheet has no height; give its content a bounded height or it collapses.',
      'Use showModalBottomSheet/showBottomSheet rather than constructing BottomSheet directly for correct dismissal behavior.',
    ],
    relatedWidgets: ['Scaffold', 'Drawer', 'SnackBar'],
    docsUrl: 'https://api.flutter.dev/flutter/material/BottomSheet-class.html',
    tags: ['sheet', 'modal', 'bottom'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => ElevatedButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => Container(
            height: 200,
            color: Colors.amber,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('Modal BottomSheet'),
                  ElevatedButton(
                    child: const Text('Close BottomSheet'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: const Text('Show BottomSheet'),
    ),
    codeSnippet: '''
showModalBottomSheet(
  context: context,
  builder: (context) => Container(
    height: 200,
    color: Colors.amber,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text('Modal BottomSheet'),
          ElevatedButton(
            child: const Text('Close BottomSheet'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    ),
  ),
)
''',
  ),
  WidgetInfo(
    name: 'TabBar & TabBarView',
    description:
        'A material design widget that displays a horizontal row of tabs.',
    category: WidgetCategory.material,
    whenToUse:
        'To switch between a small number of peer views with a row of tabs. For top-level destinations prefer NavigationBar or NavigationRail.',
    commonPitfalls: [
      'TabBar and TabBarView must share the same TabController (or be under a DefaultTabController) or they desync.',
      'The controller length must match the number of tabs and views exactly.',
    ],
    relatedWidgets: ['AppBar', 'NavigationBar', 'NavigationRail'],
    tags: ['tabs', 'navigation', 'swipe'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => const _TabBarSample(),
    codeSnippet: '''
class _TabBarSample extends StatelessWidget {
  const _TabBarSample();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          TabBar(
            labelColor: Colors.blue,
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
          SizedBox(
            height: 100,
            child: TabBarView(
              children: [
                Center(child: Icon(Icons.directions_car, size: 50)),
                Center(child: Icon(Icons.directions_transit, size: 50)),
                Center(child: Icon(Icons.directions_bike, size: 50)),
              ],
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
    name: 'Badge',
    description: 'A Material Design badge.',
    category: WidgetCategory.material,
    whenToUse:
        'To overlay a small count or status dot on another widget such as an icon. Wrap the target widget as the child.',
    commonPitfalls: [
      'Without a label it renders as a small dot; pass label for a count.',
      'The badge anchors to the child\'s corner, so a zero-size child gives no useful position.',
    ],
    relatedWidgets: ['Icon', 'IconButton', 'NavigationBar'],
    docsUrl: 'https://api.flutter.dev/flutter/material/Badge-class.html',
    tags: ['badge', 'count', 'notification'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Badge(label: Text('3'), child: Icon(Icons.shopping_cart, size: 30)),
        Badge(label: Text('!'), child: Icon(Icons.notifications, size: 30)),
      ],
    ),
    codeSnippet: '''
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Badge(
      label: Text('3'),
      child: Icon(Icons.shopping_cart, size: 30),
    ),
    Badge(
      label: Text('!'),
      child: Icon(Icons.notifications, size: 30),
    ),
  ],
)
''',
  ),
  WidgetInfo(
    name: 'Drawer',
    description:
        'A material design panel that slides in horizontally from the edge of a Scaffold.',
    category: WidgetCategory.material,
    whenToUse:
        'For a slide-in panel of primary navigation destinations. Use NavigationDrawer for the Material 3 destination-based variant.',
    commonPitfalls: [
      'Assign it to Scaffold.drawer so the swipe gesture and scrim work; placing it in the body does not.',
      'Closing it requires Navigator.pop(context) since it is shown as a route.',
    ],
    relatedWidgets: [
      'NavigationDrawer',
      'Scaffold',
      'DrawerHeader',
      'ListTile',
    ],
    docsUrl: 'https://api.flutter.dev/flutter/material/Drawer-class.html',
    tags: ['drawer', 'navigation', 'menu'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => ElevatedButton(
      onPressed: () {
        // Drawers usually need a Scaffold context with a drawer set.
        // Since we are in a detail screen, we can simulate opening a drawer or just show what it looks like.
        // Here we will push a new route that has a drawer.
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(title: const Text('Drawer Demo')),
              drawer: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const DrawerHeader(
                      decoration: BoxDecoration(color: Colors.blue),
                      child: Text(
                        'Drawer Header',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.message),
                      title: const Text('Messages'),
                      onTap: () => Navigator.pop(context),
                    ),
                    ListTile(
                      leading: const Icon(Icons.account_circle),
                      title: const Text('Profile'),
                      onTap: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              body: const Center(child: Text('Swipe from left or click icon')),
            ),
          ),
        );
      },
      child: const Text('Open Drawer Demo Page'),
    ),
    codeSnippet: '''
Scaffold(
  appBar: AppBar(title: const Text('Drawer Demo')),
  drawer: Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(color: Colors.blue),
          child: Text('Drawer Header'),
        ),
        ListTile(
          leading: const Icon(Icons.message),
          title: const Text('Messages'),
        ),
        ListTile(
          leading: const Icon(Icons.account_circle),
          title: const Text('Profile'),
        ),
      ],
    ),
  ),
  body: const Center(child: Text('Swipe from left or click icon')),
)
''',
  ),
  WidgetInfo(
    name: 'PopupMenuButton',
    description:
        'Displays a menu when pressed and calls onSelected when the menu is dismissed because an item was selected.',
    category: WidgetCategory.material,
    whenToUse:
        'To show a menu of actions anchored to a button, typically in an AppBar. For a richer anchored menu use MenuAnchor.',
    commonPitfalls: [
      'onSelected only fires for items with a value; dividers and disabled items are skipped.',
      'The itemBuilder runs each time the menu opens, so build items from current state, not cached widgets.',
    ],
    relatedWidgets: ['MenuAnchor', 'PopupMenuButton', 'IconButton'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/PopupMenuButton-class.html',
    tags: ['menu', 'popup', 'actions'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => PopupMenuButton<String>(
      onSelected: (String result) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Selected: $result')));
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(value: 'Item 1', child: Text('Item 1')),
        const PopupMenuItem<String>(value: 'Item 2', child: Text('Item 2')),
      ],
    ),
    codeSnippet: '''
PopupMenuButton<String>(
  onSelected: (String result) {
    print('Selected: \$result');
  },
  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
    const PopupMenuItem<String>(
      value: 'Item 1',
      child: Text('Item 1'),
    ),
    const PopupMenuItem<String>(
      value: 'Item 2',
      child: Text('Item 2'),
    ),
  ],
)
''',
  ),
  WidgetInfo(
    name: 'Stepper',
    description:
        'A material design stepper widget that displays progress through a sequence of steps.',
    category: WidgetCategory.material,
    whenToUse:
        'To guide users through a sequence of numbered steps, such as a multi-stage form. For a simpler progress display use a LinearProgressIndicator.',
    commonPitfalls: [
      'You must manage currentStep and respond to onStepContinue/onStepCancel yourself.',
      'A vertical Stepper inside an unbounded-height parent can overflow; give it bounded height or use a scroll view.',
    ],
    relatedWidgets: ['Form', 'LinearProgressIndicator'],
    docsUrl: 'https://api.flutter.dev/flutter/material/Stepper-class.html',
    tags: ['stepper', 'wizard', 'steps'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => const _StepperSample(),
    codeSnippet: '''
class _StepperSample extends StatefulWidget {
  const _StepperSample();

  @override
  State<_StepperSample> createState() => _StepperSampleState();
}

class _StepperSampleState extends State<_StepperSample> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _index,
      onStepCancel: () {
        if (_index > 0) {
          setState(() {
            _index -= 1;
          });
        }
      },
      onStepContinue: () {
        if (_index < 2) {
          setState(() {
            _index += 1;
          });
        }
      },
      onStepTapped: (int index) {
        setState(() {
          _index = index;
        });
      },
      steps: <Step>[
        Step(
          title: const Text('Step 1'),
          content: Container(alignment: Alignment.centerLeft, child: const Text('Content for Step 1')),
          isActive: _index >= 0,
          state: _index > 0 ? StepState.complete : StepState.indexed,
        ),
        Step(
          title: const Text('Step 2'),
          content: Container(alignment: Alignment.centerLeft, child: const Text('Content for Step 2')),
          isActive: _index >= 1,
          state: _index > 1 ? StepState.complete : StepState.indexed,
        ),
        Step(
          title: const Text('Step 3'),
          content: Container(alignment: Alignment.centerLeft, child: const Text('Content for Step 3')),
          isActive: _index >= 2,
          state: _index > 2 ? StepState.complete : StepState.indexed,
        ),
      ],
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'DataTable',
    description: 'A material design data table.',
    category: WidgetCategory.material,
    whenToUse:
        'For a small, fully materialized table of rows and columns. For large or paged data use PaginatedDataTable.',
    commonPitfalls: [
      'It builds all rows at once, so it is unsuitable for large datasets.',
      'It does not scroll by itself; wrap in SingleChildScrollView (often horizontally) to avoid overflow.',
    ],
    relatedWidgets: ['PaginatedDataTable', 'ListView'],
    docsUrl: 'https://api.flutter.dev/flutter/material/DataTable-class.html',
    tags: ['table', 'grid', 'data'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text('Name', style: TextStyle(fontStyle: FontStyle.italic)),
        ),
        DataColumn(
          label: Text('Age', style: TextStyle(fontStyle: FontStyle.italic)),
        ),
        DataColumn(
          label: Text('Role', style: TextStyle(fontStyle: FontStyle.italic)),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Sarah')),
            DataCell(Text('19')),
            DataCell(Text('Student')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Janine')),
            DataCell(Text('43')),
            DataCell(Text('Professor')),
          ],
        ),
      ],
    ),
    codeSnippet: '''
DataTable(
  columns: const <DataColumn>[
    DataColumn(label: Text('Name', style: TextStyle(fontStyle: FontStyle.italic))),
    DataColumn(label: Text('Age', style: TextStyle(fontStyle: FontStyle.italic))),
    DataColumn(label: Text('Role', style: TextStyle(fontStyle: FontStyle.italic))),
  ],
  rows: const <DataRow>[
    DataRow(
      cells: <DataCell>[
        DataCell(Text('Sarah')),
        DataCell(Text('19')),
        DataCell(Text('Student')),
      ],
    ),
    DataRow(
      cells: <DataCell>[
        DataCell(Text('Janine')),
        DataCell(Text('43')),
        DataCell(Text('Professor')),
      ],
    ),
  ],
)
''',
  ),
  WidgetInfo(
    name: 'NavigationRail',
    description:
        'A material design widget that is displayed on the left or right of an app to navigate between a small number of views.',
    category: WidgetCategory.material,
    whenToUse:
        'For top-level navigation on wider screens (tablets/desktop) as a vertical side rail. Use NavigationBar on compact/phone layouts.',
    commonPitfalls: [
      'It needs a bounded height; place it in a Row with Expanded content beside it.',
      'You must track selectedIndex and rebuild on onDestinationSelected.',
    ],
    relatedWidgets: ['NavigationBar', 'NavigationDrawer', 'Scaffold'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/NavigationRail-class.html',
    tags: ['navigation', 'rail', 'sidebar'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => const _NavigationRailSample(),
    codeSnippet: '''
class _NavigationRailSample extends StatefulWidget {
  const _NavigationRailSample();

  @override
  State<_NavigationRailSample> createState() => _NavigationRailSampleState();
}

class _NavigationRailSampleState extends State<_NavigationRailSample> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        NavigationRail(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          labelType: NavigationRailLabelType.selected,
          destinations: const <NavigationRailDestination>[
            NavigationRailDestination(
              icon: Icon(Icons.favorite_border),
              selectedIcon: Icon(Icons.favorite),
              label: Text('First'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.bookmark_border),
              selectedIcon: Icon(Icons.bookmark),
              label: Text('Second'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.star_border),
              selectedIcon: Icon(Icons.star),
              label: Text('Third'),
            ),
          ],
        ),
        const VerticalDivider(thickness: 1, width: 1),
        Expanded(
          child: Center(
            child: Text('selectedIndex: \$_selectedIndex'),
          ),
        ),
      ],
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'BottomNavigationBar',
    description:
        'A material widget that\'s displayed at the bottom of an app for selecting among a small number of views.',
    category: WidgetCategory.material,
    whenToUse:
        'The legacy Material 2 bottom navigation control. For new Material 3 apps prefer NavigationBar.',
    commonPitfalls: [
      'With four or more items it defaults to shifting type, hiding labels; set type: BottomNavigationBarType.fixed to keep them.',
      'You must manage currentIndex and rebuild in onTap.',
    ],
    relatedWidgets: ['NavigationBar', 'NavigationRail', 'Scaffold'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html',
    tags: ['navigation', 'bottom', 'tabs'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => const _BottomNavigationBarSample(),
    codeSnippet: '''
class _BottomNavigationBarSample extends StatefulWidget {
  const _BottomNavigationBarSample();

  @override
  State<_BottomNavigationBarSample> createState() => _BottomNavigationBarSampleState();
}

class _BottomNavigationBarSampleState extends State<_BottomNavigationBarSample> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'School',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'NavigationBar',
    description: 'Material 3 navigation bar.',
    category: WidgetCategory.material,
    whenToUse:
        'The Material 3 bottom navigation bar for 3-5 top-level destinations on phones. Use NavigationRail for wide layouts.',
    commonPitfalls: [
      'You must track selectedIndex and update it in onDestinationSelected.',
      'Each destination should be a NavigationDestination; mixing other widgets breaks layout.',
    ],
    relatedWidgets: [
      'BottomNavigationBar',
      'NavigationRail',
      'NavigationDrawer',
      'Scaffold',
    ],
    docsUrl:
        'https://api.flutter.dev/flutter/material/NavigationBar-class.html',
    tags: ['navigation', 'bottom', 'material3'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => const _NavigationBarSample(),
    codeSnippet: '''
class _NavigationBarSample extends StatefulWidget {
  const _NavigationBarSample();

  @override
  State<_NavigationBarSample> createState() => _NavigationBarSampleState();
}

class _NavigationBarSampleState extends State<_NavigationBarSample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;
        });
      },
      selectedIndex: currentPageIndex,
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.school),
          icon: Icon(Icons.school_outlined),
          label: 'School',
        ),
      ],
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'MaterialBanner',
    description:
        'A banner displays an important, succinct message, and provides actions for users to address (or dismiss the banner).',
    category: WidgetCategory.material,
    whenToUse:
        'For a prominent, persistent message at the top of the content that stays until dismissed. Use SnackBar for brief, auto-dismissing messages.',
    commonPitfalls: [
      'Show and hide it via ScaffoldMessenger; it will not disappear on its own.',
      'Forgetting to call hideCurrentMaterialBanner leaves it stacked on screen.',
    ],
    relatedWidgets: ['SnackBar', 'Banner', 'Scaffold'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/MaterialBanner-class.html',
    tags: ['banner', 'message', 'persistent'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => const _MaterialBannerSample(),
    codeSnippet: '''
class _MaterialBannerSample extends StatelessWidget {
  const _MaterialBannerSample();

  @override
  Widget build(BuildContext context) {
    return MaterialBanner(
      content: const Text('Error retrieving data'),
      leading: const Icon(Icons.error),
      backgroundColor: Colors.amberAccent,
      actions: <Widget>[
        TextButton(
          onPressed: () {},
          child: const Text('RETRY'),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('DISMISS'),
        ),
      ],
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'AboutListTile',
    description: 'A list tile that shows an "About" box.',
    category: WidgetCategory.material,
    whenToUse:
        'To add a ready-made About entry, usually inside a Drawer, that opens the standard about dialog with license info.',
    commonPitfalls: [
      'It needs a Material/Scaffold ancestor to show its ink and to push the about route.',
      'The tile shows default text unless you supply applicationName and related fields.',
    ],
    relatedWidgets: ['AboutDialog', 'ListTile', 'Drawer'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/AboutListTile-class.html',
    tags: ['about', 'license', 'tile'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => const AboutListTile(
      icon: Icon(Icons.info),
      applicationName: 'Flutter Widget Samples',
      applicationVersion: '1.0.0',
      applicationLegalese: '© 2023 Company Name',
      aboutBoxChildren: [Text('This is an example of an AboutListTile.')],
    ),
    codeSnippet: '''
AboutListTile(
  icon: Icon(Icons.info),
  applicationName: 'Flutter Widget Samples',
  applicationVersion: '1.0.0',
  applicationLegalese: '© 2023 Company Name',
  aboutBoxChildren: [
    Text('This is an example of an AboutListTile.'),
  ],
)
''',
  ),
  WidgetInfo(
    name: 'IconButton',
    description: 'A material design icon button.',
    category: WidgetCategory.material,
    whenToUse:
        'For a tappable icon-only action, common in app bars and toolbars. Use a labeled button (TextButton, ElevatedButton) when text improves clarity.',
    commonPitfalls: [
      'Always provide a tooltip for accessibility since there is no visible label.',
      'Its tap target is padded to 48x48 by default; shrinking visualDensity can hurt touch accessibility.',
    ],
    relatedWidgets: ['Icon', 'TextButton', 'Tooltip', 'FloatingActionButton'],
    docsUrl: 'https://api.flutter.dev/flutter/material/IconButton-class.html',
    tags: ['button', 'icon', 'action'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => IconButton(
      icon: const Icon(Icons.thumb_up),
      onPressed: () {},
      tooltip: 'Like',
    ),
    codeSnippet: '''
IconButton(
  icon: const Icon(Icons.thumb_up),
  onPressed: () {},
  tooltip: 'Like',
)
''',
  ),
  WidgetInfo(
    name: 'TextButton',
    description: 'A material design text button.',
    category: WidgetCategory.material,
    whenToUse:
        'For low-emphasis actions like dialog dismiss or inline links. Use OutlinedButton for medium emphasis and ElevatedButton/FilledButton for high emphasis.',
    commonPitfalls: [
      'Its low contrast can fail to read as a button; reserve it for secondary actions.',
      'Style it through styleFrom rather than wrapping in extra padding widgets.',
    ],
    relatedWidgets: ['OutlinedButton', 'ElevatedButton', 'FilledButton'],
    docsUrl: 'https://api.flutter.dev/flutter/material/TextButton-class.html',
    tags: ['button', 'text', 'action'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) =>
        TextButton(onPressed: () {}, child: const Text('Text Button')),
    codeSnippet: '''
TextButton(
  onPressed: () {},
  child: const Text('Text Button'),
)
''',
  ),
  WidgetInfo(
    name: 'OutlinedButton',
    description: 'A material design outlined button.',
    category: WidgetCategory.material,
    whenToUse:
        'For medium-emphasis actions that need more attention than a TextButton but less than a filled button. Use ElevatedButton/FilledButton for the primary action.',
    commonPitfalls: [
      'The border color follows the theme; override it via styleFrom side for custom outlines.',
      'Like other buttons, a null onPressed disables it rather than just removing the handler.',
    ],
    relatedWidgets: ['TextButton', 'ElevatedButton', 'FilledButton'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/OutlinedButton-class.html',
    tags: ['button', 'outlined', 'action'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) =>
        OutlinedButton(onPressed: () {}, child: const Text('Outlined Button')),
    codeSnippet: '''
OutlinedButton(
  onPressed: () {},
  child: const Text('Outlined Button'),
)
''',
  ),
  WidgetInfo(
    name: 'SafeArea',
    description:
        'A widget that insets its child by sufficient padding to avoid intrusions by the operating system.',
    category: WidgetCategory.material,
    whenToUse:
        'To inset content away from notches, status bars and rounded corners. Wrap the screen body that would otherwise be obscured by system UI.',
    commonPitfalls: [
      'Nesting multiple SafeAreas double-applies padding; apply it once near the top of the subtree.',
      'It only pads where intrusions exist, so its effect varies by device and orientation.',
    ],
    relatedWidgets: ['Scaffold', 'Container', 'SizedBox'],
    tags: ['layout', 'inset', 'padding'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => Container(
      height: 100,
      color: Colors.blue,
      child: const SafeArea(
        child: Card(
          color: Colors.white,
          child: Center(child: Text('Safe Area Content')),
        ),
      ),
    ),
    codeSnippet: '''
SafeArea(
  child: Card(
    child: Center(child: Text('Safe Area Content')),
  ),
)
''',
  ),
  WidgetInfo(
    name: 'Scaffold',
    description:
        'Implements the basic material design visual layout structure.',
    category: WidgetCategory.material,
    whenToUse:
        'As the structural frame of a screen, hosting app bar, body, FAB, drawer and bottom navigation. Use it once per route as the top-level page layout.',
    commonPitfalls: [
      'Scaffold.of(context) needs a context below the Scaffold; use a Builder or ScaffoldMessenger for snackbars.',
      'Putting a Scaffold inside another Scaffold\'s body is usually a layout smell unless intentional (e.g. nested navigation).',
    ],
    relatedWidgets: [
      'AppBar',
      'Drawer',
      'FloatingActionButton',
      'BottomNavigationBar',
    ],
    docsUrl: 'https://api.flutter.dev/flutter/material/Scaffold-class.html',
    tags: ['layout', 'screen', 'structure'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => SizedBox(
      height: 300,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Scaffold Demo'),
          automaticallyImplyLeading: false,
        ),
        body: const Center(child: Text('Body Content')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    ),
    codeSnippet: '''
Scaffold(
  appBar: AppBar(
    title: const Text('Scaffold Demo'),
  ),
  body: const Center(child: Text('Body Content')),
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: const Icon(Icons.add),
  ),
)
''',
  ),
  WidgetInfo(
    name: 'NavigationDrawer',
    description:
        'A Material Design panel that slides in horizontally from the edge of a Scaffold to show navigation destinations.',
    category: WidgetCategory.material,
    whenToUse:
        'The Material 3 destination-based slide-in drawer. Use the classic Drawer when you want fully custom children instead of destinations.',
    commonPitfalls: [
      'Track selectedIndex and update it in onDestinationSelected.',
      'Assign it to Scaffold.drawer so the gesture and scrim behave correctly.',
    ],
    relatedWidgets: ['Drawer', 'NavigationBar', 'NavigationRail', 'Scaffold'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/NavigationDrawer-class.html',
    tags: ['drawer', 'navigation', 'material3'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const _NavigationDrawerSample(),
          ),
        );
      },
      child: const Text('Open Navigation Drawer Demo'),
    ),
    codeSnippet: '''
Scaffold(
  appBar: AppBar(title: const Text('Navigation Drawer Demo')),
  drawer: NavigationDrawer(
    onDestinationSelected: (index) {},
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
        child: Text('Header', style: Theme.of(context).textTheme.titleSmall),
      ),
      const NavigationDrawerDestination(
        icon: Icon(Icons.message_outlined),
        label: Text('Messages'),
      ),
      const NavigationDrawerDestination(
        icon: Icon(Icons.video_camera_back_outlined),
        label: Text('Video'),
      ),
      const Divider(indent: 28, endIndent: 28),
      Padding(
        padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
        child: Text('Labels', style: Theme.of(context).textTheme.titleSmall),
      ),
      const NavigationDrawerDestination(
        icon: Icon(Icons.label_outline),
        label: Text('Label 1'),
      ),
    ],
  ),
  body: const Center(child: Text('Body Content')),
)
''',
  ),
  WidgetInfo(
    name: 'SearchAnchor',
    description: 'A Material 3 search anchor for displaying search results.',
    category: WidgetCategory.material,
    whenToUse:
        'To build a Material 3 search experience where tapping a bar opens a full search view with live suggestions. Use SearchBar alone when you only need the input field.',
    commonPitfalls: [
      'You must supply a suggestionsBuilder that returns results for the current query; returning stale items confuses users.',
      'Manage the SearchController and close the view explicitly after a selection.',
    ],
    relatedWidgets: ['SearchBar', 'MenuAnchor', 'TextField'],
    docsUrl: 'https://api.flutter.dev/flutter/material/SearchAnchor-class.html',
    tags: ['search', 'suggestions', 'material3'],
    difficulty: WidgetDifficulty.advanced,
    builder: (context) => SearchAnchor(
      builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          controller: controller,
          padding: const WidgetStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 16.0),
          ),
          onTap: () {
            controller.openView();
          },
          onChanged: (_) {
            controller.openView();
          },
          leading: const Icon(Icons.search),
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        return List<ListTile>.generate(5, (int index) {
          final String item = 'item $index';
          return ListTile(
            title: Text(item),
            onTap: () {
              controller.closeView(item);
            },
          );
        });
      },
    ),
    codeSnippet: '''
SearchAnchor(
  builder: (BuildContext context, SearchController controller) {
    return SearchBar(
      controller: controller,
      onTap: () => controller.openView(),
      onChanged: (_) => controller.openView(),
      leading: const Icon(Icons.search),
    );
  },
  suggestionsBuilder: (BuildContext context, SearchController controller) {
    return List<ListTile>.generate(5, (int index) {
      final String item = 'item \$index';
      return ListTile(
        title: Text(item),
        onTap: () {
          controller.closeView(item);
        },
      );
    });
  },
)
''',
  ),
  WidgetInfo(
    name: 'MenuBar',
    description: 'A Material 3 menu bar widget.',
    category: WidgetCategory.material,
    whenToUse:
        'For a persistent horizontal menu bar of cascading menus, typical on desktop. For a single contextual/anchored menu use MenuAnchor.',
    commonPitfalls: [
      'Menu items must be SubmenuButton/MenuItemButton; arbitrary widgets break keyboard traversal.',
      'It is designed for desktop ergonomics and feels out of place on small touch screens.',
    ],
    relatedWidgets: ['MenuAnchor', 'PopupMenuButton'],
    docsUrl: 'https://api.flutter.dev/flutter/material/MenuBar-class.html',
    tags: ['menu', 'desktop', 'bar'],
    difficulty: WidgetDifficulty.advanced,
    builder: (context) => Row(
      children: [
        Expanded(
          child: MenuBar(
            children: <Widget>[
              SubmenuButton(
                menuChildren: <Widget>[
                  MenuItemButton(
                    onPressed: () {},
                    child: const MenuAcceleratorLabel('&Save'),
                  ),
                  MenuItemButton(
                    onPressed: () {},
                    child: const MenuAcceleratorLabel('&Quit'),
                  ),
                ],
                child: const MenuAcceleratorLabel('&File'),
              ),
              SubmenuButton(
                menuChildren: <Widget>[
                  MenuItemButton(
                    onPressed: () {},
                    child: const MenuAcceleratorLabel('&About'),
                  ),
                ],
                child: const MenuAcceleratorLabel('&Help'),
              ),
            ],
          ),
        ),
      ],
    ),
    codeSnippet: '''
MenuBar(
  children: <Widget>[
    SubmenuButton(
      menuChildren: <Widget>[
        MenuItemButton(
          onPressed: () {},
          child: const MenuAcceleratorLabel('&Save'),
        ),
        MenuItemButton(
          onPressed: () {},
          child: const MenuAcceleratorLabel('&Quit'),
        ),
      ],
      child: const MenuAcceleratorLabel('&File'),
    ),
    SubmenuButton(
      menuChildren: <Widget>[
        MenuItemButton(
          onPressed: () {},
          child: const MenuAcceleratorLabel('&About'),
        ),
      ],
      child: const MenuAcceleratorLabel('&Help'),
    ),
  ],
)
''',
  ),
  WidgetInfo(
    name: 'MenuAnchor',
    description: 'A Material 3 anchor for a menu.',
    category: WidgetCategory.material,
    whenToUse:
        'To attach a cascading menu to any widget and control its open state. Use PopupMenuButton for the simpler icon-triggered menu case.',
    commonPitfalls: [
      'The builder must wire up the controller\'s open/close; forgetting to call controller.open leaves nothing visible.',
      'Menu children should be MenuItemButton/SubmenuButton for correct focus and keyboard handling.',
    ],
    relatedWidgets: ['MenuBar', 'PopupMenuButton', 'SearchAnchor'],
    docsUrl: 'https://api.flutter.dev/flutter/material/MenuAnchor-class.html',
    tags: ['menu', 'anchor', 'material3'],
    difficulty: WidgetDifficulty.advanced,
    builder: (context) => const _MenuAnchorSample(),
    codeSnippet: '''
class _MenuAnchorSample extends StatefulWidget {
  const _MenuAnchorSample();

  @override
  State<_MenuAnchorSample> createState() => _MenuAnchorSampleState();
}

class _MenuAnchorSampleState extends State<_MenuAnchorSample> {
  String? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuAnchor(
          builder: (BuildContext context, MenuController controller, Widget? child) {
            return IconButton(
              onPressed: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
              icon: const Icon(Icons.more_vert),
            );
          },
          menuChildren: <Widget>[
            MenuItemButton(
              onPressed: () => setState(() => selectedMenu = 'Menu 1'),
              child: const Text('Menu 1'),
            ),
            MenuItemButton(
              onPressed: () => setState(() => selectedMenu = 'Menu 2'),
              child: const Text('Menu 2'),
            ),
          ],
        ),
        if (selectedMenu != null) Text('Selected: \$selectedMenu'),
      ],
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'SliverAppBar',
    description:
        'A material design app bar that integrates with a CustomScrollView.',
    category: WidgetCategory.material,
    whenToUse:
        'For an app bar that scrolls, collapses or pins inside a CustomScrollView. Use a plain AppBar for a fixed, non-scrolling bar.',
    commonPitfalls: [
      'It only works as a sliver inside a CustomScrollView, not directly in a Scaffold.appBar.',
      'floating, pinned and snap interact subtly; the wrong combination yields jumpy scroll behavior.',
    ],
    relatedWidgets: ['AppBar', 'Scaffold'],
    docsUrl: 'https://api.flutter.dev/flutter/material/SliverAppBar-class.html',
    tags: ['appbar', 'sliver', 'scroll'],
    difficulty: WidgetDifficulty.advanced,
    builder: (context) => SizedBox(
      height: 300,
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            expandedHeight: 100.0,
            flexibleSpace: FlexibleSpaceBar(title: Text('SliverAppBar')),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              return ListTile(title: Text('Item $index'));
            }, childCount: 20),
          ),
        ],
      ),
    ),
    codeSnippet: '''
CustomScrollView(
  slivers: [
    const SliverAppBar(
      pinned: true,
      expandedHeight: 100.0,
      flexibleSpace: FlexibleSpaceBar(
        title: Text('SliverAppBar'),
      ),
    ),
    SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return ListTile(title: Text('Item \$index'));
        },
        childCount: 20,
      ),
    ),
  ],
)
''',
  ),
  WidgetInfo(
    name: 'ActionChip',
    description: 'A chip that represents an action.',
    category: WidgetCategory.material,
    whenToUse:
        'For a chip that triggers an action when tapped, like a quick command. Use FilterChip/ChoiceChip for selection rather than actions.',
    commonPitfalls: [
      'onPressed is required for it to be interactive; without it the chip looks disabled.',
      'It does not maintain a selected state; use FilterChip if you need toggling.',
    ],
    relatedWidgets: ['Chip', 'FilterChip', 'InputChip', 'ChoiceChip'],
    docsUrl: 'https://api.flutter.dev/flutter/material/ActionChip-class.html',
    tags: ['chip', 'action', 'button'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => ActionChip(
      avatar: const Icon(Icons.favorite),
      label: const Text('Action Chip'),
      onPressed: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Action Chip Pressed')));
      },
    ),
    codeSnippet: '''
ActionChip(
  avatar: const Icon(Icons.favorite),
  label: const Text('Action Chip'),
  onPressed: () {
    print('Action Chip Pressed');
  },
)
''',
  ),
  WidgetInfo(
    name: 'FilterChip',
    description:
        'A chip that uses a checkmark to indicate whether it is selected.',
    category: WidgetCategory.material,
    whenToUse:
        'To let users toggle a filter on or off, showing a checkmark when selected. For single-choice selection use ChoiceChip.',
    commonPitfalls: [
      'You must track selected and update it in onSelected; the chip does not store its own state.',
      'Multiple filters need separate state values, not a shared one.',
    ],
    relatedWidgets: ['ChoiceChip', 'ActionChip', 'InputChip', 'Chip'],
    docsUrl: 'https://api.flutter.dev/flutter/material/FilterChip-class.html',
    tags: ['chip', 'filter', 'toggle'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => const _FilterChipSample(),
    codeSnippet: '''
class _FilterChipSample extends StatefulWidget {
  const _FilterChipSample();

  @override
  State<_FilterChipSample> createState() => _FilterChipSampleState();
}

class _FilterChipSampleState extends State<_FilterChipSample> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: const Text('Filter Chip'),
      selected: _isSelected,
      onSelected: (bool selected) {
        setState(() {
          _isSelected = selected;
        });
      },
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'ChoiceChip',
    description: 'A chip that allows selecting a single choice from a set.',
    category: WidgetCategory.material,
    whenToUse:
        'To pick a single option from a small set, like a radio group rendered as chips. Use FilterChip for multi-select filtering.',
    commonPitfalls: [
      'Enforce single selection yourself by clearing the previous choice in onSelected.',
      'It relies on the selected flag; forgetting to rebuild leaves the UI out of sync.',
    ],
    relatedWidgets: ['FilterChip', 'ActionChip', 'InputChip', 'Chip'],
    docsUrl: 'https://api.flutter.dev/flutter/material/ChoiceChip-class.html',
    tags: ['chip', 'choice', 'select'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => const _ChoiceChipSample(),
    codeSnippet: '''
class _ChoiceChipSample extends StatefulWidget {
  const _ChoiceChipSample();

  @override
  State<_ChoiceChipSample> createState() => _ChoiceChipSampleState();
}

class _ChoiceChipSampleState extends State<_ChoiceChipSample> {
  int? _value = 1;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5.0,
      children: List<Widget>.generate(
        3,
        (int index) {
          return ChoiceChip(
            label: Text('Item \$index'),
            selected: _value == index,
            onSelected: (bool selected) {
              setState(() {
                _value = selected ? index : null;
              });
            },
          );
        },
      ).toList(),
    );
  }
}
''',
  ),
  WidgetInfo(
    name: 'InputChip',
    description:
        'A chip that represents a complex piece of information, such as an entity (person, place, or thing) or text, in a compact form.',
    category: WidgetCategory.material,
    whenToUse:
        'To represent a user-entered entity, often deletable, such as a recipient token. For action or filter behavior use ActionChip or FilterChip.',
    commonPitfalls: [
      'Wire onDeleted to actually remove the underlying data, not just hide the chip.',
      'It supports selection, deletion and pressing at once; conflicting handlers can confuse users.',
    ],
    relatedWidgets: ['Chip', 'FilterChip', 'ChoiceChip', 'ActionChip'],
    docsUrl: 'https://api.flutter.dev/flutter/material/InputChip-class.html',
    tags: ['chip', 'input', 'token'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => InputChip(
      avatar: const CircleAvatar(child: Text('AB')),
      label: const Text('Input Chip'),
      onDeleted: () {},
    ),
    codeSnippet: '''
InputChip(
  avatar: const CircleAvatar(child: Text('AB')),
  label: const Text('Input Chip'),
  onDeleted: () {},
)
''',
  ),
  WidgetInfo(
    name: 'BottomAppBar',
    description:
        'A container that is typically used with Scaffold.bottomNavigationBar, and can have a notch along the top that makes room for an overlapping FloatingActionButton.',
    category: WidgetCategory.material,
    whenToUse:
        'As a bottom bar that can host actions and notch a docked FloatingActionButton. For top-level destination navigation prefer NavigationBar.',
    commonPitfalls: [
      'The FAB notch only appears when shape is set and the FAB location is docked.',
      'Place it in Scaffold.bottomNavigationBar so it interacts with the FAB correctly.',
    ],
    relatedWidgets: [
      'FloatingActionButton',
      'NavigationBar',
      'Scaffold',
      'AppBar',
    ],
    docsUrl: 'https://api.flutter.dev/flutter/material/BottomAppBar-class.html',
    tags: ['appbar', 'bottom', 'fab'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0),
      ),
      body: const Center(child: Text('BottomAppBar with FAB')),
    ),
    codeSnippet: '''
Scaffold(
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: const Icon(Icons.add),
  ),
  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  bottomNavigationBar: BottomAppBar(
    shape: const CircularNotchedRectangle(),
    child: Container(height: 50.0),
  ),
  body: const Center(child: Text('BottomAppBar with FAB')),
)
''',
  ),
  WidgetInfo(
    name: 'UserAccountsDrawerHeader',
    description:
        'A material design drawer header that identifies the user of the application.',
    category: WidgetCategory.material,
    whenToUse:
        'As a drawer header showing the signed-in user\'s name, email and avatar. Use the plain DrawerHeader when you do not need account details.',
    commonPitfalls: [
      'It expects a Material/Scaffold ancestor and is meant to sit at the top of a Drawer\'s children.',
      'Long names or emails are truncated; very long values are clipped rather than wrapped.',
    ],
    relatedWidgets: [
      'DrawerHeader',
      'Drawer',
      'CircleAvatar',
      'NavigationDrawer',
    ],
    docsUrl:
        'https://api.flutter.dev/flutter/material/UserAccountsDrawerHeader-class.html',
    tags: ['drawer', 'header', 'account'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => const UserAccountsDrawerHeader(
      accountName: Text('John Doe'),
      accountEmail: Text('john.doe@example.com'),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        child: Text('JD'),
      ),
      otherAccountsPictures: [
        CircleAvatar(backgroundColor: Colors.white, child: Text('A')),
      ],
      decoration: BoxDecoration(color: Colors.blue),
    ),
    codeSnippet: '''
UserAccountsDrawerHeader(
  accountName: Text('John Doe'),
  accountEmail: Text('john.doe@example.com'),
  currentAccountPicture: CircleAvatar(
    backgroundColor: Colors.white,
    child: Text('JD'),
  ),
  otherAccountsPictures: [
    CircleAvatar(
      backgroundColor: Colors.white,
      child: Text('A'),
    ),
  ],
  decoration: BoxDecoration(color: Colors.blue),
)
''',
  ),
  WidgetInfo(
    name: 'AboutDialog',
    description: 'A dialog that displays information about the application.',
    category: WidgetCategory.material,
    whenToUse:
        'To show the standard application about box with version and license links. Use showAboutDialog, or AboutListTile to add an entry that opens it.',
    commonPitfalls: [
      'Trigger it via showAboutDialog rather than building it inline.',
      'It shows generic placeholders unless you pass applicationName, version and icon.',
    ],
    relatedWidgets: ['AboutListTile', 'AlertDialog', 'SimpleDialog'],
    docsUrl: 'https://api.flutter.dev/flutter/material/AboutDialog-class.html',
    tags: ['about', 'dialog', 'license'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => ElevatedButton(
      onPressed: () {
        showAboutDialog(
          context: context,
          applicationIcon: const FlutterLogo(),
          applicationName: 'Widget Catalog',
          applicationVersion: '1.0.0',
          applicationLegalese: '© 2024 Widget Co.',
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text('This is an app showing Flutter widgets.'),
            ),
          ],
        );
      },
      child: const Text('Show About Dialog'),
    ),
    codeSnippet: '''
showAboutDialog(
  context: context,
  applicationIcon: const FlutterLogo(),
  applicationName: 'Widget Catalog',
  applicationVersion: '1.0.0',
  applicationLegalese: '© 2024 Widget Co.',
  children: [
    const Padding(
      padding: EdgeInsets.only(top: 15),
      child: Text('This is an app showing Flutter widgets.'),
    ),
  ],
)
''',
  ),
  WidgetInfo(
    name: 'VerticalDivider',
    description: 'A thin vertical line, with padding on either side.',
    category: WidgetCategory.material,
    whenToUse:
        'To draw a thin vertical rule between items laid out in a Row. Use Divider for horizontal separation.',
    commonPitfalls: [
      'Its width includes the surrounding space, not just the line; tune thickness separately.',
      'It needs a bounded height, so a Row without a fixed height may not show it.',
    ],
    relatedWidgets: ['Divider', 'Row'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/VerticalDivider-class.html',
    tags: ['divider', 'vertical', 'separator'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => const SizedBox(
      height: 100,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Left'),
          VerticalDivider(
            width: 20,
            thickness: 1,
            indent: 20,
            endIndent: 0,
            color: Colors.grey,
          ),
          Text('Right'),
        ],
      ),
    ),
    codeSnippet: '''
SizedBox(
  height: 100,
  child: Row(
    children: [
      Text('Left'),
      VerticalDivider(
        width: 20,
        thickness: 1,
        indent: 20,
        endIndent: 0,
        color: Colors.grey,
      ),
      Text('Right'),
    ],
  ),
)
''',
  ),
  WidgetInfo(
    name: 'CloseButton',
    description: 'A Material Design close button.',
    category: WidgetCategory.material,
    whenToUse:
        'For a standard X button to dismiss a screen or dialog, with built-in tooltip and semantics. Use BackButton for hierarchical back navigation.',
    commonPitfalls: [
      'By default it calls Navigator.maybePop; override onPressed for custom dismissal.',
      'It needs a navigable route to pop or the default action does nothing.',
    ],
    relatedWidgets: ['IconButton', 'AppBar'],
    docsUrl: 'https://api.flutter.dev/flutter/material/CloseButton-class.html',
    tags: ['button', 'close', 'dismiss'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => CloseButton(
      onPressed: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Close Button Pressed')));
      },
    ),
    codeSnippet: '''
CloseButton(
  onPressed: () {
    print('Close Button Pressed');
  },
)
''',
  ),
  WidgetInfo(
    name: 'BackButton',
    description: 'A Material Design back button.',
    category: WidgetCategory.material,
    whenToUse:
        'For the platform-appropriate back navigation icon with correct semantics. Use CloseButton to dismiss modal surfaces instead.',
    commonPitfalls: [
      'It defaults to Navigator.maybePop; if there is nothing to pop it silently does nothing.',
      'Adding it manually can duplicate the AppBar\'s automatic leading back button.',
    ],
    relatedWidgets: ['IconButton', 'AppBar'],
    docsUrl: 'https://api.flutter.dev/flutter/material/BackButton-class.html',
    tags: ['button', 'back', 'navigation'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => const BackButton(),
    codeSnippet: '''
BackButton(
  onPressed: () {
    Navigator.pop(context);
  },
)
''',
  ),
  WidgetInfo(
    name: 'SimpleDialog',
    description: 'A simple material design dialog.',
    category: WidgetCategory.material,
    whenToUse:
        'To present a short list of selectable options in a dialog. Use AlertDialog when you need a message plus confirm/cancel actions.',
    commonPitfalls: [
      'Show it with showDialog, not by inserting it into the tree.',
      'Options should be SimpleDialogOption widgets that pop with their result; returning nothing makes selection ambiguous.',
    ],
    relatedWidgets: ['AlertDialog', 'AboutDialog', 'BottomSheet'],
    docsUrl: 'https://api.flutter.dev/flutter/material/SimpleDialog-class.html',
    tags: ['dialog', 'options', 'modal'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: const Text('Select assignment'),
              children: <Widget>[
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Treasury department'),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('State department'),
                ),
              ],
            );
          },
        );
      },
      child: const Text('Show Simple Dialog'),
    ),
    codeSnippet: '''
showDialog(
  context: context,
  builder: (BuildContext context) {
    return SimpleDialog(
      title: const Text('Select assignment'),
      children: <Widget>[
        SimpleDialogOption(
          onPressed: () { Navigator.pop(context); },
          child: const Text('Treasury department'),
        ),
        SimpleDialogOption(
          onPressed: () { Navigator.pop(context); },
          child: const Text('State department'),
        ),
      ],
    );
  },
)
''',
  ),
  WidgetInfo(
    name: 'DropdownMenu',
    description: 'A button that when clicked shows a dropdown menu.',
    category: WidgetCategory.material,
    whenToUse:
        'The Material 3 menu that combines a text field with a filterable dropdown list. Use DropdownButton for the simpler Material 2 selector.',
    commonPitfalls: [
      'Entries are DropdownMenuEntry objects; passing plain widgets does not work.',
      'With requestFocusOnTap and filtering enabled, manage the controller text or selection state can drift.',
    ],
    relatedWidgets: ['DropdownButton', 'TextField', 'MenuAnchor'],
    docsUrl: 'https://api.flutter.dev/flutter/material/DropdownMenu-class.html',
    tags: ['dropdown', 'menu', 'select'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => const _DropdownMenuSample(),
    codeSnippet: '''
class _DropdownMenuSample extends StatefulWidget {
  const _DropdownMenuSample();

  @override
  State<_DropdownMenuSample> createState() => _DropdownMenuSampleState();
}

class _DropdownMenuSampleState extends State<_DropdownMenuSample> {
  String? selectedColor;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: selectedColor,
      onSelected: (String? value) {
        setState(() {
          selectedColor = value;
        });
      },
      dropdownMenuEntries: const [
        DropdownMenuEntry(value: 'Red', label: 'Red'),
        DropdownMenuEntry(value: 'Blue', label: 'Blue'),
        DropdownMenuEntry(value: 'Green', label: 'Green'),
      ],
    );
  }
}
''',
  ),
];

class _FilterChipSample extends StatefulWidget {
  const _FilterChipSample();

  @override
  State<_FilterChipSample> createState() => _FilterChipSampleState();
}

class _FilterChipSampleState extends State<_FilterChipSample> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: const Text('Filter Chip'),
      selected: _isSelected,
      onSelected: (bool selected) {
        setState(() {
          _isSelected = selected;
        });
      },
    );
  }
}

class _ChoiceChipSample extends StatefulWidget {
  const _ChoiceChipSample();

  @override
  State<_ChoiceChipSample> createState() => _ChoiceChipSampleState();
}

class _ChoiceChipSampleState extends State<_ChoiceChipSample> {
  int? _value = 1;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5.0,
      children: List<Widget>.generate(3, (int index) {
        return ChoiceChip(
          label: Text('Item $index'),
          selected: _value == index,
          onSelected: (bool selected) {
            setState(() {
              _value = selected ? index : null;
            });
          },
        );
      }).toList(),
    );
  }
}

class _MaterialBannerSample extends StatelessWidget {
  const _MaterialBannerSample();

  @override
  Widget build(BuildContext context) {
    return MaterialBanner(
      content: const Text('Error retrieving data'),
      leading: const Icon(Icons.error),
      backgroundColor: Colors.amberAccent,
      actions: <Widget>[
        TextButton(onPressed: () {}, child: const Text('RETRY')),
        TextButton(onPressed: () {}, child: const Text('DISMISS')),
      ],
    );
  }
}

class _BottomNavigationBarSample extends StatefulWidget {
  const _BottomNavigationBarSample();

  @override
  State<_BottomNavigationBarSample> createState() =>
      _BottomNavigationBarSampleState();
}

class _BottomNavigationBarSampleState
    extends State<_BottomNavigationBarSample> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
        BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }
}

class _NavigationBarSample extends StatefulWidget {
  const _NavigationBarSample();

  @override
  State<_NavigationBarSample> createState() => _NavigationBarSampleState();
}

class _NavigationBarSampleState extends State<_NavigationBarSample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;
        });
      },
      selectedIndex: currentPageIndex,
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        NavigationDestination(icon: Icon(Icons.business), label: 'Business'),
        NavigationDestination(
          selectedIcon: Icon(Icons.school),
          icon: Icon(Icons.school_outlined),
          label: 'School',
        ),
      ],
    );
  }
}

class _NavigationRailSample extends StatefulWidget {
  const _NavigationRailSample();

  @override
  State<_NavigationRailSample> createState() => _NavigationRailSampleState();
}

class _NavigationRailSampleState extends State<_NavigationRailSample> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        NavigationRail(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          labelType: NavigationRailLabelType.selected,
          destinations: const <NavigationRailDestination>[
            NavigationRailDestination(
              icon: Icon(Icons.favorite_border),
              selectedIcon: Icon(Icons.favorite),
              label: Text('First'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.bookmark_border),
              selectedIcon: Icon(Icons.bookmark),
              label: Text('Second'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.star_border),
              selectedIcon: Icon(Icons.star),
              label: Text('Third'),
            ),
          ],
        ),
        const VerticalDivider(thickness: 1, width: 1),
        Expanded(child: Center(child: Text('selectedIndex: $_selectedIndex'))),
      ],
    );
  }
}

class _StepperSample extends StatefulWidget {
  const _StepperSample();

  @override
  State<_StepperSample> createState() => _StepperSampleState();
}

class _StepperSampleState extends State<_StepperSample> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _index,
      onStepCancel: () {
        if (_index > 0) {
          setState(() {
            _index -= 1;
          });
        }
      },
      onStepContinue: () {
        if (_index < 2) {
          setState(() {
            _index += 1;
          });
        }
      },
      onStepTapped: (int index) {
        setState(() {
          _index = index;
        });
      },
      steps: <Step>[
        Step(
          title: const Text('Step 1'),
          content: Container(
            alignment: Alignment.centerLeft,
            child: const Text('Content for Step 1'),
          ),
          isActive: _index >= 0,
          state: _index > 0 ? StepState.complete : StepState.indexed,
        ),
        Step(
          title: const Text('Step 2'),
          content: Container(
            alignment: Alignment.centerLeft,
            child: const Text('Content for Step 2'),
          ),
          isActive: _index >= 1,
          state: _index > 1 ? StepState.complete : StepState.indexed,
        ),
        Step(
          title: const Text('Step 3'),
          content: Container(
            alignment: Alignment.centerLeft,
            child: const Text('Content for Step 3'),
          ),
          isActive: _index >= 2,
          state: _index > 2 ? StepState.complete : StepState.indexed,
        ),
      ],
    );
  }
}

class _TabBarSample extends StatelessWidget {
  const _TabBarSample();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          TabBar(
            labelColor: Colors.blue,
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
          SizedBox(
            height: 100,
            child: TabBarView(
              children: [
                Center(child: Icon(Icons.directions_car, size: 50)),
                Center(child: Icon(Icons.directions_transit, size: 50)),
                Center(child: Icon(Icons.directions_bike, size: 50)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NavigationDrawerSample extends StatefulWidget {
  const _NavigationDrawerSample();

  @override
  State<_NavigationDrawerSample> createState() =>
      _NavigationDrawerSampleState();
}

class _NavigationDrawerSampleState extends State<_NavigationDrawerSample> {
  int screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Navigation Drawer Demo')),
      drawer: NavigationDrawer(
        onDestinationSelected: (int index) {
          setState(() {
            screenIndex = index;
          });
          Navigator.pop(context); // Close drawer
        },
        selectedIndex: screenIndex,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              'Header',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          const NavigationDrawerDestination(
            label: Text('Messages'),
            icon: Icon(Icons.message_outlined),
            selectedIcon: Icon(Icons.message),
          ),
          const NavigationDrawerDestination(
            label: Text('Video'),
            icon: Icon(Icons.video_camera_back_outlined),
            selectedIcon: Icon(Icons.video_camera_back),
          ),
          const Divider(indent: 28, endIndent: 28),
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              'Labels',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          const NavigationDrawerDestination(
            label: Text('Label 1'),
            icon: Icon(Icons.label_outline),
            selectedIcon: Icon(Icons.label),
          ),
          const NavigationDrawerDestination(
            label: Text('Label 2'),
            icon: Icon(Icons.label_outline),
            selectedIcon: Icon(Icons.label),
          ),
        ],
      ),
      body: Center(child: Text('Selected destination: $screenIndex')),
    );
  }
}

class _ExpansionPanelListSample extends StatefulWidget {
  const _ExpansionPanelListSample();

  @override
  State<_ExpansionPanelListSample> createState() =>
      _ExpansionPanelListSampleState();
}

class _ExpansionPanelListSampleState extends State<_ExpansionPanelListSample> {
  final List<_Item> _data = _generateItems(3);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _data[index].isExpanded = !isExpanded;
          });
        },
        children: _data.map<ExpansionPanel>((_Item item) {
          return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(title: Text(item.headerValue));
            },
            body: ListTile(
              title: Text(item.expandedValue),
              subtitle: const Text('Tap the trash can icon to delete'),
              trailing: const Icon(Icons.delete),
              onTap: () {
                setState(() {
                  _data.removeWhere((_Item currentItem) => item == currentItem);
                });
              },
            ),
            isExpanded: item.isExpanded,
          );
        }).toList(),
      ),
    );
  }
}

class _Item {
  _Item({required this.expandedValue, required this.headerValue});

  String expandedValue;
  String headerValue;
  bool isExpanded = false;
}

List<_Item> _generateItems(int numberOfItems) {
  return List<_Item>.generate(numberOfItems, (int index) {
    return _Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

class _MenuAnchorSample extends StatefulWidget {
  const _MenuAnchorSample();

  @override
  State<_MenuAnchorSample> createState() => _MenuAnchorSampleState();
}

class _MenuAnchorSampleState extends State<_MenuAnchorSample> {
  String? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuAnchor(
          builder:
              (BuildContext context, MenuController controller, Widget? child) {
                return IconButton(
                  onPressed: () {
                    if (controller.isOpen) {
                      controller.close();
                    } else {
                      controller.open();
                    }
                  },
                  icon: const Icon(Icons.more_vert),
                );
              },
          menuChildren: <Widget>[
            MenuItemButton(
              onPressed: () => setState(() => selectedMenu = 'Menu 1'),
              child: const Text('Menu 1'),
            ),
            MenuItemButton(
              onPressed: () => setState(() => selectedMenu = 'Menu 2'),
              child: const Text('Menu 2'),
            ),
          ],
        ),
        if (selectedMenu != null) Text('Selected: $selectedMenu'),
      ],
    );
  }
}

class _DropdownMenuSample extends StatefulWidget {
  const _DropdownMenuSample();

  @override
  State<_DropdownMenuSample> createState() => _DropdownMenuSampleState();
}

class _DropdownMenuSampleState extends State<_DropdownMenuSample> {
  String? selectedColor;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: selectedColor,
      onSelected: (String? value) {
        setState(() {
          selectedColor = value;
        });
      },
      dropdownMenuEntries: const [
        DropdownMenuEntry(value: 'Red', label: 'Red'),
        DropdownMenuEntry(value: 'Blue', label: 'Green'),
        DropdownMenuEntry(value: 'Green', label: 'Blue'),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// NEW – 10 additional Material widgets
// ─────────────────────────────────────────────

// ignore: avoid_classes_with_only_static_members
// Helper list appended to materialWidgets at the bottom of the file –
// We use a separate list and merge it in main_data.dart if needed,
// but here we simply add extra WidgetInfo items to the same list at
// runtime by defining a supplemental list exported from this file.

final List<WidgetInfo> materialWidgetsExtra = [
  // 1 ─────────────────────────────────────────
  WidgetInfo(
    name: 'SubmenuButton',
    description:
        'A button that opens a cascading sub-menu. Used inside a MenuBar or MenuAnchor.',
    category: WidgetCategory.material,
    whenToUse:
        'To create a cascading sub-menu inside a MenuBar or MenuAnchor. Use MenuItemButton for terminal (non-nested) menu actions.',
    commonPitfalls: [
      'It only behaves correctly inside a MenuBar or MenuAnchor, not standalone.',
      'Its menuChildren should themselves be menu buttons for proper focus traversal.',
    ],
    relatedWidgets: ['MenuBar', 'MenuAnchor'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/SubmenuButton-class.html',
    tags: ['menu', 'submenu', 'cascade'],
    difficulty: WidgetDifficulty.advanced,
    builder: (context) => const _SubmenuButtonSample(),
    codeSnippet: '''
MenuBar(
  children: [
    SubmenuButton(
      menuChildren: [
        MenuItemButton(
          child: const Text('Sub Item 1'),
          onPressed: () {},
        ),
        MenuItemButton(
          child: const Text('Sub Item 2'),
          onPressed: () {},
        ),
      ],
      child: const Text('File'),
    ),
  ],
)
''',
  ),

  // 2 ─────────────────────────────────────────
  WidgetInfo(
    name: 'CheckboxMenuButton',
    description:
        'A menu button with an embedded checkbox. Used inside MenuAnchor or MenuBar menus.',
    category: WidgetCategory.material,
    whenToUse:
        'For a menu entry that toggles a boolean, shown with a checkbox, inside a MenuAnchor or MenuBar. Use MenuItemButton for plain actions.',
    commonPitfalls: [
      'You must track and pass value and update it in onChanged; it does not store its own state.',
      'It is intended for menus only; outside a menu its layout looks wrong.',
    ],
    relatedWidgets: ['MenuAnchor', 'MenuBar', 'Checkbox'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/CheckboxMenuButton-class.html',
    tags: ['menu', 'checkbox', 'toggle'],
    difficulty: WidgetDifficulty.advanced,
    builder: (context) => const _CheckboxMenuButtonSample(),
    codeSnippet: '''
MenuAnchor(
  menuChildren: [
    CheckboxMenuButton(
      value: _checked,
      onChanged: (v) => setState(() => _checked = v ?? false),
      child: const Text('Enable Feature'),
    ),
  ],
  builder: (context, controller, child) => ElevatedButton(
    onPressed: controller.open,
    child: const Text('Open Menu'),
  ),
)
''',
  ),

  // 3 ─────────────────────────────────────────
  WidgetInfo(
    name: 'RadioMenuButton',
    description:
        'A menu button with an embedded radio indicator. Used inside MenuAnchor or MenuBar menus.',
    category: WidgetCategory.material,
    whenToUse:
        'For mutually exclusive choices inside a menu, shown with a radio indicator. Use CheckboxMenuButton for independent toggles.',
    commonPitfalls: [
      'Each button shares a groupValue; mismatched value/groupValue types break selection.',
      'It belongs inside a MenuAnchor or MenuBar, not as a standalone control.',
    ],
    relatedWidgets: ['MenuAnchor', 'MenuBar'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/RadioMenuButton-class.html',
    tags: ['menu', 'radio', 'select'],
    difficulty: WidgetDifficulty.advanced,
    builder: (context) => const _RadioMenuButtonSample(),
    codeSnippet: '''
MenuAnchor(
  menuChildren: [
    RadioMenuButton<String>(
      value: 'A',
      groupValue: _selected,
      onChanged: (v) => setState(() => _selected = v),
      child: const Text('Option A'),
    ),
    RadioMenuButton<String>(
      value: 'B',
      groupValue: _selected,
      onChanged: (v) => setState(() => _selected = v),
      child: const Text('Option B'),
    ),
  ],
  builder: (context, controller, child) => ElevatedButton(
    onPressed: controller.open,
    child: const Text('Pick Option'),
  ),
)
''',
  ),

  // 4 ─────────────────────────────────────────
  WidgetInfo(
    name: 'InkResponse',
    description:
        'An area of a Material that responds to touch. More flexible than InkWell; supports custom splash shapes and radii.',
    category: WidgetCategory.material,
    whenToUse:
        'For touch feedback with custom splash shape and radius. Use InkWell for the common rectangular splash, or GestureDetector when you need no ink at all.',
    commonPitfalls: [
      'It requires a Material ancestor for the splash to render.',
      'Splashes can be clipped or invisible over opaque decorations; draw backgrounds with Ink so the splash shows.',
    ],
    relatedWidgets: ['InkWell', 'Material'],
    docsUrl: 'https://api.flutter.dev/flutter/material/InkResponse-class.html',
    tags: ['ink', 'touch', 'splash'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => Material(
      color: Colors.white,
      child: Center(
        child: InkResponse(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('InkResponse tapped!'),
                duration: Duration(milliseconds: 500),
              ),
            );
          },
          radius: 60,
          child: Ink(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.indigo.shade100,
              shape: BoxShape.circle,
            ),
            child: const Center(child: Text('Tap')),
          ),
        ),
      ),
    ),
    codeSnippet: '''
InkResponse(
  onTap: () {},
  radius: 60,
  child: Ink(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      color: Colors.indigo.shade100,
      shape: BoxShape.circle,
    ),
    child: const Center(child: Text('Tap')),
  ),
)
''',
  ),

  // 5 ─────────────────────────────────────────
  WidgetInfo(
    name: 'InputDecorator',
    description:
        'Draws the Material Design text-field chrome (border, label, hint, prefix/suffix) around any arbitrary child widget.',
    category: WidgetCategory.material,
    whenToUse:
        'To wrap a non-text-field child in the Material text-field chrome (label, border, hint). For actual text entry use TextField, which already includes it.',
    commonPitfalls: [
      'It does not provide editing; it only draws decoration around the child.',
      'It must be given an InputDecoration and a baseline-aware child or the label floats incorrectly.',
    ],
    relatedWidgets: ['TextField', 'InputDecorator', 'Form'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/InputDecorator-class.html',
    tags: ['input', 'decoration', 'form'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => const Padding(
      padding: EdgeInsets.all(16.0),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Amount',
          prefixText: '\$',
          suffixText: 'USD',
          border: OutlineInputBorder(),
        ),
        child: Text('100.00', style: TextStyle(fontSize: 16)),
      ),
    ),
    codeSnippet: '''
InputDecorator(
  decoration: InputDecoration(
    labelText: 'Amount',
    prefixText: '\$',
    suffixText: 'USD',
    border: OutlineInputBorder(),
  ),
  child: Text('100.00', style: TextStyle(fontSize: 16)),
)
''',
  ),

  // 7 ─────────────────────────────────────────
  WidgetInfo(
    name: 'FloatingActionButton.extended',
    description:
        'A wider FAB that includes both an icon and a visible text label. Ideal for primary actions that need clear labelling.',
    category: WidgetCategory.material,
    whenToUse:
        'When the primary action benefits from a visible text label alongside the icon. Use the standard FloatingActionButton when an icon alone is clear.',
    commonPitfalls: [
      'Like all FABs, multiple on screen need unique heroTag values.',
      'The label should stay short; long labels make the FAB dominate the layout.',
    ],
    relatedWidgets: ['FloatingActionButton', 'ElevatedButton', 'Scaffold'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/FloatingActionButton-class.html',
    tags: ['button', 'fab', 'label'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton.extended(
          heroTag: 'fab-extended-1',
          onPressed: () {},
          label: const Text('Add Task'),
          icon: const Icon(Icons.add),
        ),
        const SizedBox(height: 16),
        FloatingActionButton.extended(
          heroTag: 'fab-extended-2',
          onPressed: () {},
          label: const Text('Navigate'),
          icon: const Icon(Icons.navigation),
          backgroundColor: Colors.green,
        ),
      ],
    ),
    codeSnippet: '''
FloatingActionButton.extended(
  onPressed: () {},
  label: const Text('Add Task'),
  icon: const Icon(Icons.add),
)
''',
  ),

  // 8 ─────────────────────────────────────────
  WidgetInfo(
    name: 'DividerTheme',
    description:
        'An inherited widget that configures how Divider and VerticalDivider look in its widget subtree.',
    category: WidgetCategory.material,
    whenToUse:
        'To set the color, thickness and spacing of all Divider and VerticalDivider widgets in a subtree, instead of styling each one.',
    commonPitfalls: [
      'It only affects descendants; dividers outside the subtree keep theme defaults.',
      'Per-widget properties override the theme, so local values can mask your theme settings.',
    ],
    relatedWidgets: ['Divider', 'Theme'],
    docsUrl: 'https://api.flutter.dev/flutter/material/DividerTheme-class.html',
    tags: ['theme', 'divider', 'styling'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => DividerTheme(
      data: const DividerThemeData(
        color: Colors.indigo,
        thickness: 3,
        indent: 16,
        endIndent: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          ListTile(title: Text('Item A')),
          Divider(),
          ListTile(title: Text('Item B')),
          Divider(),
          ListTile(title: Text('Item C')),
        ],
      ),
    ),
    codeSnippet: '''
DividerTheme(
  data: const DividerThemeData(
    color: Colors.indigo,
    thickness: 3,
    indent: 16,
    endIndent: 16,
  ),
  child: Column(
    children: const [
      ListTile(title: Text('Item A')),
      Divider(),
      ListTile(title: Text('Item B')),
    ],
  ),
)
''',
  ),

  // 9 ─────────────────────────────────────────
  WidgetInfo(
    name: 'SelectionContainer',
    description:
        'Enables and controls text-selection behaviour over an entire subtree of widgets. Use SelectionContainer.disabled to opt out.',
    category: WidgetCategory.material,
    whenToUse:
        'To enable coordinated text selection across an arbitrary subtree, or SelectionContainer.disabled to opt a region out. Prefer SelectableText for a single block.',
    commonPitfalls: [
      'Without a registered SelectionRegistrar/controller, selection will not function.',
      'Nesting selection containers can produce surprising selection boundaries.',
    ],
    relatedWidgets: ['Text'],
    tags: ['selection', 'text', 'copy'],
    difficulty: WidgetDifficulty.advanced,
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Selectable area below:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SelectionArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('This text is selectable.'),
              SizedBox(height: 4),
              Text('Long-press or click-drag to select.'),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SelectionContainer.disabled(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Selection disabled here.',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    ),
    codeSnippet: '''
SelectionArea(
  child: Column(
    children: const [
      Text('This text is selectable.'),
      Text('Long-press or click-drag to select.'),
    ],
  ),
)

// Disable selection for a subtree:
SelectionContainer.disabled(
  child: Text('Selection disabled.'),
)
''',
  ),

  // 10 ────────────────────────────────────────
  WidgetInfo(
    name: 'ButtonBar',
    description:
        'Arranges buttons in a horizontal bar. Deprecated in favour of OverflowBar, but still widely used in older codebases and dialogs.',
    category: WidgetCategory.material,
    whenToUse:
        'To lay out a horizontal row of buttons, historically in dialog footers. It is deprecated; prefer OverflowBar or a Row/Wrap in new code.',
    commonPitfalls: [
      'It is deprecated, so avoid it in new code and migrate to OverflowBar.',
      'It does not wrap on narrow widths, so buttons can overflow horizontally.',
    ],
    relatedWidgets: ['Row', 'TextButton', 'ElevatedButton'],
    tags: ['buttons', 'bar', 'layout'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ListTile(
              title: Text('Delete item?'),
              subtitle: Text('This action cannot be undone.'),
            ),
            // ignore: deprecated_member_use
            ButtonBar(
              children: [
                TextButton(onPressed: () {}, child: const Text('Cancel')),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {},
                  child: const Text(
                    'Delete',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    codeSnippet: '''
// Note: ButtonBar is deprecated – prefer OverflowBar.
ButtonBar(
  children: [
    TextButton(onPressed: () {}, child: const Text('Cancel')),
    ElevatedButton(onPressed: () {}, child: const Text('Delete')),
  ],
)
''',
  ),
];

// ─── Stateful helpers for the extra material widgets ──────────────────────────

class _SubmenuButtonSample extends StatefulWidget {
  const _SubmenuButtonSample();
  @override
  State<_SubmenuButtonSample> createState() => _SubmenuButtonSampleState();
}

class _SubmenuButtonSampleState extends State<_SubmenuButtonSample> {
  String? _selected;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (_selected != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text('Selected: $_selected'),
          ),
        MenuBar(
          children: [
            SubmenuButton(
              menuChildren: [
                MenuItemButton(
                  onPressed: () => setState(() => _selected = 'New'),
                  leadingIcon: const Icon(Icons.note_add),
                  child: const Text('New'),
                ),
                MenuItemButton(
                  onPressed: () => setState(() => _selected = 'Open'),
                  leadingIcon: const Icon(Icons.folder_open),
                  child: const Text('Open'),
                ),
                const Divider(),
                MenuItemButton(
                  onPressed: () => setState(() => _selected = 'Save'),
                  leadingIcon: const Icon(Icons.save),
                  child: const Text('Save'),
                ),
              ],
              child: const Text('File'),
            ),
            SubmenuButton(
              menuChildren: [
                MenuItemButton(
                  onPressed: () => setState(() => _selected = 'Copy'),
                  leadingIcon: const Icon(Icons.copy),
                  child: const Text('Copy'),
                ),
                MenuItemButton(
                  onPressed: () => setState(() => _selected = 'Paste'),
                  leadingIcon: const Icon(Icons.paste),
                  child: const Text('Paste'),
                ),
              ],
              child: const Text('Edit'),
            ),
          ],
        ),
      ],
    );
  }
}

class _CheckboxMenuButtonSample extends StatefulWidget {
  const _CheckboxMenuButtonSample();
  @override
  State<_CheckboxMenuButtonSample> createState() =>
      _CheckboxMenuButtonSampleState();
}

class _CheckboxMenuButtonSampleState extends State<_CheckboxMenuButtonSample> {
  bool _darkMode = false;
  bool _notifications = true;
  bool _autoSave = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Dark: $_darkMode | Notifs: $_notifications | AutoSave: $_autoSave',
          style: const TextStyle(fontSize: 12),
        ),
        const SizedBox(height: 8),
        MenuAnchor(
          menuChildren: [
            CheckboxMenuButton(
              value: _darkMode,
              onChanged: (v) => setState(() => _darkMode = v ?? false),
              child: const Text('Dark Mode'),
            ),
            CheckboxMenuButton(
              value: _notifications,
              onChanged: (v) => setState(() => _notifications = v ?? false),
              child: const Text('Notifications'),
            ),
            CheckboxMenuButton(
              value: _autoSave,
              onChanged: (v) => setState(() => _autoSave = v ?? false),
              child: const Text('Auto-Save'),
            ),
          ],
          builder: (context, controller, child) => FilledButton.tonal(
            onPressed: () =>
                controller.isOpen ? controller.close() : controller.open(),
            child: const Text('Settings ▾'),
          ),
        ),
      ],
    );
  }
}

class _RadioMenuButtonSample extends StatefulWidget {
  const _RadioMenuButtonSample();
  @override
  State<_RadioMenuButtonSample> createState() => _RadioMenuButtonSampleState();
}

class _RadioMenuButtonSampleState extends State<_RadioMenuButtonSample> {
  String _theme = 'System';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Theme: $_theme'),
        const SizedBox(height: 8),
        MenuAnchor(
          menuChildren: [
            for (final opt in ['System', 'Light', 'Dark'])
              RadioMenuButton<String>(
                value: opt,
                groupValue: _theme,
                onChanged: (v) => setState(() => _theme = v ?? _theme),
                child: Text(opt),
              ),
          ],
          builder: (context, controller, child) => OutlinedButton(
            onPressed: () =>
                controller.isOpen ? controller.close() : controller.open(),
            child: const Text('Select Theme ▾'),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// BATCH 3 – Next 10 additional Material widgets
// ─────────────────────────────────────────────────────────────────────────────

final List<WidgetInfo> materialWidgetsExtra2 = [
  // 1 ─────────────────────────────────────────
  WidgetInfo(
    name: 'Material',
    description:
        'The base material-design surface widget. Provides ink effects, elevation shadows, and clipping for everything built on top of it.',
    category: WidgetCategory.material,
    whenToUse:
        'As the surface that provides ink splashes, elevation and clipping for Material widgets. Most Material widgets need a Material ancestor; Scaffold and Card already supply one.',
    commonPitfalls: [
      'Ink effects from children fail to render without a Material ancestor (the classic black-text-on-no-background bug).',
      'Stacking many elevated Material layers can produce unexpected shadow overlap.',
    ],
    relatedWidgets: ['Card', 'InkWell', 'Scaffold'],
    docsUrl: 'https://api.flutter.dev/flutter/material/Material-class.html',
    tags: ['surface', 'ink', 'elevation'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final elevation in [0.0, 2.0, 8.0, 16.0])
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Material(
              color: Colors.white,
              elevation: elevation,
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 220,
                height: 40,
                child: Center(child: Text('elevation: $elevation')),
              ),
            ),
          ),
      ],
    ),
    codeSnippet: '''
Material(
  color: Colors.white,
  elevation: 8.0,
  borderRadius: BorderRadius.circular(8),
  child: SizedBox(
    width: 200,
    height: 50,
    child: const Center(child: Text('Elevated Surface')),
  ),
)
''',
  ),

  // 2 ─────────────────────────────────────────
  WidgetInfo(
    name: 'Ink',
    description:
        'A convenience widget for drawing images and other decorations on a Material so that InkWell splashes print correctly over them.',
    category: WidgetCategory.material,
    whenToUse:
        'To paint a background image or decoration on a Material so that overlaying InkWell splashes remain visible. Use a plain Container when you do not need ink to show through.',
    commonPitfalls: [
      'It must sit on a Material ancestor or the splash still will not show.',
      'Decorating with a Container instead clips the splash; that is exactly what Ink avoids.',
    ],
    relatedWidgets: ['InkWell', 'Material', 'Container'],
    docsUrl: 'https://api.flutter.dev/flutter/material/Ink-class.html',
    tags: ['ink', 'decoration', 'splash'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => Material(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(12),
            child: Ink(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade100,
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Ink(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Colors.blue, Colors.purple]),
              ),
              child: const Center(
                child: Text('Tap me', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    ),
    codeSnippet: '''
// Ink ensures the InkWell ripple paints OVER the image/colour
InkWell(
  onTap: () {},
  child: Ink(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      color: Colors.deepPurple.shade100,
      borderRadius: BorderRadius.circular(12),
    ),
  ),
)
''',
  ),

  // 3 ─────────────────────────────────────────
  WidgetInfo(
    name: 'ElevatedButton.icon',
    description:
        'An ElevatedButton variant that places an icon to the left of the label. Useful for actions that benefit from a visual cue.',
    category: WidgetCategory.material,
    whenToUse:
        'For a high-emphasis action that pairs an icon with a label. Use plain ElevatedButton when no icon is needed.',
    commonPitfalls: [
      'A null onPressed disables it; pass an empty handler only if you truly want it enabled.',
      'Overusing elevated buttons on one screen dilutes emphasis; reserve them for primary actions.',
    ],
    relatedWidgets: ['ElevatedButton', 'FilledButton', 'OutlinedButton'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/ElevatedButton-class.html',
    tags: ['button', 'icon', 'elevated'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.send),
          label: const Text('Send'),
        ),
        const SizedBox(height: 12),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.download),
          label: const Text('Download'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
        ),
        const SizedBox(height: 12),
        ElevatedButton.icon(
          onPressed: null,
          icon: const Icon(Icons.lock),
          label: const Text('Disabled'),
        ),
      ],
    ),
    codeSnippet: '''
ElevatedButton.icon(
  onPressed: () {},
  icon: const Icon(Icons.send),
  label: const Text('Send'),
)
''',
  ),

  // 4 ─────────────────────────────────────────
  WidgetInfo(
    name: 'TextButton.icon',
    description:
        'A TextButton variant that pairs an icon with a text label. Good for in-line or lower-emphasis actions.',
    category: WidgetCategory.material,
    whenToUse:
        'For a low-emphasis action that benefits from an icon next to its label. Use the plain TextButton when text alone is clear.',
    commonPitfalls: [
      'Its low contrast can read as non-interactive; keep it for secondary actions.',
      'Style through styleFrom rather than wrapping in extra padding.',
    ],
    relatedWidgets: ['TextButton', 'OutlinedButton', 'ElevatedButton'],
    docsUrl: 'https://api.flutter.dev/flutter/material/TextButton-class.html',
    tags: ['button', 'icon', 'text'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.share),
          label: const Text('Share'),
        ),
        const SizedBox(height: 8),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border),
          label: const Text('Like'),
          style: TextButton.styleFrom(foregroundColor: Colors.red),
        ),
        const SizedBox(height: 8),
        TextButton.icon(
          onPressed: null,
          icon: const Icon(Icons.block),
          label: const Text('Disabled'),
        ),
      ],
    ),
    codeSnippet: '''
TextButton.icon(
  onPressed: () {},
  icon: const Icon(Icons.share),
  label: const Text('Share'),
)
''',
  ),

  // 5 ─────────────────────────────────────────
  WidgetInfo(
    name: 'OutlinedButton.icon',
    description:
        'An OutlinedButton variant that combines an icon and a label. Used for medium-emphasis actions that still need visual distinction.',
    category: WidgetCategory.material,
    whenToUse:
        'For a medium-emphasis action that combines an icon and a label. Use the plain OutlinedButton when no icon is required.',
    commonPitfalls: [
      'The border follows the theme; override side in styleFrom for custom outlines.',
      'A null onPressed disables the button rather than just dropping the handler.',
    ],
    relatedWidgets: ['OutlinedButton', 'TextButton', 'ElevatedButton'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/OutlinedButton-class.html',
    tags: ['button', 'icon', 'outlined'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add_photo_alternate),
          label: const Text('Add Photo'),
        ),
        const SizedBox(height: 8),
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.edit_calendar),
          label: const Text('Schedule'),
          style: OutlinedButton.styleFrom(foregroundColor: Colors.indigo),
        ),
        const SizedBox(height: 8),
        OutlinedButton.icon(
          onPressed: null,
          icon: const Icon(Icons.warning_amber),
          label: const Text('Disabled'),
        ),
      ],
    ),
    codeSnippet: '''
OutlinedButton.icon(
  onPressed: () {},
  icon: const Icon(Icons.add_photo_alternate),
  label: const Text('Add Photo'),
)
''',
  ),

  // 6 ─────────────────────────────────────────
  WidgetInfo(
    name: 'CalendarDatePicker',
    description:
        'A Material Design calendar-style date picker that can be embedded directly inside a layout (unlike showDatePicker which uses a dialog).',
    category: WidgetCategory.material,
    whenToUse:
        'To embed an inline month/day calendar directly in your layout. Use showDatePicker for the standard modal dialog flow.',
    commonPitfalls: [
      'initialDate must fall within firstDate and lastDate or it asserts.',
      'It only reports changes via onDateChanged; you must store the selected date yourself.',
    ],
    relatedWidgets: ['DatePicker', 'DateRangePickerDialog'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/CalendarDatePicker-class.html',
    tags: ['date', 'calendar', 'picker'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => const _CalendarDatePickerSample(),
    codeSnippet: '''
CalendarDatePicker(
  initialDate: DateTime.now(),
  firstDate: DateTime(2020),
  lastDate: DateTime(2030),
  onDateChanged: (DateTime date) {
    print('Selected: \$date');
  },
)
''',
  ),

  // 7 ─────────────────────────────────────────
  WidgetInfo(
    name: 'YearPicker',
    description:
        'A scrollable list of years that lets the user pick a year. Typically used as part of a custom date picker UI.',
    category: WidgetCategory.material,
    whenToUse:
        'As a building block to let users scroll and pick a year, usually within a custom date-picker UI. For a full picker prefer CalendarDatePicker or showDatePicker.',
    commonPitfalls: [
      'It needs bounded height since it is a scrollable list; an unbounded parent overflows.',
      'selectedDate, firstDate and lastDate must be consistent or selection misbehaves.',
    ],
    relatedWidgets: ['DatePicker', 'DateRangePickerDialog'],
    docsUrl: 'https://api.flutter.dev/flutter/material/YearPicker-class.html',
    tags: ['date', 'year', 'picker'],
    difficulty: WidgetDifficulty.advanced,
    builder: (context) => const _YearPickerSample(),
    codeSnippet: '''
SizedBox(
  height: 200,
  child: YearPicker(
    selectedDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2035),
    onChanged: (DateTime date) {
      print('Year: \${date.year}');
    },
  ),
)
''',
  ),

  // 8 ─────────────────────────────────────────
  WidgetInfo(
    name: 'ChipTheme',
    description:
        'An inherited widget that applies a ChipThemeData to all Chip widgets in its subtree, letting you customise colour, shape, padding and more.',
    category: WidgetCategory.material,
    whenToUse:
        'To style every Chip-family widget in a subtree at once (colors, shape, padding). Style a single chip directly when only one needs to differ.',
    commonPitfalls: [
      'It requires a complete ChipThemeData; build from ChipThemeData.fromDefaults or the ambient theme to avoid missing fields.',
      'Per-chip properties override the theme.',
    ],
    relatedWidgets: ['Chip', 'FilterChip', 'Theme'],
    docsUrl: 'https://api.flutter.dev/flutter/material/ChipTheme-class.html',
    tags: ['theme', 'chip', 'styling'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => ChipTheme(
      data: ChipThemeData(
        backgroundColor: Colors.deepPurple.shade50,
        selectedColor: Colors.deepPurple,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        shape: const StadiumBorder(),
      ),
      child: Wrap(
        spacing: 8,
        children: const [
          Chip(label: Text('Themed Chip 1')),
          Chip(label: Text('Themed Chip 2')),
          Chip(avatar: Icon(Icons.star), label: Text('With Avatar')),
        ],
      ),
    ),
    codeSnippet: '''
ChipTheme(
  data: ChipThemeData(
    backgroundColor: Colors.deepPurple.shade50,
    selectedColor: Colors.deepPurple,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    shape: const StadiumBorder(),
  ),
  child: Wrap(
    spacing: 8,
    children: const [
      Chip(label: Text('Themed Chip 1')),
      Chip(label: Text('Themed Chip 2')),
    ],
  ),
)
''',
  ),

  // 9 ─────────────────────────────────────────
  WidgetInfo(
    name: 'SwitchTheme',
    description:
        'An inherited widget that applies SwitchThemeData to all Switch widgets in its subtree, letting you customise thumb and track colours.',
    category: WidgetCategory.material,
    whenToUse:
        'To set thumb and track colors and shape for all Switch widgets in a subtree. Set properties on a single Switch when only one should differ.',
    commonPitfalls: [
      'Color properties are often WidgetStateProperty; passing a plain Color ignores selected/disabled states.',
      'It only affects descendants of the SwitchTheme.',
    ],
    relatedWidgets: ['Switch', 'SwitchListTile', 'Theme'],
    docsUrl: 'https://api.flutter.dev/flutter/material/SwitchTheme-class.html',
    tags: ['theme', 'switch', 'styling'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => const _SwitchThemeSample(),
    codeSnippet: '''
SwitchTheme(
  data: SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith<Color?>((states) {
      if (states.contains(WidgetState.selected)) return Colors.white;
      return null;
    }),
    trackColor: WidgetStateProperty.resolveWith<Color?>((states) {
      if (states.contains(WidgetState.selected)) return Colors.green;
      return null;
    }),
  ),
  child: Column(
    children: [
      Switch(value: true, onChanged: (_) {}),
      Switch(value: false, onChanged: (_) {}),
    ],
  ),
)
''',
  ),

  // 10 ────────────────────────────────────────
  WidgetInfo(
    name: 'CheckboxTheme',
    description:
        'An inherited widget that applies CheckboxThemeData to all Checkbox widgets in its subtree, letting you customise fill and check colours.',
    category: WidgetCategory.material,
    whenToUse:
        'To apply consistent fill, check and overlay colors to all Checkbox widgets in a subtree. Style a single checkbox inline for one-off cases.',
    commonPitfalls: [
      'fillColor and friends are WidgetStateProperty; a plain Color will not vary by state.',
      'It influences only descendant checkboxes, not the whole app unless placed high enough.',
    ],
    relatedWidgets: ['Checkbox', 'CheckboxListTile', 'Theme'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/CheckboxTheme-class.html',
    tags: ['theme', 'checkbox', 'styling'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => const _CheckboxThemeSample(),
    codeSnippet: '''
CheckboxTheme(
  data: CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
      if (states.contains(WidgetState.selected)) return Colors.teal;
      return null;
    }),
    checkColor: WidgetStateProperty.all(Colors.white),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  ),
  child: Column(
    children: [
      Checkbox(value: true, onChanged: (_) {}),
      Checkbox(value: false, onChanged: (_) {}),
    ],
  ),
)
''',
  ),
];

// ─── Stateful helpers for batch 3 ────────────────────────────────────────────

class _CalendarDatePickerSample extends StatefulWidget {
  const _CalendarDatePickerSample();
  @override
  State<_CalendarDatePickerSample> createState() =>
      _CalendarDatePickerSampleState();
}

class _CalendarDatePickerSampleState extends State<_CalendarDatePickerSample> {
  DateTime _selected = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Selected: ${_selected.toLocal().toString().split(' ')[0]}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        CalendarDatePicker(
          initialDate: _selected,
          firstDate: DateTime(2020),
          lastDate: DateTime(2035),
          onDateChanged: (DateTime date) {
            setState(() => _selected = date);
          },
        ),
      ],
    );
  }
}

class _YearPickerSample extends StatefulWidget {
  const _YearPickerSample();
  @override
  State<_YearPickerSample> createState() => _YearPickerSampleState();
}

class _YearPickerSampleState extends State<_YearPickerSample> {
  DateTime _selected = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Selected Year: ${_selected.year}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 200,
          child: YearPicker(
            selectedDate: _selected,
            firstDate: DateTime(2000),
            lastDate: DateTime(2035),
            onChanged: (DateTime date) {
              setState(() => _selected = date);
            },
          ),
        ),
      ],
    );
  }
}

class _SwitchThemeSample extends StatefulWidget {
  const _SwitchThemeSample();
  @override
  State<_SwitchThemeSample> createState() => _SwitchThemeSampleState();
}

class _SwitchThemeSampleState extends State<_SwitchThemeSample> {
  bool _v1 = true;
  bool _v2 = false;

  @override
  Widget build(BuildContext context) {
    return SwitchTheme(
      data: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.selected)) return Colors.white;
          return null;
        }),
        trackColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.selected)) return Colors.green;
          return Colors.grey.shade300;
        }),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Custom green switch theme:'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Switch(value: _v1, onChanged: (v) => setState(() => _v1 = v)),
              Switch(value: _v2, onChanged: (v) => setState(() => _v2 = v)),
            ],
          ),
          Text('v1: $_v1  |  v2: $_v2'),
        ],
      ),
    );
  }
}

class _CheckboxThemeSample extends StatefulWidget {
  const _CheckboxThemeSample();
  @override
  State<_CheckboxThemeSample> createState() => _CheckboxThemeSampleState();
}

class _CheckboxThemeSampleState extends State<_CheckboxThemeSample> {
  bool _c1 = true;
  bool _c2 = false;
  bool _c3 = true;

  @override
  Widget build(BuildContext context) {
    return CheckboxTheme(
      data: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.selected)) return Colors.teal;
          return null;
        }),
        checkColor: WidgetStateProperty.all(Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Custom teal checkbox theme:'),
          CheckboxListTile(
            value: _c1,
            onChanged: (v) => setState(() => _c1 = v!),
            title: const Text('Option 1'),
          ),
          CheckboxListTile(
            value: _c2,
            onChanged: (v) => setState(() => _c2 = v!),
            title: const Text('Option 2'),
          ),
          CheckboxListTile(
            value: _c3,
            onChanged: (v) => setState(() => _c3 = v!),
            title: const Text('Option 3'),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// BATCH 4 – Next 10 additional Material widgets
// ─────────────────────────────────────────────────────────────────────────────

final List<WidgetInfo> materialWidgetsExtra3 = [
  // 1 ─────────────────────────────────────────
  WidgetInfo(
    name: 'RadioTheme',
    description:
        'An inherited widget that applies RadioThemeData to all Radio widgets in its subtree, customising fill colour and overlay.',
    category: WidgetCategory.material,
    whenToUse:
        'To set fill color and overlay for all Radio widgets in a subtree. Style individual radios inline when only one differs.',
    commonPitfalls: [
      'fillColor is a WidgetStateProperty; a single Color will not reflect selected/disabled states.',
      'Only descendants of the RadioTheme are affected.',
    ],
    relatedWidgets: ['RadioListTile', 'Theme'],
    docsUrl: 'https://api.flutter.dev/flutter/material/RadioTheme-class.html',
    tags: ['theme', 'radio', 'styling'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => const _RadioThemeSample(),
    codeSnippet: '''
RadioTheme(
  data: RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
      if (states.contains(WidgetState.selected)) return Colors.orange;
      return null;
    }),
  ),
  child: Column(
    children: [
      Radio<int>(value: 1, groupValue: _val, onChanged: (_) {}),
      Radio<int>(value: 2, groupValue: _val, onChanged: (_) {}),
    ],
  ),
)
''',
  ),

  // 2 ─────────────────────────────────────────
  WidgetInfo(
    name: 'SliderTheme',
    description:
        'An inherited widget that styles all Slider widgets in its subtree — track height, thumb shape, active/inactive colours and more.',
    category: WidgetCategory.material,
    whenToUse:
        'To customize track height, thumb shape and active/inactive colors of all Slider widgets in a subtree. Use it instead of styling many sliders one by one.',
    commonPitfalls: [
      'Custom thumb/track shapes are full classes (e.g. RoundSliderThumbShape); a wrong shape can clip or overflow.',
      'It only affects descendant sliders.',
    ],
    relatedWidgets: ['Slider', 'Theme'],
    docsUrl: 'https://api.flutter.dev/flutter/material/SliderTheme-class.html',
    tags: ['theme', 'slider', 'styling'],
    difficulty: WidgetDifficulty.advanced,
    builder: (context) => const _SliderThemeSample(),
    codeSnippet: '''
SliderTheme(
  data: SliderTheme.of(context).copyWith(
    activeTrackColor: Colors.deepPurple,
    inactiveTrackColor: Colors.deepPurple.shade100,
    thumbColor: Colors.deepPurple,
    overlayColor: Colors.deepPurple.withOpacity(0.2),
    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 14),
    trackHeight: 6,
  ),
  child: Slider(value: _val, onChanged: (v) => setState(() => _val = v)),
)
''',
  ),

  // 3 ─────────────────────────────────────────
  WidgetInfo(
    name: 'ListTileTheme',
    description:
        'An inherited widget that applies ListTileThemeData across all ListTile widgets in its subtree — useful for bulk styling.',
    category: WidgetCategory.material,
    whenToUse:
        'To apply consistent colors, density and content padding to all ListTile widgets in a subtree. Use it for lists and drawers instead of repeating styles.',
    commonPitfalls: [
      'Per-tile properties override the theme, so a stray inline color masks the theme.',
      'It only affects descendant tiles, so place it above the relevant list.',
    ],
    relatedWidgets: ['ListTile', 'Theme'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/ListTileTheme-class.html',
    tags: ['theme', 'listtile', 'styling'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => ListTileTheme(
      data: const ListTileThemeData(
        tileColor: Color(0xFFF0F4FF),
        selectedTileColor: Color(0xFFBBD0FF),
        iconColor: Colors.indigo,
        textColor: Colors.indigo,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          ListTile(leading: Icon(Icons.home), title: Text('Home')),
          SizedBox(height: 4),
          ListTile(leading: Icon(Icons.settings), title: Text('Settings')),
          SizedBox(height: 4),
          ListTile(leading: Icon(Icons.person), title: Text('Profile')),
        ],
      ),
    ),
    codeSnippet: '''
ListTileTheme(
  data: const ListTileThemeData(
    tileColor: Color(0xFFF0F4FF),
    iconColor: Colors.indigo,
    textColor: Colors.indigo,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  ),
  child: Column(
    children: const [
      ListTile(leading: Icon(Icons.home), title: Text('Home')),
      ListTile(leading: Icon(Icons.settings), title: Text('Settings')),
    ],
  ),
)
''',
  ),

  // 4 ─────────────────────────────────────────
  WidgetInfo(
    name: 'ExpansionTileTheme',
    description:
        'An inherited widget that applies ExpansionTileThemeData to all ExpansionTile widgets — controls header colour, icon colour, and background.',
    category: WidgetCategory.material,
    whenToUse:
        'To set header, icon and background colors for all ExpansionTile widgets in a subtree. Use it instead of styling each tile individually.',
    commonPitfalls: [
      'It only affects descendant ExpansionTiles.',
      'Inline tile properties override the theme values.',
    ],
    relatedWidgets: ['ExpansionTile', 'Theme'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/ExpansionTileTheme-class.html',
    tags: ['theme', 'expansion', 'styling'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => ExpansionTileTheme(
      data: const ExpansionTileThemeData(
        backgroundColor: Color(0xFFE8F5E9),
        collapsedBackgroundColor: Color(0xFFF1F8E9),
        iconColor: Colors.green,
        collapsedIconColor: Colors.green,
        textColor: Colors.green,
        collapsedTextColor: Colors.black87,
        tilePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          ExpansionTile(
            title: Text('Section A'),
            children: [
              ListTile(title: Text('Item A1')),
              ListTile(title: Text('Item A2')),
            ],
          ),
          ExpansionTile(
            title: Text('Section B'),
            children: [ListTile(title: Text('Item B1'))],
          ),
        ],
      ),
    ),
    codeSnippet: '''
ExpansionTileTheme(
  data: const ExpansionTileThemeData(
    backgroundColor: Color(0xFFE8F5E9),
    iconColor: Colors.green,
    textColor: Colors.green,
  ),
  child: ExpansionTile(
    title: Text('Section A'),
    children: [ListTile(title: Text('Item A1'))],
  ),
)
''',
  ),

  // 5 ─────────────────────────────────────────
  WidgetInfo(
    name: 'Card.outlined',
    description:
        'A Material 3 card variant with a visible outline border and no elevation. Useful for secondary content areas.',
    category: WidgetCategory.material,
    whenToUse:
        'For a card with a visible border and no shadow, useful for secondary or grouped content. Use the default Card for elevation or Card.filled for a tonal fill.',
    commonPitfalls: [
      'It sizes to its child; an unconstrained child can collapse it.',
      'clipBehavior defaults to Clip.none, so child content can overflow the rounded border.',
    ],
    relatedWidgets: ['Card', 'Card.filled', 'Container', 'Material'],
    docsUrl: 'https://api.flutter.dev/flutter/material/Card-class.html',
    tags: ['card', 'outlined', 'surface'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card.outlined(
          child: const Padding(
            padding: EdgeInsets.all(16),
            child: ListTile(
              leading: Icon(Icons.article_outlined),
              title: Text('Outlined Card'),
              subtitle: Text('No elevation, visible border'),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Card.outlined(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: const [
                Icon(Icons.info_outline, color: Colors.blue),
                SizedBox(width: 12),
                Expanded(child: Text('Another Card.outlined example')),
              ],
            ),
          ),
        ),
      ],
    ),
    codeSnippet: '''
Card.outlined(
  child: const Padding(
    padding: EdgeInsets.all(16),
    child: ListTile(
      leading: Icon(Icons.article_outlined),
      title: Text('Outlined Card'),
      subtitle: Text('No elevation, visible border'),
    ),
  ),
)
''',
  ),

  // 6 ─────────────────────────────────────────
  WidgetInfo(
    name: 'Card.filled',
    description:
        'A Material 3 card variant with a solid surface colour fill and no elevation or border. Used for non-interactive containers.',
    category: WidgetCategory.material,
    whenToUse:
        'For a non-elevated card with a tonal surface fill, good for passive grouped content. Use the default Card for elevation or Card.outlined for a border.',
    commonPitfalls: [
      'Like all cards it sizes to its child; constrain the child to avoid collapse.',
      'Its fill comes from the theme\'s surface colors, so it may look subtle on some color schemes.',
    ],
    relatedWidgets: ['Card', 'Card.outlined', 'Container', 'Material'],
    docsUrl: 'https://api.flutter.dev/flutter/material/Card-class.html',
    tags: ['card', 'filled', 'surface'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card.filled(
          child: const Padding(
            padding: EdgeInsets.all(16),
            child: ListTile(
              leading: Icon(Icons.widgets),
              title: Text('Filled Card'),
              subtitle: Text('Solid fill, no border/elevation'),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Card.filled(
          color: Colors.amber.shade50,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: const [
                Icon(Icons.palette, color: Colors.amber),
                SizedBox(width: 12),
                Expanded(child: Text('Custom fill colour')),
              ],
            ),
          ),
        ),
      ],
    ),
    codeSnippet: '''
Card.filled(
  child: const Padding(
    padding: EdgeInsets.all(16),
    child: ListTile(
      leading: Icon(Icons.widgets),
      title: Text('Filled Card'),
      subtitle: Text('Solid fill, no border/elevation'),
    ),
  ),
)
''',
  ),

  // 7 ─────────────────────────────────────────
  WidgetInfo(
    name: 'FilledButton.tonal',
    description:
        'A Material 3 tonal variant of FilledButton. Uses the secondary container colour — less prominent than a full filled button.',
    category: WidgetCategory.material,
    whenToUse:
        'For a medium-high emphasis action using the secondary container color, between a filled button and an outlined one. Use FilledButton for the single most prominent action.',
    commonPitfalls: [
      'A null onPressed disables it rather than just removing the handler.',
      'Its tonal color is subtle on some themes; verify contrast for accessibility.',
    ],
    relatedWidgets: ['FilledButton', 'ElevatedButton', 'OutlinedButton'],
    docsUrl: 'https://api.flutter.dev/flutter/material/FilledButton-class.html',
    tags: ['button', 'tonal', 'filled'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FilledButton.tonal(onPressed: () {}, child: const Text('Tonal Button')),
        const SizedBox(height: 12),
        FilledButton.tonal(
          onPressed: () {},
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.bookmark_border),
              SizedBox(width: 8),
              Text('Save for Later'),
            ],
          ),
        ),
        const SizedBox(height: 12),
        FilledButton.tonal(
          onPressed: null,
          child: const Text('Disabled Tonal'),
        ),
      ],
    ),
    codeSnippet: '''
FilledButton.tonal(
  onPressed: () {},
  child: const Text('Tonal Button'),
)
''',
  ),

  // 8 ─────────────────────────────────────────
  WidgetInfo(
    name: 'IconButtonTheme',
    description:
        'An inherited widget that applies IconButtonThemeData to all IconButton widgets in its subtree — useful for bulk styling icon buttons.',
    category: WidgetCategory.material,
    whenToUse:
        'To apply a shared style to all IconButton widgets in a subtree. Style a single button inline when only one should differ.',
    commonPitfalls: [
      'It requires an IconButtonThemeData with a ButtonStyle; partial styles fall back to defaults.',
      'Only descendant icon buttons are affected.',
    ],
    relatedWidgets: ['IconButton', 'Theme'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/IconButtonTheme-class.html',
    tags: ['theme', 'iconbutton', 'styling'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => IconButtonTheme(
      data: IconButtonThemeData(
        style: IconButton.styleFrom(
          backgroundColor: Colors.deepPurple.shade50,
          foregroundColor: Colors.deepPurple,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.all(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(icon: const Icon(Icons.thumb_up), onPressed: () {}),
          IconButton(icon: const Icon(Icons.share), onPressed: () {}),
          IconButton(icon: const Icon(Icons.bookmark_border), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_horiz), onPressed: () {}),
        ],
      ),
    ),
    codeSnippet: '''
IconButtonTheme(
  data: IconButtonThemeData(
    style: IconButton.styleFrom(
      backgroundColor: Colors.deepPurple.shade50,
      foregroundColor: Colors.deepPurple,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
  child: Row(
    children: [
      IconButton(icon: const Icon(Icons.thumb_up), onPressed: () {}),
      IconButton(icon: const Icon(Icons.share), onPressed: () {}),
    ],
  ),
)
''',
  ),

  // 9 ─────────────────────────────────────────
  WidgetInfo(
    name: 'ProgressIndicatorTheme',
    description:
        'An inherited widget that applies ProgressIndicatorThemeData to LinearProgressIndicator and CircularProgressIndicator in its subtree.',
    category: WidgetCategory.material,
    whenToUse:
        'To set colors and track styling for all progress indicators in a subtree. Use it instead of theming each indicator individually.',
    commonPitfalls: [
      'It affects both linear and circular indicators in the subtree, which may not be intended.',
      'Inline color properties on an indicator override the theme.',
    ],
    relatedWidgets: [
      'CircularProgressIndicator',
      'LinearProgressIndicator',
      'Theme',
    ],
    docsUrl:
        'https://api.flutter.dev/flutter/material/ProgressIndicatorTheme-class.html',
    tags: ['theme', 'progress', 'styling'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => ProgressIndicatorTheme(
      data: const ProgressIndicatorThemeData(
        color: Colors.teal,
        linearTrackColor: Color(0xFFB2DFDB),
        circularTrackColor: Color(0xFFB2DFDB),
        linearMinHeight: 8,
      ),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('LinearProgressIndicator (themed):'),
          SizedBox(height: 8),
          LinearProgressIndicator(value: 0.65),
          SizedBox(height: 16),
          LinearProgressIndicator(),
          SizedBox(height: 16),
          Text('CircularProgressIndicator (themed):'),
          SizedBox(height: 8),
          CircularProgressIndicator(value: 0.65),
        ],
      ),
    ),
    codeSnippet: '''
ProgressIndicatorTheme(
  data: const ProgressIndicatorThemeData(
    color: Colors.teal,
    linearTrackColor: Color(0xFFB2DFDB),
    linearMinHeight: 8,
  ),
  child: Column(
    children: const [
      LinearProgressIndicator(value: 0.65),
      CircularProgressIndicator(value: 0.65),
    ],
  ),
)
''',
  ),

  // 10 ────────────────────────────────────────
  WidgetInfo(
    name: 'TooltipTheme',
    description:
        'An inherited widget that applies TooltipThemeData to all Tooltip widgets in its subtree — customise decoration, text style, wait duration and more.',
    category: WidgetCategory.material,
    whenToUse:
        'To set decoration, text style and wait/show durations for all Tooltip widgets in a subtree. Use it instead of configuring each tooltip.',
    commonPitfalls: [
      'Per-tooltip properties override the theme values.',
      'It only affects descendant tooltips, so place it high enough in the tree.',
    ],
    relatedWidgets: ['Tooltip', 'Theme'],
    docsUrl: 'https://api.flutter.dev/flutter/material/TooltipTheme-class.html',
    tags: ['theme', 'tooltip', 'styling'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => TooltipTheme(
      data: TooltipThemeData(
        decoration: BoxDecoration(
          color: Colors.indigo.shade800,
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        preferBelow: false,
        waitDuration: const Duration(milliseconds: 300),
      ),
      child: const Wrap(
        spacing: 12,
        children: [
          Tooltip(
            message: 'Edit this item',
            child: Icon(Icons.edit, size: 32, color: Colors.indigo),
          ),
          Tooltip(
            message: 'Delete permanently',
            child: Icon(Icons.delete_outline, size: 32, color: Colors.red),
          ),
          Tooltip(
            message: 'Share with others',
            child: Icon(Icons.share, size: 32, color: Colors.green),
          ),
        ],
      ),
    ),
    codeSnippet: '''
TooltipTheme(
  data: TooltipThemeData(
    decoration: BoxDecoration(
      color: Colors.indigo.shade800,
      borderRadius: BorderRadius.circular(8),
    ),
    textStyle: const TextStyle(color: Colors.white, fontSize: 13),
    preferBelow: false,
    waitDuration: const Duration(milliseconds: 300),
  ),
  child: const Tooltip(
    message: 'Edit this item',
    child: Icon(Icons.edit),
  ),
)
''',
  ),
];

// ─── Stateful helpers for batch 4 ────────────────────────────────────────────

class _RadioThemeSample extends StatefulWidget {
  const _RadioThemeSample();
  @override
  State<_RadioThemeSample> createState() => _RadioThemeSampleState();
}

class _RadioThemeSampleState extends State<_RadioThemeSample> {
  int _val = 1;

  @override
  Widget build(BuildContext context) {
    return RadioTheme(
      data: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.selected)) return Colors.orange;
          return Colors.grey;
        }),
        overlayColor: WidgetStateProperty.all(
          Colors.orange.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Custom orange radio theme:'),
          RadioGroup<int>(
            groupValue: _val,
            onChanged: (v) => setState(() => _val = v!),
            child: Column(
              children: [
                for (final opt in [1, 2, 3])
                  RadioListTile<int>(title: Text('Option $opt'), value: opt),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SliderThemeSample extends StatefulWidget {
  const _SliderThemeSample();
  @override
  State<_SliderThemeSample> createState() => _SliderThemeSampleState();
}

class _SliderThemeSampleState extends State<_SliderThemeSample> {
  double _val = 0.4;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: Colors.deepPurple,
        inactiveTrackColor: Colors.deepPurple.shade100,
        thumbColor: Colors.deepPurple,
        overlayColor: Colors.deepPurple.withValues(alpha: 0.2),
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 14),
        trackHeight: 6,
        valueIndicatorColor: Colors.deepPurpleAccent,
        showValueIndicator: ShowValueIndicator.onDrag,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Value: ${(_val * 100).round()}%'),
          Slider(value: _val, onChanged: (v) => setState(() => _val = v)),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// BATCH 5 – Remaining Material widgets
// ─────────────────────────────────────────────────────────────────────────────

final List<WidgetInfo> materialWidgetsExtra4 = [
  // 1 ─────────────────────────────────────────
  WidgetInfo(
    name: 'PaginatedDataTable',
    description:
        'A DataTable that splits rows across multiple pages and provides built-in page-navigation controls.',
    category: WidgetCategory.material,
    whenToUse:
        'For tabular data too large to render at once, splitting rows into pages with built-in navigation. Use DataTable for small, fully materialized tables.',
    commonPitfalls: [
      'You must implement a DataTableSource that supplies rows lazily.',
      'rowsPerPage must be one of availableRowsPerPage or it asserts.',
    ],
    relatedWidgets: ['DataTable', 'ListView'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/PaginatedDataTable-class.html',
    tags: ['table', 'pagination', 'data'],
    difficulty: WidgetDifficulty.advanced,
    builder: (context) => const _PaginatedDataTableSample(),
    codeSnippet: '''
PaginatedDataTable(
  header: const Text('Users'),
  rowsPerPage: 5,
  columns: const [
    DataColumn(label: Text('ID')),
    DataColumn(label: Text('Name')),
    DataColumn(label: Text('Role')),
  ],
  source: _MyDataSource(),
)
''',
  ),

  // 3 ─────────────────────────────────────────
  WidgetInfo(
    name: 'AppBarTheme',
    description:
        'An inherited widget that applies AppBarThemeData globally — background colour, elevation, title text style, icon themes and more.',
    category: WidgetCategory.material,
    whenToUse:
        'To set background color, elevation, title style and icon themes for all AppBars in a subtree (usually app-wide). Style a single AppBar inline for exceptions.',
    commonPitfalls: [
      'Per-AppBar properties override the theme.',
      'Material 3 changed several AppBar defaults, so values that worked in M2 may need revisiting.',
    ],
    relatedWidgets: ['AppBar', 'Theme'],
    docsUrl: 'https://api.flutter.dev/flutter/material/AppBarTheme-class.html',
    tags: ['theme', 'appbar', 'styling'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => AppBarTheme(
      backgroundColor: Colors.deepPurple,
      foregroundColor: Colors.white,
      elevation: 4,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      child: Scaffold(
        appBar: AppBar(title: const Text('Themed AppBar')),
        body: const Center(child: Text('Content area\n(AppBarTheme applied)')),
      ),
    ),
    codeSnippet: '''
AppBarTheme(
  backgroundColor: Colors.deepPurple,
  foregroundColor: Colors.white,
  elevation: 4,
  centerTitle: true,
  titleTextStyle: const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  ),
  child: Scaffold(
    appBar: AppBar(title: const Text('Themed AppBar')),
    body: Center(child: Text('Content')),
  ),
)
''',
  ),

  // 4 ─────────────────────────────────────────
  WidgetInfo(
    name: 'NavigationBarTheme',
    description:
        'An inherited widget that applies NavigationBarThemeData to all NavigationBar widgets — indicator colour, label style, icon theme and height.',
    category: WidgetCategory.material,
    whenToUse:
        'To set indicator color, label behavior, icon theme and height for all NavigationBar widgets in a subtree. Use it instead of styling each bar.',
    commonPitfalls: [
      'It only affects descendant NavigationBars.',
      'Label visibility is controlled via labelBehavior; setting it incorrectly hides labels unexpectedly.',
    ],
    relatedWidgets: ['NavigationBar', 'Theme'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/NavigationBarTheme-class.html',
    tags: ['theme', 'navigation', 'styling'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => const _NavigationBarThemeSample(),
    codeSnippet: '''
NavigationBarTheme(
  data: NavigationBarThemeData(
    backgroundColor: Colors.indigo.shade900,
    indicatorColor: Colors.indigoAccent,
    labelTextStyle: WidgetStateProperty.all(
      const TextStyle(color: Colors.white, fontSize: 12),
    ),
    iconTheme: WidgetStateProperty.all(
      const IconThemeData(color: Colors.white70),
    ),
  ),
  child: NavigationBar(
    destinations: [...],
    selectedIndex: 0,
    onDestinationSelected: (_) {},
  ),
)
''',
  ),

  // 5 ─────────────────────────────────────────
  WidgetInfo(
    name: 'ElevatedButtonTheme',
    description:
        'An inherited widget that applies ElevatedButtonThemeData to all ElevatedButton widgets in its subtree — style, shape, colours and text style.',
    category: WidgetCategory.material,
    whenToUse:
        'To apply a shared ButtonStyle to all ElevatedButton widgets in a subtree. Style a single button inline when only one should differ.',
    commonPitfalls: [
      'It needs an ElevatedButtonThemeData wrapping a ButtonStyle.',
      'Inline style on a button overrides the theme.',
    ],
    relatedWidgets: ['ElevatedButton', 'Theme'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/ElevatedButtonTheme-class.html',
    tags: ['theme', 'button', 'styling'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => ElevatedButtonTheme(
      data: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
          elevation: 6,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          ElevatedButton(onPressed: () {}, child: const Text('Primary')),
          ElevatedButton(onPressed: () {}, child: const Text('Action')),
          ElevatedButton(onPressed: null, child: const Text('Disabled')),
        ],
      ),
    ),
    codeSnippet: '''
ElevatedButtonTheme(
  data: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.deepOrange,
      foregroundColor: Colors.white,
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  ),
  child: ElevatedButton(onPressed: () {}, child: const Text('Themed')),
)
''',
  ),

  // 6 ─────────────────────────────────────────
  WidgetInfo(
    name: 'SnackBarTheme',
    description:
        'An inherited widget that applies SnackBarThemeData — background, text style, action button style and behaviour — to all SnackBars.',
    category: WidgetCategory.material,
    whenToUse:
        'To set background, text style, action style and behavior for all SnackBars in a subtree. Use it for app-wide snackbar consistency.',
    commonPitfalls: [
      'behavior (fixed vs floating) changes layout and margins; mismatched margin only applies to floating.',
      'Per-SnackBar properties override the theme.',
    ],
    relatedWidgets: ['SnackBar', 'Theme'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/SnackBarTheme-class.html',
    tags: ['theme', 'snackbar', 'styling'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => const _SnackBarThemeSample(),
    codeSnippet: '''
SnackBarTheme(
  data: const SnackBarThemeData(
    backgroundColor: Colors.deepPurple,
    contentTextStyle: TextStyle(color: Colors.white, fontSize: 14),
    actionTextColor: Colors.amberAccent,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  ),
  child: Builder(
    builder: (ctx) => ElevatedButton(
      onPressed: () => ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: const Text('Themed snack bar!'),
          action: SnackBarAction(label: 'Undo', onPressed: () {}),
        ),
      ),
      child: const Text('Show Snackbar'),
    ),
  ),
)
''',
  ),

  // 7 ─────────────────────────────────────────
  WidgetInfo(
    name: 'DialogTheme',
    description:
        'An inherited widget that applies DialogThemeData to all dialog widgets — shape, background colour, title style, and content style.',
    category: WidgetCategory.material,
    whenToUse:
        'To set shape, background color and text styles for all dialogs in a subtree. Use it instead of styling each AlertDialog or SimpleDialog.',
    commonPitfalls: [
      'It affects AlertDialog, SimpleDialog and similar; the impact may be broader than expected.',
      'Inline dialog properties override the theme.',
    ],
    relatedWidgets: ['AlertDialog', 'SimpleDialog', 'Theme'],
    docsUrl: 'https://api.flutter.dev/flutter/material/DialogTheme-class.html',
    tags: ['theme', 'dialog', 'styling'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => const _DialogThemeSample(),
    codeSnippet: '''
DialogTheme(
  data: DialogThemeData(
    backgroundColor: Colors.indigo.shade50,
    elevation: 16,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    titleTextStyle: TextStyle(
      color: Colors.indigo,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  child: Builder(
    builder: (ctx) => ElevatedButton(
      onPressed: () => showDialog(
        context: ctx,
        builder: (_) => AlertDialog(
          title: const Text('Themed Dialog'),
          content: const Text('This dialog uses DialogTheme.'),
          actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('OK'))],
        ),
      ),
      child: const Text('Show Dialog'),
    ),
  ),
)
''',
  ),

  // 8 ─────────────────────────────────────────
  WidgetInfo(
    name: 'PopupMenuTheme',
    description:
        'An inherited widget that applies PopupMenuThemeData to all PopupMenuButton instances — colour, shape, text style and elevation.',
    category: WidgetCategory.material,
    whenToUse:
        'To set color, shape, elevation and text style for all PopupMenuButton menus in a subtree. Use it instead of styling each menu.',
    commonPitfalls: [
      'It styles the menu surface, not the trigger button itself.',
      'Only descendant popup menus are affected.',
    ],
    relatedWidgets: ['PopupMenuButton', 'Theme'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/PopupMenuTheme-class.html',
    tags: ['theme', 'menu', 'styling'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => PopupMenuTheme(
      data: PopupMenuThemeData(
        color: Colors.blueGrey.shade900,
        textStyle: const TextStyle(color: Colors.white),
        labelTextStyle: WidgetStateProperty.all(
          const TextStyle(color: Colors.white70, fontSize: 14),
        ),
        elevation: 12,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: PopupMenuButton<String>(
        icon: const Icon(Icons.more_vert),
        itemBuilder: (_) => [
          const PopupMenuItem(value: 'edit', child: Text('✏️  Edit')),
          const PopupMenuItem(value: 'copy', child: Text('📋  Copy')),
          const PopupMenuDivider(),
          const PopupMenuItem(
            value: 'delete',
            child: Text('🗑️  Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    ),
    codeSnippet: '''
PopupMenuTheme(
  data: PopupMenuThemeData(
    color: Colors.blueGrey.shade900,
    textStyle: const TextStyle(color: Colors.white),
    elevation: 12,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  child: PopupMenuButton<String>(
    itemBuilder: (_) => const [
      PopupMenuItem(value: 'edit', child: Text('Edit')),
      PopupMenuItem(value: 'delete', child: Text('Delete')),
    ],
  ),
)
''',
  ),

  // 9 ─────────────────────────────────────────
  WidgetInfo(
    name: 'DrawerTheme',
    description:
        'An inherited widget that applies DrawerThemeData to all Drawer and NavigationDrawer widgets — width, background, shape and elevation.',
    category: WidgetCategory.material,
    whenToUse:
        'To set width, background, shape and elevation for all Drawer and NavigationDrawer widgets in a subtree. Use it for consistent drawer styling.',
    commonPitfalls: [
      'It affects both Drawer and NavigationDrawer, which may be more than intended.',
      'Inline drawer properties override the theme.',
    ],
    relatedWidgets: ['Drawer', 'NavigationDrawer', 'Theme'],
    docsUrl: 'https://api.flutter.dev/flutter/material/DrawerTheme-class.html',
    tags: ['theme', 'drawer', 'styling'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => const _DrawerThemeSample(),
    codeSnippet: '''
DrawerTheme(
  data: DrawerThemeData(
    backgroundColor: Colors.deepPurple.shade900,
    scrimColor: Colors.black54,
    elevation: 16,
    width: 260,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(24),
        bottomRight: Radius.circular(24),
      ),
    ),
  ),
  child: Scaffold(
    drawer: Drawer(child: ...),
    body: ...,
  ),
)
''',
  ),

  // 10 ────────────────────────────────────────
  WidgetInfo(
    name: 'NavigationRailTheme',
    description:
        'An inherited widget that applies NavigationRailThemeData to all NavigationRail widgets — background, indicator colour, label type and selected/unselected styles.',
    category: WidgetCategory.material,
    whenToUse:
        'To set background, indicator color, label type and selected/unselected styles for all NavigationRail widgets in a subtree.',
    commonPitfalls: [
      'labelType controls whether labels show; the wrong value hides them.',
      'Only descendant rails are affected.',
    ],
    relatedWidgets: ['NavigationRail', 'Theme'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/NavigationRailTheme-class.html',
    tags: ['theme', 'navigation', 'styling'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => const _NavigationRailThemeSample(),
    codeSnippet: '''
NavigationRailTheme(
  data: NavigationRailThemeData(
    backgroundColor: Colors.deepPurple.shade900,
    selectedIconTheme: const IconThemeData(color: Colors.amberAccent),
    unselectedIconTheme: const IconThemeData(color: Colors.white54),
    selectedLabelTextStyle: const TextStyle(color: Colors.amberAccent),
    unselectedLabelTextStyle: const TextStyle(color: Colors.white54),
    indicatorColor: Colors.white24,
    labelType: NavigationRailLabelType.all,
  ),
  child: NavigationRail(
    selectedIndex: 0,
    destinations: [...],
    onDestinationSelected: (_) {},
  ),
)
''',
  ),
];

// ─── Stateful helpers for batch 5 ────────────────────────────────────────────

// -- PaginatedDataTable --

class _PaginatedDataTableSample extends StatelessWidget {
  const _PaginatedDataTableSample();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: PaginatedDataTable(
        header: const Text('Members'),
        rowsPerPage: 4,
        columns: const [
          DataColumn(label: Text('ID')),
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Role')),
        ],
        source: _MemberDataSource(),
      ),
    );
  }
}

class _MemberDataSource extends DataTableSource {
  final _rows = const [
    ['001', 'Alice', 'Admin'],
    ['002', 'Bob', 'Developer'],
    ['003', 'Carol', 'Designer'],
    ['004', 'Dave', 'Manager'],
    ['005', 'Eve', 'QA Engineer'],
    ['006', 'Frank', 'DevOps'],
    ['007', 'Grace', 'Product'],
    ['008', 'Hank', 'Developer'],
    ['009', 'Ivy', 'Analyst'],
    ['010', 'Jack', 'Support'],
  ];

  @override
  DataRow? getRow(int index) {
    if (index >= _rows.length) return null;
    final r = _rows[index];
    return DataRow(
      cells: [DataCell(Text(r[0])), DataCell(Text(r[1])), DataCell(Text(r[2]))],
    );
  }

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _rows.length;
  @override
  int get selectedRowCount => 0;
}

// -- NavigationBarTheme --

class _NavigationBarThemeSample extends StatefulWidget {
  const _NavigationBarThemeSample();
  @override
  State<_NavigationBarThemeSample> createState() =>
      _NavigationBarThemeSampleState();
}

class _NavigationBarThemeSampleState extends State<_NavigationBarThemeSample> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        backgroundColor: Colors.indigo.shade900,
        indicatorColor: Colors.indigoAccent,
        labelTextStyle: WidgetStateProperty.all(
          const TextStyle(color: Colors.white, fontSize: 12),
        ),
        iconTheme: WidgetStateProperty.all(
          const IconThemeData(color: Colors.white70),
        ),
        height: 64,
      ),
      child: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// -- SnackBarTheme --

class _SnackBarThemeSample extends StatelessWidget {
  const _SnackBarThemeSample();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: Colors.deepPurple,
          contentTextStyle: TextStyle(color: Colors.white, fontSize: 14),
          actionTextColor: Colors.amberAccent,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          elevation: 8,
        ),
      ),
      child: Builder(
        builder: (ctx) => ElevatedButton.icon(
          icon: const Icon(Icons.notifications_active),
          label: const Text('Show Themed SnackBar'),
          onPressed: () {
            ScaffoldMessenger.of(ctx).showSnackBar(
              SnackBar(
                content: const Text('This uses SnackBarThemeData via Theme!'),
                action: SnackBarAction(label: 'Undo', onPressed: () {}),
              ),
            );
          },
        ),
      ),
    );
  }
}

// -- DialogTheme --

class _DialogThemeSample extends StatelessWidget {
  const _DialogThemeSample();

  @override
  Widget build(BuildContext context) {
    return DialogTheme(
      data: DialogThemeData(
        backgroundColor: Colors.indigo.shade50,
        elevation: 16,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        titleTextStyle: const TextStyle(
          color: Colors.indigo,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        contentTextStyle: const TextStyle(color: Colors.black87, fontSize: 14),
      ),
      child: Builder(
        builder: (ctx) => ElevatedButton.icon(
          icon: const Icon(Icons.open_in_new),
          label: const Text('Show Themed Dialog'),
          onPressed: () => showDialog(
            context: ctx,
            builder: (dialogCtx) => AlertDialog(
              title: const Text('DialogTheme'),
              content: const Text(
                'Background, title style and shape are all\ncustomised via DialogTheme.',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(dialogCtx),
                  child: const Text('Close'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// -- DrawerTheme --

class _DrawerThemeSample extends StatelessWidget {
  const _DrawerThemeSample();

  @override
  Widget build(BuildContext context) {
    return DrawerTheme(
      data: DrawerThemeData(
        backgroundColor: Colors.deepPurple.shade900,
        scrimColor: Colors.black54,
        elevation: 16,
        width: 240,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
        ),
      ),
      child: Builder(
        builder: (ctx) => ElevatedButton.icon(
          icon: const Icon(Icons.menu),
          label: const Text('Open Themed Drawer'),
          onPressed: () => Scaffold.maybeOf(ctx)?.openDrawer(),
        ),
      ),
    );
  }
}

// -- NavigationRailTheme --

class _NavigationRailThemeSample extends StatefulWidget {
  const _NavigationRailThemeSample();
  @override
  State<_NavigationRailThemeSample> createState() =>
      _NavigationRailThemeSampleState();
}

class _NavigationRailThemeSampleState
    extends State<_NavigationRailThemeSample> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Row(
        children: [
          NavigationRailTheme(
            data: NavigationRailThemeData(
              backgroundColor: Colors.deepPurple.shade900,
              selectedIconTheme: const IconThemeData(
                color: Colors.amberAccent,
                size: 28,
              ),
              unselectedIconTheme: const IconThemeData(
                color: Colors.white54,
                size: 24,
              ),
              selectedLabelTextStyle: const TextStyle(
                color: Colors.amberAccent,
                fontSize: 12,
              ),
              unselectedLabelTextStyle: const TextStyle(
                color: Colors.white54,
                fontSize: 12,
              ),
              indicatorColor: Colors.white24,
              labelType: NavigationRailLabelType.all,
            ),
            child: NavigationRail(
              selectedIndex: _index,
              onDestinationSelected: (i) => setState(() => _index = i),
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.analytics),
                  label: Text('Stats'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings),
                  label: Text('Settings'),
                ),
              ],
            ),
          ),
          const VerticalDivider(width: 1),
          Expanded(
            child: Center(
              child: Text(
                'Tab $_index selected',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// BATCH 5 – Next 10 additional Material widgets
// ─────────────────────────────────────────────────────────────────────────────

final List<WidgetInfo> materialWidgetsExtra5 = [
  // 1 ─────────────────────────────────────────
  WidgetInfo(
    name: 'LicensePage',
    description:
        'A page that displays licenses for software used by the application.',
    category: WidgetCategory.material,
    whenToUse:
        'To show the standard scrollable page listing open-source licenses. Use showLicensePage to push it, or AboutDialog which links to it.',
    commonPitfalls: [
      'Push it as a route (showLicensePage or MaterialPageRoute), not as an inline widget.',
      'Custom licenses must be registered via LicenseRegistry to appear.',
    ],
    relatedWidgets: ['AboutDialog', 'AboutListTile'],
    docsUrl: 'https://api.flutter.dev/flutter/material/LicensePage-class.html',
    tags: ['license', 'page', 'about'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => ElevatedButton(
      onPressed: () {
        showLicensePage(
          context: context,
          applicationName: 'Widget Samples',
          applicationVersion: '1.0.0',
        );
      },
      child: const Text('Show Licenses'),
    ),
    codeSnippet: '''
showLicensePage(
  context: context,
  applicationName: 'Widget Samples',
  applicationVersion: '1.0.0',
);
''',
  ),

  // 2 ─────────────────────────────────────────
  WidgetInfo(
    name: 'MenuItemButton',
    description: 'A button meant to be used in a menu.',
    category: WidgetCategory.material,
    whenToUse:
        'For a terminal, tappable item inside a MenuBar or MenuAnchor menu. Use SubmenuButton when the item should open a nested menu.',
    commonPitfalls: [
      'It is designed for menus; outside a MenuAnchor/MenuBar its layout and focus behave oddly.',
      'A null onPressed disables it.',
    ],
    relatedWidgets: ['MenuAnchor', 'MenuBar'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/MenuItemButton-class.html',
    tags: ['menu', 'item', 'button'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => MenuAnchor(
      builder: (context, controller, child) => ElevatedButton(
        onPressed: () {
          if (controller.isOpen) {
            controller.close();
          } else {
            controller.open();
          }
        },
        child: const Text('Open Menu'),
      ),
      menuChildren: [
        MenuItemButton(
          onPressed: () {},
          leadingIcon: const Icon(Icons.copy),
          child: const Text('Copy'),
        ),
        MenuItemButton(
          onPressed: () {},
          leadingIcon: const Icon(Icons.paste),
          child: const Text('Paste'),
        ),
      ],
    ),
    codeSnippet: '''
MenuItemButton(
  onPressed: () {},
  leadingIcon: const Icon(Icons.copy),
  child: const Text('Copy'),
)
''',
  ),

  // 5 ─────────────────────────────────────────
  WidgetInfo(
    name: 'ExpandIcon',
    description:
        'A widget that rotates to indicate that a section is expanded or collapsed.',
    category: WidgetCategory.material,
    whenToUse:
        'To show a rotating chevron that indicates expanded/collapsed state in custom expandable UI. ExpansionTile already includes one for the common case.',
    commonPitfalls: [
      'It does not manage state; track isExpanded yourself and pass it in.',
      'It only renders the icon and rotation, not the expansion behavior.',
    ],
    relatedWidgets: ['ExpansionTile', 'ExpansionPanel', 'IconButton'],
    docsUrl: 'https://api.flutter.dev/flutter/material/ExpandIcon-class.html',
    tags: ['icon', 'expand', 'toggle'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => const _ExpandIconSample(),
    codeSnippet: '''
ExpandIcon(
  isExpanded: _isExpanded,
  onPressed: (bool value) {
    setState(() {
      _isExpanded = !value;
    });
  },
)
''',
  ),

  // 7 ─────────────────────────────────────────
  WidgetInfo(
    name: 'GridTileBar',
    description:
        'A Material Design grid tile bar with a leading icon, a title, a subtitle, and a trailing icon.',
    category: WidgetCategory.material,
    whenToUse:
        'As a header or footer overlay on a GridTile, holding a title, subtitle and leading/trailing widgets. Use it together with GridTile.',
    commonPitfalls: [
      'It is meant to overlay a tile (often via GridTile\'s header/footer), not stand alone.',
      'Long titles are clipped rather than wrapped within the bar.',
    ],
    relatedWidgets: ['GridTile', 'ListTile'],
    docsUrl: 'https://api.flutter.dev/flutter/material/GridTileBar-class.html',
    tags: ['grid', 'tile', 'bar'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => Container(
      height: 60,
      decoration: const BoxDecoration(color: Colors.black45),
      child: const GridTileBar(
        leading: Icon(Icons.info, color: Colors.white),
        title: Text('Grid Tile Bar Title'),
        subtitle: Text('Subtitle here'),
        trailing: Icon(Icons.star, color: Colors.yellow),
      ),
    ),
    codeSnippet: '''
GridTileBar(
  backgroundColor: Colors.black45,
  leading: Icon(Icons.info),
  title: Text('Title'),
  subtitle: Text('Subtitle'),
)
''',
  ),

  // 10 ────────────────────────────────────────
  WidgetInfo(
    name: 'FlexibleSpaceBar',
    description:
        'The part of a material design app bar that expands, collapses, and stretches.',
    category: WidgetCategory.material,
    whenToUse:
        'As the collapsing/expanding content of a SliverAppBar\'s flexibleSpace, often with a background image and title. Use it only inside a SliverAppBar.',
    commonPitfalls: [
      'It must be the flexibleSpace of a SliverAppBar to collapse correctly.',
      'The title can overlap the background image; manage collapseMode and title padding.',
    ],
    relatedWidgets: ['AppBar', 'Image'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/FlexibleSpaceBar-class.html',
    tags: ['appbar', 'sliver', 'collapse'],
    difficulty: WidgetDifficulty.advanced,
    builder: (context) => SizedBox(
      height: 150,
      child: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Flexible Space Bar'),
              background: Image.network(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    ),
    codeSnippet: '''
SliverAppBar(
  expandedHeight: 150.0,
  flexibleSpace: FlexibleSpaceBar(
    title: Text('Flexible Space Bar'),
    background: Image.network(...),
  ),
)
''',
  ),
];

// ─── Stateful helpers for batch 5 ────────────────────────────────────────────

class _ExpandIconSample extends StatefulWidget {
  const _ExpandIconSample();

  @override
  State<_ExpandIconSample> createState() => _ExpandIconSampleState();
}

class _ExpandIconSampleState extends State<_ExpandIconSample> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Click to expand ->'),
            ExpandIcon(
              isExpanded: _isExpanded,
              onPressed: (bool value) {
                setState(() {
                  _isExpanded = !value;
                });
              },
            ),
          ],
        ),
        if (_isExpanded)
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('This is the expanded content!'),
          ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// BATCH 6 – Next 10 additional Material widgets
// ─────────────────────────────────────────────────────────────────────────────

final List<WidgetInfo> materialWidgetsExtra6 = [
  // 2 ─────────────────────────────────────────
  WidgetInfo(
    name: 'DateRangePickerDialog',
    description: 'A Material Design date range picker dialog.',
    category: WidgetCategory.material,
    whenToUse:
        'To let users pick a start and end date as a range. For a single date use showDatePicker, and prefer showDateRangePicker over building this dialog directly.',
    commonPitfalls: [
      'Prefer showDateRangePicker which wraps this dialog with correct routing.',
      'firstDate, lastDate and the initial range must be consistent or it asserts.',
    ],
    relatedWidgets: ['DatePicker', 'TimePicker'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/DateRangePickerDialog-class.html',
    tags: ['date', 'range', 'picker'],
    difficulty: WidgetDifficulty.advanced,
    builder: (context) => const _DateRangePickerSample(),
    codeSnippet: '''
showDateRangePicker(
  context: context,
  firstDate: DateTime(2023),
  lastDate: DateTime(2025),
);
''',
  ),

  // 3 ─────────────────────────────────────────
  WidgetInfo(
    name: 'TimePickerDialog',
    description: 'A Material Design time picker dialog.',
    category: WidgetCategory.material,
    whenToUse:
        'To let users choose a time of day. Prefer showTimePicker which presents this dialog with correct routing and returns the result.',
    commonPitfalls: [
      'Prefer showTimePicker over constructing the dialog directly.',
      'The 12/24-hour format follows MediaQuery\'s alwaysUse24HourFormat; test both.',
    ],
    relatedWidgets: ['TimePicker', 'DatePicker'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/TimePickerDialog-class.html',
    tags: ['time', 'picker', 'dialog'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => const _TimePickerSample(),
    codeSnippet: '''
showTimePicker(
  context: context,
  initialTime: TimeOfDay.now(),
);
''',
  ),

  // 5 ─────────────────────────────────────────
  WidgetInfo(
    name: 'AnimatedTheme',
    description:
        'Transition between a given theme and its new value over a specific duration.',
    category: WidgetCategory.material,
    whenToUse:
        'To smoothly animate between two ThemeData values over a duration, e.g. when toggling dark mode. MaterialApp already animates its top-level theme for you.',
    commonPitfalls: [
      'Not all theme properties interpolate cleanly; some snap rather than tween.',
      'Wrapping the whole app redundantly with MaterialApp\'s own animation can double-animate.',
    ],
    relatedWidgets: ['Theme'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/AnimatedTheme-class.html',
    tags: ['theme', 'animation', 'transition'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => const _AnimatedThemeSample(),
    codeSnippet: '''
AnimatedTheme(
  data: _isDark ? ThemeData.dark() : ThemeData.light(),
  duration: const Duration(milliseconds: 500),
  child: content,
)
''',
  ),

  // 6 ─────────────────────────────────────────
  WidgetInfo(
    name: 'TabPageSelector',
    description:
        'A widget that displays a row of dots to indicate which page is currently selected in a TabBarView.',
    category: WidgetCategory.material,
    whenToUse:
        'To show a row of dots indicating the current page in a TabBarView, as a lightweight alternative to a TabBar.',
    commonPitfalls: [
      'It needs a TabController, shared with the TabBarView, or it cannot track the page.',
      'With many tabs the dots become hard to distinguish; prefer a TabBar for large counts.',
    ],
    relatedWidgets: ['Tooltip'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/TabPageSelector-class.html',
    tags: ['tabs', 'indicator', 'dots'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => const _TabPageSelectorSample(),
    codeSnippet: '''
TabPageSelector(
  controller: _tabController,
)
''',
  ),

  // 7 ─────────────────────────────────────────
  WidgetInfo(
    name: 'CheckedPopupMenuItem',
    description: 'A menu item with a checkmark.',
    category: WidgetCategory.material,
    whenToUse:
        'For a popup menu item that displays a checkmark to reflect a toggled state, inside a PopupMenuButton. Use a plain PopupMenuItem for non-toggle actions.',
    commonPitfalls: [
      'Pass checked to reflect state; the item does not toggle itself, you update state in onSelected.',
      'It is intended for use within PopupMenuButton\'s itemBuilder.',
    ],
    relatedWidgets: ['PopupMenuButton', 'Checkbox'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/CheckedPopupMenuItem-class.html',
    tags: ['menu', 'checkbox', 'popup'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => const _CheckedPopupMenuItemSample(),
    codeSnippet: '''
CheckedPopupMenuItem<int>(
  value: 1,
  checked: _isChecked,
  child: const Text('Checkable Item'),
)
''',
  ),

  // 8 ─────────────────────────────────────────
  WidgetInfo(
    name: 'DrawerHeader',
    description: 'The top part of a Material Design drawer.',
    category: WidgetCategory.material,
    whenToUse:
        'As a simple branded header at the top of a Drawer\'s children. Use UserAccountsDrawerHeader when you need to display account details.',
    commonPitfalls: [
      'It has a fixed default height; tall content gets clipped.',
      'It expects to be the first child of a Drawer\'s ListView for correct layout.',
    ],
    relatedWidgets: ['Drawer', 'UserAccountsDrawerHeader', 'NavigationDrawer'],
    docsUrl: 'https://api.flutter.dev/flutter/material/DrawerHeader-class.html',
    tags: ['drawer', 'header', 'branding'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) => SizedBox(
      height: 200,
      child: const Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Header',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    ),
    codeSnippet: '''
DrawerHeader(
  decoration: BoxDecoration(color: Colors.blue),
  child: Text('Header'),
)
''',
  ),

  // 9 ─────────────────────────────────────────
  WidgetInfo(
    name: 'RawMaterialButton',
    description:
        'A low-level widget for building Material buttons from scratch.',
    category: WidgetCategory.material,
    whenToUse:
        'Only when you need full control to build a custom Material button from scratch. Prefer ElevatedButton, FilledButton, OutlinedButton or TextButton for standard styling.',
    commonPitfalls: [
      'It has no default Material 3 styling; you must supply colors, shape and elevation yourself.',
      'Easy to miss accessibility defaults (min tap size, semantics) that higher-level buttons provide.',
    ],
    relatedWidgets: [
      'ElevatedButton',
      'TextButton',
      'OutlinedButton',
      'Material',
    ],
    docsUrl:
        'https://api.flutter.dev/flutter/material/RawMaterialButton-class.html',
    tags: ['button', 'custom', 'low-level'],
    difficulty: WidgetDifficulty.advanced,
    builder: (context) => RawMaterialButton(
      onPressed: () {},
      elevation: 2.0,
      fillColor: Colors.white,
      padding: const EdgeInsets.all(15.0),
      shape: const CircleBorder(),
      child: const Icon(Icons.pause, size: 35.0),
    ),
    codeSnippet: '''
RawMaterialButton(
  onPressed: () {},
  fillColor: Colors.white,
  shape: const CircleBorder(),
  child: const Icon(Icons.pause),
)
''',
  ),

  // 10 ────────────────────────────────────────
  WidgetInfo(
    name: 'DropdownButtonFormField',
    description: 'A DropdownButton integrated with a FormField.',
    category: WidgetCategory.material,
    whenToUse:
        'To use a dropdown selector inside a Form with built-in validation and error display. Use DropdownButton when you do not need form integration.',
    commonPitfalls: [
      'value must match one of the items\' values exactly or it asserts.',
      'Validation runs through the Form; place it inside a Form and trigger validate() to see errors.',
    ],
    relatedWidgets: ['DropdownButton', 'DropdownMenu', 'Form', 'FormField'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/DropdownButtonFormField-class.html',
    tags: ['dropdown', 'form', 'validation'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => DropdownButtonFormField<String>(
      decoration: const InputDecoration(labelText: 'Select Gender'),
      items: ['Male', 'Female', 'Other']
          .map((label) => DropdownMenuItem(value: label, child: Text(label)))
          .toList(),
      onChanged: (value) {},
    ),
    codeSnippet: '''
DropdownButtonFormField<String>(
  decoration: const InputDecoration(labelText: 'Gender'),
  onChanged: (value) {},
  items: [...],
)
''',
  ),
];

// ─── Stateful helpers for batch 6 ────────────────────────────────────────────

class _DateRangePickerSample extends StatelessWidget {
  const _DateRangePickerSample();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await showDateRangePicker(
          context: context,
          firstDate: DateTime(2023),
          lastDate: DateTime(2025),
        );
      },
      child: const Text('Pick Date Range'),
    );
  }
}

class _TimePickerSample extends StatelessWidget {
  const _TimePickerSample();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
      },
      child: const Text('Pick Time'),
    );
  }
}

class _AnimatedThemeSample extends StatefulWidget {
  const _AnimatedThemeSample();

  @override
  State<_AnimatedThemeSample> createState() => _AnimatedThemeSampleState();
}

class _AnimatedThemeSampleState extends State<_AnimatedThemeSample> {
  bool _isDark = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedTheme(
          data: _isDark ? ThemeData.dark() : ThemeData.light(),
          duration: const Duration(milliseconds: 500),
          child: Builder(
            builder: (context) {
              return Container(
                padding: const EdgeInsets.all(16),
                color: Theme.of(context).cardColor,
                child: const Text('Theming Content'),
              );
            },
          ),
        ),
        SwitchListTile(
          title: const Text('Dark Mode'),
          value: _isDark,
          onChanged: (v) => setState(() => _isDark = v),
        ),
      ],
    );
  }
}

class _TabPageSelectorSample extends StatefulWidget {
  const _TabPageSelectorSample();

  @override
  State<_TabPageSelectorSample> createState() => _TabPageSelectorSampleState();
}

class _TabPageSelectorSampleState extends State<_TabPageSelectorSample>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
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
        TabPageSelector(controller: _controller),
        const SizedBox(height: 10),
        SizedBox(
          height: 100,
          child: TabBarView(
            controller: _controller,
            children: const [
              Center(child: Text('Page 1')),
              Center(child: Text('Page 2')),
              Center(child: Text('Page 3')),
            ],
          ),
        ),
      ],
    );
  }
}

class _CheckedPopupMenuItemSample extends StatefulWidget {
  const _CheckedPopupMenuItemSample();

  @override
  State<_CheckedPopupMenuItemSample> createState() =>
      _CheckedPopupMenuItemSampleState();
}

class _CheckedPopupMenuItemSampleState
    extends State<_CheckedPopupMenuItemSample> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      onSelected: (int value) {
        if (value == 1) {
          setState(() => _isChecked = !_isChecked);
        }
      },
      itemBuilder: (context) => [
        CheckedPopupMenuItem<int>(
          value: 1,
          checked: _isChecked,
          child: const Text('Checkable Item'),
        ),
      ],
      child: const Text('Open Popup Menu'),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// AUDIT BATCH 1 – Priority Material & Content Widgets
// ─────────────────────────────────────────────────────────────────────────────

final List<WidgetInfo> materialWidgetsAuditBatch1 = [
  // 1 ─────────────────────────────────────────
  WidgetInfo(
    name: 'CarouselView',
    description:
        'A Material 3 carousel widget that presents a scrollable list of items.',
    category: WidgetCategory.material,
    whenToUse:
        'For a Material 3 scrollable, snapping carousel of items. Use a ListView for a plain horizontal list without the carousel layout effects.',
    commonPitfalls: [
      'You must provide item extents (itemExtent or the weighted constructor); omitting sizing breaks layout.',
      'It is relatively new, so verify it exists in your Flutter version.',
    ],
    relatedWidgets: ['ListView', 'Card'],
    docsUrl: 'https://api.flutter.dev/flutter/material/CarouselView-class.html',
    tags: ['carousel', 'scroll', 'material3'],
    difficulty: WidgetDifficulty.intermediate,
    builder: (context) => const _CarouselViewSample(),
    codeSnippet: '''
CarouselView(
  itemExtent: 300,
  shrinkExtent: 200,
  children: List.generate(10, (int index) {
    return UnconstrainedBox(
      child: Container(
        color: Colors.primaries[index % Colors.primaries.length],
        child: Center(child: Text('Item \$index')),
      ),
    );
  }),
)
''',
  ),

  // 2 ─────────────────────────────────────────
  WidgetInfo(
    name: 'ElevatedButton',
    description: 'A Material Design elevated button.',
    category: WidgetCategory.material,
    whenToUse:
        'For a high-emphasis action that should stand out with elevation. In Material 3 consider FilledButton for the single most prominent action.',
    commonPitfalls: [
      'A null onPressed disables the button rather than just removing the handler.',
      'Using many elevated buttons together dilutes their emphasis.',
    ],
    relatedWidgets: ['FilledButton', 'OutlinedButton', 'TextButton'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/ElevatedButton-class.html',
    tags: ['button', 'elevated', 'action'],
    difficulty: WidgetDifficulty.beginner,
    builder: (context) =>
        ElevatedButton(onPressed: () {}, child: const Text('Elevated Button')),
    codeSnippet: '''
ElevatedButton(
  onPressed: () {},
  child: const Text('Elevated Button'),
)
''',
  ),

  // 6 ─────────────────────────────────────────
  WidgetInfo(
    name: 'ExpansionPanel',
    description: 'A panel used within an ExpansionPanelList.',
    category: WidgetCategory.material,
    whenToUse:
        'As an individual panel within an ExpansionPanelList. It is not used standalone; for a single collapsible row use ExpansionTile.',
    commonPitfalls: [
      'It only works inside an ExpansionPanelList, which manages its expansion.',
      'isExpanded is controlled externally; you must update it in the list\'s expansionCallback.',
    ],
    relatedWidgets: ['ExpansionPanelList', 'ExpansionTile'],
    docsUrl:
        'https://api.flutter.dev/flutter/material/ExpansionPanel-class.html',
    tags: ['expand', 'panel', 'accordion'],
    difficulty: WidgetDifficulty.intermediate,
    // ExpansionPanelList needs unbounded vertical space, so wrap it in a
    // bounded scroll view for the preview.
    builder: (context) => const SizedBox(
      height: 220,
      child: SingleChildScrollView(child: _ExpansionPanelSample()),
    ),
    codeSnippet: '''
ExpansionPanelList(
  children: [
    ExpansionPanel(
      headerBuilder: (context, isOpen) => ListTile(title: Text('Header')),
      body: ListTile(title: Text('Body content')),
      isExpanded: _isOpen,
    ),
  ],
)
''',
  ),

  // 7 ─────────────────────────────────────────
  WidgetInfo(
    name: 'FormField',
    description: 'A single form field that maintains state and validation.',
    category: WidgetCategory.material,
    whenToUse:
        'To build a custom form input with managed state, validation and saving, inside a Form. Use the ready-made TextFormField/DropdownButtonFormField for common cases.',
    commonPitfalls: [
      'Wire onSaved, validator and the builder\'s state correctly; forgetting to call state.didChange leaves the value stale.',
      'It must be a descendant of a Form to participate in validate()/save().',
    ],
    relatedWidgets: ['Form', 'TextField', 'DropdownMenu'],
    docsUrl: 'https://api.flutter.dev/flutter/material/FormField-class.html',
    tags: ['form', 'field', 'validation'],
    difficulty: WidgetDifficulty.advanced,
    builder: (context) => const _FormFieldSample(),
    codeSnippet: '''
FormField<String>(
  builder: (state) {
    return Column(
      children: [
        TextField(onChanged: state.didChange),
        if (state.hasError) Text(state.errorText!),
      ],
    );
  },
  validator: (val) => val!.isEmpty ? 'Required' : null,
)
''',
  ),
];

// ─── Stateful helpers for audit batch 1 ──────────────────────────────────────

class _CarouselViewSample extends StatelessWidget {
  const _CarouselViewSample();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 200),
      child: CarouselView(
        itemExtent: 280,
        shrinkExtent: 150,
        children: List.generate(5, (int index) {
          return Container(
            color: Colors.primaries[index % Colors.primaries.length].withAlpha(
              204,
            ),
            child: Center(
              child: Text(
                'Card ${index + 1}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _ExpansionPanelSample extends StatefulWidget {
  const _ExpansionPanelSample();

  @override
  State<_ExpansionPanelSample> createState() => _ExpansionPanelSampleState();
}

class _ExpansionPanelSampleState extends State<_ExpansionPanelSample> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (index, isExpanded) {
        setState(() => _isExpanded = !isExpanded);
      },
      children: [
        ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return const ListTile(title: Text('Standard Expansion Panel'));
          },
          body: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'This is the body content of the ExpansionPanel widget.',
            ),
          ),
          isExpanded: _isExpanded,
        ),
      ],
    );
  }
}

class _FormFieldSample extends StatefulWidget {
  const _FormFieldSample();

  @override
  State<_FormFieldSample> createState() => _FormFieldSampleState();
}

class _FormFieldSampleState extends State<_FormFieldSample> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          FormField<bool>(
            initialValue: false,
            validator: (value) => value == false ? 'You must agree' : null,
            builder: (state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CheckboxListTile(
                    title: const Text('I agree to the terms'),
                    value: state.value,
                    onChanged: state.didChange,
                  ),
                  if (state.hasError)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        state.errorText!,
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ),
                ],
              );
            },
          ),
          ElevatedButton(
            onPressed: () => _formKey.currentState!.validate(),
            child: const Text('Validate Form'),
          ),
        ],
      ),
    );
  }
}
