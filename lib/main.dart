import 'package:flutter/material.dart';

import 'views/floating_stopwatch_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Floating Stopwatch',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          color: Colors.green[50]
        )
      ),
      home: const FloatingStopwatchView(),
    );
  }
}
