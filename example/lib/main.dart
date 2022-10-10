import 'package:flutter/material.dart';
import 'package:layout_mode_switcher/layout_mode_switcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = LayoutModeController([
    LayoutModeItem(
      mode: LayoutMode.grid2,
      tooltip: 'Grid two columns',
      icon: Icons.grid_view_outlined,
    ),
    LayoutModeItem(
      mode: LayoutMode.list,
      tooltip: 'List with items',
      icon: Icons.list_alt_outlined,
    ),
  ]);

  @override
  Widget build(BuildContext context) {
    final actions = <Widget>[
      ..._controller.items.map((e) {
        return IconButton(
          tooltip: e.tooltip,
          onPressed: () => _controller.changeMode(e),
          icon: Icon(e.icon),
        );
      }).toList(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout mode switcher'),
        actions: actions,
      ),
      body: Center(
        child: LayoutModeSwitcher<LayoutModeItem>(
          controller: _controller,
          builder: (_) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(_controller.current.icon),
                Text(_controller.current.tooltip),
              ],
            );
          },
        ),
      ),
    );
  }
}

enum LayoutMode { grid2, grid3, list }

class LayoutModeItem {
  final LayoutMode mode;
  final IconData icon;
  final String tooltip;

  LayoutModeItem({
    required this.mode,
    required this.tooltip,
    required this.icon,
  });
}
