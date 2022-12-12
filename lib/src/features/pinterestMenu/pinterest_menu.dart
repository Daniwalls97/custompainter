import 'package:custompainter/src/features/pinterestMenu/pinterest_menu.ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  // VoidCallback = void Function() -> Necesario para asignar a onPressed, en vez de Function
  final VoidCallback onPressed;
  final IconData icon;

  PinterestButton({required this.onPressed, required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final bool showMenu;
  final Color backgroundColor;
  final Color activeOptColor;
  final Color noActiveOptColor;
  final List<PinterestButton> items;

  PinterestMenu(
      {Key? key,
      this.showMenu = true,
      this.backgroundColor = Colors.white,
      this.activeOptColor = Colors.black,
      this.noActiveOptColor = Colors.grey,
      required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => PinterestMenuUI(),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 250),
          opacity: (showMenu) ? 1 : 0,
          child: Builder(
            builder: (context) {
              Provider.of<PinterestMenuUI>(context).backgroundColor =
                  backgroundColor;
              Provider.of<PinterestMenuUI>(context).activeOptColor =
                  activeOptColor;
              Provider.of<PinterestMenuUI>(context).noActiveOptColor =
                  noActiveOptColor;

              return _PinterestMenuBackground(
                child: _MenuItems(menuItems: items),
              );
            },
          ),
        ));
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;

  const _PinterestMenuBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor =
        Provider.of<PinterestMenuUI>(context).backgroundColor;

    return Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          boxShadow: const <BoxShadow>[
            BoxShadow(color: Colors.black, blurRadius: 10, spreadRadius: -5)
          ]),
      child: child,
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  const _MenuItems({required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length,
          (index) => _PinterestMenuButton(index, menuItems[index])),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  const _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PinterestMenuUI>(context);

    return GestureDetector(
      onTap: () {
        Provider.of<PinterestMenuUI>(context, listen: false).itemSeleccionado =
            index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        child: Icon(
          item.icon,
          size: (provider.itemSeleccionado == index) ? 35 : 25,
          color: (provider.itemSeleccionado == index)
              ? provider.activeOptColor
              : provider.noActiveOptColor,
        ),
      ),
    );
  }
}
