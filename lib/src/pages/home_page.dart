import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              _MenuOption(
                navigation: 'headersPage',
                navigationOpt: 'Headers',
              ),
              _MenuOption(
                navigation: 'animacionesPage',
                navigationOpt: 'Animaciones',
              ),
              // _MenuOption(
              //   navigation: 'circularProgressPage',
              //   navigationOpt: 'Circular Progress',
              // ),
              _MenuOption(
                navigation: 'slideshowPage',
                navigationOpt: 'Slideshow',
              ),
              _MenuOption(
                navigation: 'pinterestPage',
                navigationOpt: 'Pinterest',
              ),
              _MenuOption(
                navigation: 'emergencyPage',
                navigationOpt: 'Emergency',
              ),
              _MenuOption(
                navigation: 'sliverListPage',
                navigationOpt: 'Sliver List',
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuOption extends StatelessWidget {
  final String navigationOpt;
  final String navigation;

  const _MenuOption({required this.navigationOpt, required this.navigation});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (() {
          Navigator.pushNamed(context, navigation);
        }),
        child: Container(
          margin: const EdgeInsets.all(10),
          width: 200,
          height: 40,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(100))),
          child: Text(
            navigationOpt,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
        ));
  }
}
