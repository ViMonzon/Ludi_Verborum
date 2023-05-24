import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../themes/constants.dart';
import '../themes/customs.dart';
import 'login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Tween<double> tween;
  late Animation<double> animation;
  ByteData? image;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    tween = Tween<double>(begin: -1, end: 0.25);
    final Animation<double> curve =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    animation = tween.animate(curve);
    animationController.repeat(reverse: true);

    Timer(
        const Duration(milliseconds: 6000),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        crearFondo(context),
        CustomPaint(
          painter: SplashPainter(animation, image),
          child: const SizedBox.expand(),
        ),
        Center(
            child: Column(children: <Widget>[
          SizedBox(height: 250),
          Image.asset(
            'lib/assets/images/ludi2new.png', // Reemplaza 'ruta_del_icono.png' con la ruta correcta de tu archivo PNG
            width: 100.0,
            height: 100.0,
            // Color del icono
          ),
          Text(
            "LVDI V3RBORVM ",
            style: TextStyle(
                fontSize: 42,
                color: titleTextColor,
                fontWeight: FontWeight.w900),
          ),
        ]))
      ],
    ));
  }

  @override
  void dispose() {
    animationController.dispose(); //dispose the ticker here
    super.dispose();
  }
}

class SplashPainter extends CustomPainter {
  Animation<double> anim;
  List<Offset> path = [];
  List<Offset> path2 = [];
  ByteData? image;

  SplashPainter(this.anim, this.image) : super(repaint: anim) {
    _generate();
  }
  @override
  void paint(Canvas canvas, Size size) {
    final alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

    for (var i = 0; i < path.length; i++) {
      final offsetY = path[i].dy + ((path2[i].dy - path[i].dy) * anim.value);
      final center = Offset(path[i].dx, offsetY);
      double radius = i.isEven ? 40 : 17;

      final letter = alphabet[i % alphabet.length];
      final textSpan = TextSpan(
        text: letter,
        style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Avenir',
            fontSize: 15,
            fontWeight: FontWeight.w600),
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      final textOffset = Offset(
        center.dx - textPainter.width / 2,
        center.dy - textPainter.height / 2,
      );

      final p = Path();
      p.addOval(Rect.fromCircle(center: center, radius: radius));

      canvas.drawPath(p, Paint()..color = primaryTextColor.withOpacity(0.5));
      textPainter.paint(canvas, textOffset);
    }
  }

  @override
  bool shouldRepaint(SplashPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(SplashPainter oldDelegate) => true;

  void _generate() async {
    for (var i = 0; i < 50; i++) {
      path.add(Offset(Random().nextDouble() * Get.width * 1.5,
          Random().nextDouble() * Get.height * 1.5));
      path2.add(Offset(Random().nextDouble() * Get.width * 1.5,
          Random().nextDouble() * Get.height * 1.5));
    }
  }
}
