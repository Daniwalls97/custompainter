// ignore_for_file: unused_import, depend_on_referenced_packages

import 'package:custompainter/src/pages/animaciones_page.dart';
import 'package:custompainter/src/pages/circular_progress_page.dart';
import 'package:custompainter/src/pages/emergency_page.dart';
import 'package:custompainter/src/pages/headers_page.dart';
import 'package:custompainter/src/pages/pinterest_page.dart';
import 'package:custompainter/src/pages/slideshow_page.dart';
import 'package:custompainter/src/pages/sliver_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:disposable_provider/disposable_provider.dart';
import 'package:vsync_provider/vsync_provider.dart';

import 'src/pages/home_page.dart';

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
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Diseños App',
          // home: SlideshowPage()),
          initialRoute: '/',
          routes: {
            '/': (context) => const HomePage(),
            'slideshowPage': (context) => const SlideshowPage(),
            'animacionesPage': (context) => const AnimacionesPage(),
            // 'circularProgressPage': (context) => const CircularProgressPage(),
            'pinterestPage': (context) => const PinterestPage(),
            'headersPage': (context) => const HeadersPage(),
            'emergencyPage': (context) => EmergencyPage(),
            'sliverListPage': (context) => SliverListPage()
          }),
      // home: PinterestPage()),
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
