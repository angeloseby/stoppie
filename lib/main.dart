import 'package:flutter/material.dart';
import 'package:stoppie/stopwatch_screen.dart';
import 'package:provider/provider.dart';
import 'package:stoppie/timer_provider.dart';

void main() {
  Paint.enableDithering = true;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
          create: (context) => TimerProvider(), child: const StopwatchScreen()),
    );
  }
}
