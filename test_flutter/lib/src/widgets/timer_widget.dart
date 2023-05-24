import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_flutter/src/utils/user_preferences.dart';

import '../bloc/provider.dart';
import '../themes/constants.dart';

class TimerWidget extends StatefulWidget {
  final VoidCallback onTimerFinish;
  const TimerWidget({Key? key, required this.onTimerFinish}) : super(key: key);

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Timer _timer;
  final _preferencesService = PreferencesService();
  int _seconds = 200;
  int _maxSecods = 200;

  @override
  void initState() {
    super.initState();
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    final bloc = Provider.of(context);
    initSeconds(bloc.email);
    startTimer();
  }

  void initSeconds(String email) async {
    final settings = await _preferencesService.getSettings(email);
    setState(() {
      _seconds = settings.time;
      _maxSecods = settings.time;
    });
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
    double progress = _seconds / _maxSecods;
    return Stack(
      children: [
        Center(
            child: Container(
          width: 100,
          height: 100,
          child: CircularProgressIndicator(
            value: 1 - progress,
            backgroundColor: secondaryTextColor,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white70),
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
