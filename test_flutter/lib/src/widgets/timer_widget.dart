import 'dart:async';

import 'package:flutter/material.dart';

import '../themes/constants.dart';

class TimerWidget extends StatefulWidget {
  final VoidCallback onTimerFinish;
  const TimerWidget({Key? key, required this.onTimerFinish}) : super(key: key);

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Timer _timer;
  int _seconds = 30;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (timer) {
        if (_seconds == 0) {
          timer.cancel();
          widget.onTimerFinish(); // llamada a la función de callback
        } else {
          setState(() {
            _seconds--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double progress = _seconds / 120;
    return Stack(
      children: [
        Center(
            child: Container(
          width: 100,
          height: 100,
          child: CircularProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(secondaryTextColor),
            strokeWidth: 10,
          ),
        )),
        Positioned.fill(
          child: Center(
            child: Text(
              '$_seconds',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
