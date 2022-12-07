import 'package:flutter/material.dart';

class SlideshowUI with ChangeNotifier {
  double _currentPage = 0;
  Color _colorPrimario = Colors.pinkAccent;
  Color _colorSecundario = Colors.grey;

  double get currentPage => _currentPage;

  set currentPage(double page) {
    _currentPage = page;
    notifyListeners();
  }

  Color get colorPrimario => _colorPrimario;
  Color get colorSecundario => _colorSecundario;

  set colorPrimario(Color color) {
    _colorPrimario = color;
    // FlutterError (setState() or markNeedsBuild() called during build.
    // notifyListeners();
  }

  set colorSecundario(Color color) {
    _colorSecundario = color;
    // FlutterError (setState() or markNeedsBuild() called during build.
    // notifyListeners();
  }
}
