import 'dart:async';

import 'package:flutter/material.dart';

import '../themes/constants.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({Key? key}) : super(key: key);

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Timer _timer;
  int _seconds = 120;

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
          child: CircularProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(secondaryTextColor),
            strokeWidth: 10,
          ),
        ),
        Center(
          child: Text(
            '$_seconds segundos',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ],
    );
  }
}