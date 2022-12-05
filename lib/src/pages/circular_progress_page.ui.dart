import 'dart:ui';

import 'package:flutter/cupertino.dart';

class CircularProgressPageUI with ChangeNotifier {
  double _porcentaje = 0.0;
  double _nuevoPorcentaje = 10.0;

  double get porcentaje => _porcentaje;
  set porcentaje(double value) {
    _porcentaje = value;
    notifyListeners();
  }

  void updatePorcentaje() {
    porcentaje = _nuevoPorcentaje;
    _nuevoPorcentaje += 10;
    if (_nuevoPorcentaje > 100) {
      _nuevoPorcentaje = 0;
      porcentaje = 0;
    }
  }

  void updatePorcentajeState(AnimationController controller) {
    porcentaje = lerpDouble(porcentaje, _nuevoPorcentaje, controller.value)!;
  }
}

// class _CircularProgressPageState extends State<CircularProgressPage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController controller;

//   double porcentaje = 0.0;
//   double nuevoPorcentaje = 0.0;

//   @override
//   void initState() {
//     controller = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 800));

//     controller.addListener(() {
//       // print('valor controller: ${ controller.value }');
//       setState(() {
//         porcentaje = lerpDouble(porcentaje, nuevoPorcentaje, controller.value)!;
//       });
//     });

//     super.initState();
//   }
