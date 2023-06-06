import 'dart:math';

import 'package:flutter/material.dart';

import 'speedometer.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SpeedometerContainer extends StatefulWidget {
  const SpeedometerContainer({super.key});

  @override
  _SpeedometerContainerState createState() => _SpeedometerContainerState();
}

class _SpeedometerContainerState extends State<SpeedometerContainer> {
  double velocity = 0;
  double highestVelocity = 0.0;

  @override
  void initState() {
    userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      _onAccelerate(event);
    });
    super.initState();
  }

  void _onAccelerate(UserAccelerometerEvent event) {
    double newVelocity =
        sqrt(event.x * event.x + event.y * event.y + event.z * event.z);

    if ((newVelocity - velocity).abs() < 1) {
      return;
    }

    setState(() {
      velocity = newVelocity;

      if (velocity > highestVelocity) {
        highestVelocity = velocity;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: Speedometer(
            speed: velocity,
            speedRecord: highestVelocity,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 64),
          alignment: Alignment.bottomCenter,
          child: Text(
            'Highest speed:\n${highestVelocity.toStringAsFixed(2)} km/h',
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
