import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FatButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color1;
  final Color color2;
  final Function onPress;

  const FatButton(
      {Key? key,
      this.icon = FontAwesomeIcons.circle,
      required this.text,
      this.color1 = Colors.grey,
      this.color2 = Colors.blueGrey,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _FatButtonBackground(
          icon: icon,
          color1: color1,
          color2: color2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 140,
              width: 40,
            ),
            FaIcon(
              FontAwesomeIcons.carCrash,
              color: Colors.white,
              size: 40,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            FaIcon(
              FontAwesomeIcons.chevronRight,
              color: Colors.white,
            ),
            const SizedBox(
              width: 40,
            ),
          ],
        )
      ],
    );
  }
}

class _FatButtonBackground extends StatelessWidget {
  final IconData icon;
  final Color color1;
  final Color color2;

  const _FatButtonBackground(
      {super.key,
      required this.icon,
      required this.color1,
      required this.color2});

  @override
  Widget build(BuildContext context) {
    final Color buttonBackgroundColor = Colors.black.withOpacity(0.2);

    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: buttonBackgroundColor,
                blurRadius: 10,
                offset: const Offset(4, 6))
          ],
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(colors: [color1, color2])),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
                right: -20,
                top: -20,
                child: FaIcon(
                  icon,
                  size: 150,
                  color: Colors.white.withOpacity(0.2),
                ))
          ],
        ),
      ),
    );
  }
}