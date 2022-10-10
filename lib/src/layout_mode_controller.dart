import 'package:flutter/foundation.dart';

class LayoutModeController<T> with ChangeNotifier {
  final List<T> items;

  LayoutModeController(this.items) : assert(items.isNotEmpty);

  T? _current;

  T get current {
    return _current ?? items.first;
  }

  void changeMode(T mode) {
    _current = mode;
    notifyListeners();
  }
}
