// import 'package:custompainter/src/pages/animaciones_page.dart';
// import 'package:custompainter/src/pages/circular_progress_page.dart';
import 'package:custompainter/src/pages/pinterest_page.dart';
// import 'package:custompainter/src/pages/slideshow_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:disposable_provider/disposable_provider.dart';
import 'package:vsync_provider/vsync_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        const VsyncProvider(),
        DisposableProvider(
          create: (context) => _Model(
            vsync: VsyncProvider.of(context),
          ),
        )
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Diseños App',
          // home: SlideshowPage()),
          home: PinterestPage()),
    );
  }
}

class _Model implements Disposable {
  _Model({
    required TickerProvider vsync,
  }) : _animationController = AnimationController(
          vsync: vsync,
          duration: const Duration(milliseconds: 1000),
        );

  final AnimationController _animationController;

  Animation<double> get animation => _animationController;

  void toggle() {
    _animationController.isCompleted
        ? _animationController.reverse()
        : _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
  }
}
