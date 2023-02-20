import 'package:flutter/material.dart';
import 'package:speel_op_veilig/pages/home.dart';
import 'package:speel_op_veilig/pages/intro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Speel op Veilig',
        theme: ThemeData(
          primaryColor: const Color.fromRGBO(87, 38, 0, 1),
          primarySwatch: const MaterialColor(0xff572600, <int, Color>{
            50: Color.fromRGBO(87, 38, 0, 1),
            100: Color.fromRGBO(87, 38, 0, 1),
            200: Color.fromRGBO(87, 38, 0, 1),
            300: Color.fromRGBO(87, 38, 0, 1),
            400: Color.fromRGBO(87, 38, 0, 1),
            500: Color.fromRGBO(87, 38, 0, 1),
            600: Color.fromRGBO(87, 38, 0, 1),
            700: Color.fromRGBO(87, 38, 0, 1),
            800: Color.fromRGBO(87, 38, 0, 1),
            900: Color.fromRGBO(87, 38, 0, 1),
          }),
        ),
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (context) => const Intro(),
          '/home': (context) => const Home(),
        });
  }
}
