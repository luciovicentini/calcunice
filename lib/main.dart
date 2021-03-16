import 'package:calcunice/calculator_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final backgroundColorStart = Colors.white;
  // final backgroundColorEnd = /* Color.fromARGB(255, 210, 210, 210) */ ;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.grey[300]],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.4, 1.0],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: CalculatorView(),
            ),
          ),
        ),
      ),
    );
  }
}
