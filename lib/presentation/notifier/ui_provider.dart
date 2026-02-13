import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class UiNotifier extends ChangeNotifier with WidgetsBindingObserver {
  int _selectedIndex = 0;
  int _secondSelectedIndex = 0;
  final Set<String> _selectedFilters = {};
  double _initialBottom = 10;

  double get initialBottom => _initialBottom;
  set initialBottom(double val) {
    if (_initialBottom == val) return;
    _initialBottom = val;
    notifyListeners();
  }

  void resetInitialBottom() {
    _initialBottom = 10;
    notifyListeners();
  }

  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode mode) {
    if (_themeMode == mode) return;
    _themeMode = mode;
    notifyListeners();
  }

  bool isFilterSelected(String val) => _selectedFilters.contains(val);
  bool _isKeyboardOpen = false;
  bool _shouldShowProgressWidget = true;
  double _bottomPaddingHeight = 0.0;

  bool get isKeyboardOpen => _isKeyboardOpen;
  bool get shouldShowProgressWidget => _shouldShowProgressWidget;
  double get bottomPaddingHeight => _bottomPaddingHeight;

  Set<String> get selectedFilter => Set.unmodifiable(_selectedFilters);
  int get selectedIndex => _selectedIndex;
  int get secondSelectedIndex => _secondSelectedIndex;

  set shouldShowProgressWidget(bool val) {
    if (_shouldShowProgressWidget == val) return;
    _shouldShowProgressWidget = val;
    notifyListeners();
  }

  set isKeyboardOpen(bool val) {
    if (_isKeyboardOpen == val) return;
    _isKeyboardOpen = val;

    notifyListeners();
  }

  UiNotifier() {
    WidgetsBinding.instance.addObserver(this);
    _updateView();
  }

  set selectedIndex(int selectedIndex) {
    if (_selectedIndex == selectedIndex) return;
    _selectedIndex = selectedIndex;
    notifyListeners();
  }

  set secondSelectedIndex(int secondSelectedIndex) {
    if (_secondSelectedIndex == secondSelectedIndex) return;
    _secondSelectedIndex = secondSelectedIndex;
    notifyListeners();
  }

  void toggleFilterSelection(String val) {
    if (_selectedFilters.contains(val)) {
      _selectedFilters.remove(val);
    } else {
      _selectedFilters.add(val);
    }
    notifyListeners();
  }

  void clear() {
    _selectedFilters.clear();
    notifyListeners();
  }

  void setSelected(Set<String> val) {
    _selectedFilters
      ..clear()
      ..addAll(val);
    notifyListeners();
  }

  void _updateView() {
    final ui.FlutterView view = WidgetsBinding.instance.platformDispatcher.views.first;
    final double bottomInsetLogical = view.viewInsets.bottom / view.devicePixelRatio;

    final bool nextOpen = bottomInsetLogical > 0;
    final double nextHeight = bottomInsetLogical;
    if (nextOpen != _isKeyboardOpen || nextHeight != _bottomPaddingHeight) {
      _isKeyboardOpen = nextOpen;
      _bottomPaddingHeight = nextHeight;
      notifyListeners();
    }
  }
  @override
  void didChangeMetrics() {
    _updateView();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
