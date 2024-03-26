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
  int value = 0;
  final int totalVal = 26;
  void increaseValue() {
    setState(() {
      value = int.tryParse(((value + 1) % (totalVal + 1)).toString()) ?? 0;
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
              width: 180,
              height: 70,
              reverse: false,
              borderRadius: 12,
              shadowWidth: 6,
              startAngle: StartAngle.bottomRight,
              progressWidth: 8,
              shadowColor: Colors.grey.withOpacity(.2),
              progressColor: Colors.orange,
              progress: value / totalVal,
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$value",
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  const Text(
                    " / ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.grey),
                  ),
                  Text(
                    "$totalVal",
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey),
                  ),
                ],
              )),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
              ),
              onPressed: () => increaseValue(),
              child: const Text(
                'Increase value',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
