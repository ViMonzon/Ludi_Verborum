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
    _initImage();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 10));
    tween = Tween<double>(begin: 10, end: 1);
    final Animation<double> curve =
        CurvedAnimation(parent: animationController, curve: Curves.ease);
    animation = tween.animate(curve);
    animationController.repeat(reverse: true);

    Timer(
        const Duration(milliseconds: 6200),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage())));
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
          child: Text(
            "LVDI VERBORVUM ",
            style: TextStyle(fontSize: 42, color: secondaryTextColor),
          ),
        )
      ],
    ));
  }

  @override
  void dispose() {
    animationController.dispose(); //dispose the ticker here
    super.dispose();
  }

  void _initImage() async {
    image = await rootBundle.load('lib/assets/images/ludi2.png');
    setState(() {});
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
    final p = Path();

    for (var i = 0; i < path.length; i++) {
      p.addOval(Rect.fromCircle(
          center: Offset(path[i].dx - ((path[i].dx - path2[i].dx) / anim.value),
              path[i].dy - ((path[i].dy - path2[i].dy) / anim.value)),
          radius: i.isEven ? 10 : 7));
    }
    canvas.drawPath(p, Paint()..color = primaryTextColor);
  }

  @override
  bool shouldRepaint(SplashPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(SplashPainter oldDelegate) => true;

  void _generate() async {
    for (var i = 0; i < 40; i++) {
      path.add(Offset(Random().nextDouble() * Get.width * 1.5,
          Random().nextDouble() * Get.height * 1.5));
      path2.add(Offset(Random().nextDouble() * Get.width * 1.5,
          Random().nextDouble() * Get.height * 1.5));
    }
    if (image != null) {}
  }
}
