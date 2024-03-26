import 'dart:async';

import 'package:flutter/material.dart';

import 'custom_counter_indicater.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double value = 0;

  void increaseValue() {
    setState(() {
      value = ((value + 1) % 100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPercentIndicator(
              width: 140,
              height: 70,
              reverse: false,
              borderRadius: 12,
              shadowWidth: 6,
              startAngle: StartAngle.bottomRight,
              progressWidth: 8,
              shadowColor: Colors.grey.withOpacity(.2),
              progressColor: Colors.orange,
              progress: value / 100,
              child: Center(
                  child: Text(
                "$value / 100",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => increaseValue(),
              child: const Text('Increase value'),
            )
          ],
        ),
      ),
    );
  }
}
