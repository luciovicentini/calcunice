import 'package:calcunice/providers.dart';
import 'package:calcunice/ui/calculator_widget.dart';
import 'package:calcunice/ui/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {

  @override
  Widget build(BuildContext context,ScopedReader watch) {
    final isLight = watch(isLightProvider).state;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: isLight ? ThemeMode.light : ThemeMode.dark,
      home: const HomeWidget(),
    );
  }
}


class HomeWidget extends ConsumerWidget {
  const HomeWidget();

  @override
  Widget build(BuildContext context,ScopedReader watch) {
    final isLight = watch(isLightProvider).state;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isLight ? Themes.lightGradientColorsList : Themes.darkGradientColorsList,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.2, 1.0],
          tileMode: TileMode.decal,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: CalculatorWidget(),
          ),
        ),
      ),
    );
  }
}