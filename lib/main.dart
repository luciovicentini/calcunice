import 'package:calcunice/ui/horizontal_calculator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:calcunice/providers.dart';
import 'package:calcunice/ui/vertical_calculator_widget.dart';
import 'package:calcunice/ui/themes.dart';

void main() {
  // TODO(Lucho): utilizar resultado de la ultima expression (en caso de que haya) si el usuario presiona algun boton de operacion matematica
  // TODO(Lucho): resolver que se muestre primero el resultado de la expression y luego la expression en el listado de calculos.
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    final isLight = watch(isLightProvider).state;
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: isLight ? ThemeMode.light : ThemeMode.dark,
      home: const _HomeWidget(),
      // home: ScreenSize(),
    );
  }
}

class ScreenSize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Text('Height: ${media.height} - Width: ${media.width}'),
      ),
    );
  }
}

class _HomeWidget extends ConsumerWidget {
  const _HomeWidget();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final size = MediaQuery.of(context).size;
    final isLight = watch(isLightProvider).state;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isLight ? lightGradientColorsList : darkGradientColorsList,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.2, 1.0],
          tileMode: TileMode.decal,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: size.height > size.width
                ? const VerticalCalculatorWidget()
                : const HorizontalCalculatorWidget(),
          ),
        ),
      ),
    );
  }
}
