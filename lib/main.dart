import 'package:flutter/material.dart';
import 'package:isolate_lesson/fibonacci.dart';
import 'package:isolate_lesson/kvadrat.dart';
import 'package:isolate_lesson/numbers.dart';
import 'package:isolate_lesson/reverse.dart';
import 'package:isolate_lesson/unique_number.dart';

void main() async {
  final sum = await calculateSum([1, 2, 3, 4, 5]);

  final strR = await reverseIsolate("Flutter");

  final fibonacci = await fibonacciIsolate(40);

  final kvadrat = await calculateKvadrat([1, 2, 3, 4, 5]);

  final uniqueNumber = await uniqueNumberIsolate([1, 2, 3, 4, 5, 4, 3, 2, 1]);

  runApp(
    MainApp(
      sum: sum,
      strR: strR,
      fibonacci: fibonacci,
      kvadrat: kvadrat,
      uniqueNumber: uniqueNumber,
    ),
  );
}

class MainApp extends StatelessWidget {
  final int sum;
  final String strR;
  final int fibonacci;
  final List<int> kvadrat;
  final List<int> uniqueNumber;

  const MainApp({
    super.key,
    required this.sum,
    required this.strR,
    required this.fibonacci,
    required this.kvadrat,
    required this.uniqueNumber,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(sum.toString()),
              Text(strR.toString()),
              Text(fibonacci.toString()),
              Text(kvadrat.toString()),
              Text(uniqueNumber.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
