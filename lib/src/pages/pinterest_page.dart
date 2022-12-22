// ignore_for_file: depend_on_referenced_packages

import 'package:custompainter/src/features/pinterestMenu/pinterest_menu.dart';
import 'package:custompainter/src/pages/pinterest_page.ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../features/pinterestMenu/pinterest_menu.ui.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PinterestMenuUI()),
        ChangeNotifierProvider(create: (_) => PinterestPageUI()),
      ],
      child: Scaffold(
          body: Stack(
        children: [PinterestGrid(), _PinterestGridMenu()],
      )),
    );
  }
}

class _PinterestGridMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final showMenu = Provider.of<PinterestMenuUI>(context).showMenu;

    return Positioned(
        bottom: 30,
        child: SizedBox(
          width: screenWidth,
          // Align posiciona widgets en un widget, y por defecto lo alinea en el centro
          child: Align(
            child: PinterestMenu(
              showMenu: showMenu,
              items: [
                PinterestButton(icon: Icons.pie_chart, onPressed: () {}),
                PinterestButton(icon: Icons.search, onPressed: () {}),
                PinterestButton(icon: Icons.notifications, onPressed: () {}),
                PinterestButton(
                    icon: Icons.supervised_user_circle, onPressed: () {}),
              ],
              // activeOptColor: Colors.brown,
              // noActiveOptColor: Colors.white,
              // backgroundColor: Colors.black,
            ),
          ),
        ));
  }
}

class PinterestGrid extends StatefulWidget {
  const PinterestGrid({Key? key}) : super(key: key);

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List items = List.generate(200, (index) => index);
  ScrollController controller = ScrollController();
  double scrollAnterior = 0;

  @override
  void initState() {
    final provider = Provider.of<PinterestMenuUI>(context, listen: false);

    controller.addListener(() {
      if (controller.offset > scrollAnterior && controller.offset > 150) {
        // Controlar cuando hacer scroll hacia abajo
        provider.showMenu = false;
      } else {
        // Scroll hacia arriba
        provider.showMenu = true;
      }

      scrollAnterior = controller.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      controller: controller,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;

  const _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    // final heroList = Provider.of<PinterestPageUI>(context).listHeroes;

    return Container(
        margin: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
            // image: DecorationImage(
            //   image: NetworkImage(heroList[index].images.lg),
            //   fit: BoxFit.cover,
            // ),
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(
              '$index',
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ));
  }
}
