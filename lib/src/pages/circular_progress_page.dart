// ignore_for_file: unnecessary_import, depend_on_referenced_packages, prefer_typing_uninitialized_variables

import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'circular_progress_page.ui.dart';
import 'package:vsync_provider/vsync_provider.dart';

class CircularProgressPage extends StatelessWidget {
  const CircularProgressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => CircularProgressPageUI()),
      child: Scaffold(
        floatingActionButton: const RefreshIndicatorButton(),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(5),
            width: 300,
            height: 300,
            // color: Colors.red,
            child: Selector<CircularProgressPageUI, double>(
              selector: (context, provider) => provider.porcentaje,
              builder: (context, value, child) => CustomPaint(
                painter: _MiRadialProgress(value),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RefreshIndicatorButton extends StatelessWidget {
  const RefreshIndicatorButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final circularProvider =
        Provider.of<CircularProgressPageUI>(context, listen: false);
    late AnimationController controller;

    controller = AnimationController(
        vsync: VsyncProvider.of(context),
        duration: const Duration(milliseconds: 800));

    controller
        .addListener(() => circularProvider.updatePorcentajeState(controller));

    return FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () {
          circularProvider.updatePorcentaje();

          // controller.forward(from: 0.0);
        },
        child: const Icon(Icons.refresh));
  }
}

class _MiRadialProgress extends CustomPainter {
  final porcentaje;

  _MiRadialProgress(this.porcentaje);

  @override
  void paint(Canvas canvas, Size size) {
    // Circulo completado
    final paint = Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width * 0.5, size.height / 2);
    final radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);

    // Arco
    final paintArco = Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;

    // Parte que se deberá ir llenando
    double arcAngle = 2 * pi * (porcentaje / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radio), -pi / 2,
        arcAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
