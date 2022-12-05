import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color(0xff615AAB),
    );
  }
}

class HeaderBordesRedondos extends StatelessWidget {
  const HeaderBordesRedondos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
          color: Color(0xff615AAB),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(70),
              bottomRight: Radius.circular(70))),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Propiedades de paint (lapiz)
    paint.color = const Color(0xff615AAB);
    // paint.style = PaintingStyle.stroke; //.stroke (solo pinta la linea)
    paint.style = PaintingStyle.fill; //.fill (rellenar todo el contenido)
    paint.strokeWidth = 5;

    final path = Path();
    // Inicialmente está en la posición (0,0) borde superior izquierdo
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderTriangulo extends StatelessWidget {
  const HeaderTriangulo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderTrianguloPainter(),
      ),
    );
  }
}

class _HeaderTrianguloPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Propiedades de paint (lapiz)
    paint.color = const Color(0xff615AAB);
    // paint.style = PaintingStyle.stroke; //.stroke (solo pinta la linea)
    paint.style = PaintingStyle.fill; //.fill (rellenar todo el contenido)
    paint.strokeWidth = 5;

    final path = Path();
    // Inicialmente está en la posición (0,0) borde superior izquierdo
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderPico extends StatelessWidget {
  const HeaderPico({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Propiedades de paint (lapiz)
    paint.color = const Color(0xff615AAB);
    // paint.style = PaintingStyle.stroke; //.stroke (solo pinta la linea)
    paint.style = PaintingStyle.fill; //.fill (rellenar todo el contenido)
    paint.strokeWidth = 5;

    final path = Path();
    // Inicialmente está en la posición (0,0) borde superior izquierdo
    path.lineTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.5, size.height * 0.3);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderCurvo extends StatelessWidget {
  const HeaderCurvo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Propiedades de paint (lapiz)
    paint.color = const Color(0xff615AAB);
    // paint.style = PaintingStyle.stroke; //.stroke (solo pinta la linea)
    paint.style = PaintingStyle.fill; //.fill (rellenar todo el contenido)
    paint.strokeWidth = 5;

    final path = Path();
    // Inicialmente está en la posición (0,0) borde superior izquierdo
    path.lineTo(0, size.height * 0.25);
    // Dos primeras cordenadas, es el centro de la curva que se va a realizar (eje de curvatura)
    // Las otras dos siguientes es hacia donde se va a mover
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.4, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWaves extends StatelessWidget {
  const HeaderWaves({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderWavesPainter(),
      ),
    );
  }
}

class _HeaderWavesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Propiedades de paint (lapiz)
    paint.color = const Color(0xff615AAB);
    // paint.style = PaintingStyle.stroke; //.stroke (solo pinta la linea)
    paint.style = PaintingStyle.fill; //.fill (rellenar todo el contenido)
    paint.strokeWidth = 5;

    final path = Path();
    // Inicialmente está en la posición (0,0) borde superior izquierdo
    path.lineTo(0, size.height * 0.3);
    // Dos primeras cordenadas, es el centro de la curva que se va a realizar (eje de curvatura)
    // Las otras dos siguientes es hacia donde se va a mover
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.35,
        size.width * 0.5, size.height * 0.3);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.25, size.width, size.height * 0.3);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWavesGradient extends StatelessWidget {
  const HeaderWavesGradient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      // color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderWavesGradientPainter(),
      ),
    );
  }
}

class _HeaderWavesGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect =
        Rect.fromCircle(center: const Offset(0.0, 55.0), radius: 180);

    Gradient gradiente = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          Color.fromARGB(255, 113, 0, 170),
          Color.fromARGB(255, 168, 0, 219),
          Color.fromARGB(255, 60, 0, 157)
        ],
        stops: [
          0.4,
          0.5,
          1.0
        ]);

    final paint = Paint()..shader = gradiente.createShader(rect);

    // Propiedades de paint (lapiz)
    // paint.color = Color.fromARGB(255, 13, 11, 132);
    // paint.style = PaintingStyle.stroke; //.stroke (solo pinta la linea)
    paint.style = PaintingStyle.fill; //.fill (rellenar todo el contenido)
    paint.strokeWidth = 5;

    final path = Path();
    // Inicialmente está en la posición (0,0) borde superior izquierdo
    path.lineTo(0, size.height * 0.3);
    // Dos primeras cordenadas, es el centro de la curva que se va a realizar (eje de curvatura)
    // Las otras dos siguientes es hacia donde se va a mover
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.35,
        size.width * 0.5, size.height * 0.3);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.25, size.width, size.height * 0.3);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
