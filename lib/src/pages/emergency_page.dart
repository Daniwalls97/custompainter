import 'package:custompainter/src/widgets/fat_button.dart';
import 'package:custompainter/src/widgets/headers.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = <ItemBoton>[
      ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          const Color(0xff6989F5), const Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          const Color(0xff66A9F2), const Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          const Color(0xffF2D572), const Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.biking, 'Awards', const Color(0xff317183),
          const Color(0xff46997D)),
      ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          const Color(0xff6989F5), const Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          const Color(0xff66A9F2), const Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          const Color(0xffF2D572), const Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.biking, 'Awards', const Color(0xff317183),
          const Color(0xff46997D)),
      ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          const Color(0xff6989F5), const Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          const Color(0xff66A9F2), const Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          const Color(0xffF2D572), const Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.biking, 'Awards', const Color(0xff317183),
          const Color(0xff46997D)),
    ];

    List<Widget> itemMap = items
        .map((item) => FadeInLeft(
              duration: const Duration(milliseconds: 250),
              child: FatButton(
                icon: item.icon,
                text: item.texto,
                color1: item.color1,
                color2: item.color2,
                onPress: printSomething,
              ),
            ))
        .toList();

    return Scaffold(
        body: Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 200),
          child: ListView(
            // En las physics estas hace que se haga el rebote que por defecto hace iOS en sus listas, Android se ve el borde con el color primary
            physics: const BouncingScrollPhysics(),
            children: [const SizedBox(height: 80), ...itemMap],
          ),
        ),
        _Header(),
      ],
    ));
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        IconHeader(
            icon: FontAwesomeIcons.plus,
            title: "Asistencia Médica",
            subTitle: "Has solicitado"),
        Positioned(
            right: 0,
            top: 45,
            child: RawMaterialButton(
              onPressed: printSomething,
              shape: CircleBorder(),
              padding: EdgeInsets.all(15),
              child: FaIcon(
                FontAwesomeIcons.ellipsisVertical,
                color: Colors.white,
              ),
            ))
      ],
    );
  }
}

class FatButtonTemp extends StatelessWidget {
  const FatButtonTemp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const FatButton(
        icon: FontAwesomeIcons.carCrash,
        text: "Motor Accident",
        onPress: printSomething,
        color1: Color(0xff6989F5),
        color2: Color(0xff906EF5));
  }
}

void printSomething() {
  print('Hello¿?');
}

class HeaderPage extends StatelessWidget {
  const HeaderPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const IconHeader(
      icon: FontAwesomeIcons.plus,
      subTitle: "Has Solicitado",
      title: "Asistencia Médica",
      color1: Colors.black,
    );
  }
}

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}
