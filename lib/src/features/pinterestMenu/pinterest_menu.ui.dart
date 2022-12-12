import 'package:flutter/material.dart';

class PinterestMenuUI with ChangeNotifier {
  int _itemSeleccionado = 0;
  bool _showMenu = true;

  Color backgroundColor = Colors.white;
  Color activeOptColor = Colors.black;
  Color noActiveOptColor = Colors.grey;

  int get itemSeleccionado => _itemSeleccionado;
  set itemSeleccionado(int index) {
    _itemSeleccionado = index;
    notifyListeners();
  }

  bool get showMenu => _showMenu;
  set showMenu(bool valor) {
    _showMenu = valor;
    notifyListeners();
  }
}
