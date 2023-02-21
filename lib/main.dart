import 'package:flutter/material.dart';
import 'package:speel_op_veilig/pages/home.dart';
import 'package:speel_op_veilig/pages/info/crisis.dart';
import 'package:speel_op_veilig/pages/info/veilige_activiteit.dart';
import 'package:speel_op_veilig/pages/info/verzekeringen.dart';
import 'package:speel_op_veilig/pages/info/vragen.dart';
import 'package:speel_op_veilig/pages/info/wegwijs.dart';
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
      initialRoute: '/intro',
      routes: <String, WidgetBuilder>{
        '/intro': (context) => const Intro(),
        '/': (context) => const Home(),
        '/veilige-activiteit': (context) => const VeiligeActiviteit(),
        '/verzekeringen': (context) => const Verzekeringen(),
        '/crisis': (context) => const Crisis(),
        '/vragen-en-antwoorden': (context) => const Vragen(),
        '/wegwijs': (context) => const Wegwijs(),
      },
    );
  }
}
