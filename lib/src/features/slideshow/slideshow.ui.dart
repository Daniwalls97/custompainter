// ignore_for_file: unnecessary_getters_setters

import 'package:flutter/material.dart';

class SlideshowUI with ChangeNotifier {
  double _currentPage = 0;
  Color _colorPrimario = Colors.pinkAccent;
  Color _colorSecundario = Colors.grey;
  double _bulletPrimario = 12.0;
  double _bulletSecundario = 12.0;

  double get currentPage => _currentPage;

  set currentPage(double page) {
    _currentPage = page;
    notifyListeners();
  }

  Color get colorPrimario => _colorPrimario;
  Color get colorSecundario => _colorSecundario;
  double get bulletPrimario => _bulletPrimario;
  double get bulletSecundario => _bulletSecundario;

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

  set bulletPrimario(double tamanio) {
    _bulletPrimario = tamanio;
  }

  set bulletSecundario(double tamanio) {
    _bulletSecundario = tamanio;
  }
}
