// ignore_for_file: depend_on_referenced_packages

import 'package:custompainter/src/features/slideshow/slideshow.ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final Color colorPrimario;
  final Color colorSecundario;

  const Slideshow(
      {Key? key,
      required this.slides,
      this.colorPrimario = Colors.pinkAccent,
      this.colorSecundario = Colors.grey})
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
    return Container(
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

  _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SlideshowUI>(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 12,
      height: 12,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          color: (provider.currentPage >= index - 0.5 &&
                  provider.currentPage < index + 0.5)
              ? provider.colorPrimario
              : provider.colorSecundario,
          shape: BoxShape.circle),
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
  final pageViewController = new PageController();

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
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(30),
        child: slide);
  }
}
