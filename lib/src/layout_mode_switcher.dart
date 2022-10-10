import 'package:flutter/widgets.dart';
import 'package:layout_mode_switcher/layout_mode_switcher.dart';

class LayoutModeSwitcher<T> extends StatefulWidget {
  final WidgetBuilder builder;
  final LayoutModeController<T> controller;

  const LayoutModeSwitcher({
    required this.builder,
    required this.controller,
    super.key,
  });

  @override
  State<LayoutModeSwitcher<T>> createState() => _LayoutModeSwitcherState<T>();
}

class _LayoutModeSwitcherState<T> extends State<LayoutModeSwitcher<T>> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_listener);
  }

  void _listener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_listener);
    super.dispose();
  }
}
