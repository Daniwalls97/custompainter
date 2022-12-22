// ignore_for_file: depend_on_referenced_packages

import 'package:custompainter/src/features/slideshow/slideshow.ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;

  const Slideshow(
      {Key? key,
      required this.slides,
      this.colorPrimario = Colors.pinkAccent,
      this.colorSecundario = Colors.grey,
      this.bulletPrimario = 12.0,
      this.bulletSecundario = 12.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => SlideshowUI()),
      child: SafeArea(
        child: Center(child: Builder(
          builder: (context) {
            Provider.of<SlideshowUI>(context).colorPrimario = colorPrimario;
            Provider.of<SlideshowUI>(context).colorSecundario = colorSecundario;

            Provider.of<SlideshowUI>(context).bulletPrimario = bulletPrimario;
            Provider.of<SlideshowUI>(context).bulletSecundario =
                bulletSecundario;

            return Column(children: [
              Expanded(
                  child: _Slides(
                slides: slides,
              )),
              _Dots(slides.length)
            ]);
          },
        )),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;

  const _Dots(this.totalSlides);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalSlides, (index) => _Dot(index)),
        // children: [_Dot(0), _Dot(1), _Dot(2)],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SlideshowUI>(context);

    double tamanio = 0;
    Color color;

    if (provider.currentPage >= index - 0.5 &&
        provider.currentPage < index + 0.5) {
      tamanio = provider.bulletPrimario;
      color = provider.colorPrimario;
    } else {
      tamanio = provider.bulletSecundario;
      color = provider.colorSecundario;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: tamanio,
      height: tamanio,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides({Key? key, required this.slides}) : super(key: key);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      Provider.of<SlideshowUI>(context, listen: false).currentPage =
          pageViewController.page!;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageViewController,
      children: widget.slides.map((slide) => _Slide(slide)).toList(),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(30),
        child: slide);
  }
}
