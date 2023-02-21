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

const primary = Color.fromRGBO(87, 38, 0, 1);
const secondary = Color.fromRGBO(116, 141, 38, 1);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Speel op Veilig',
      theme: ThemeData(
          colorScheme:
              const ColorScheme.light(primary: primary, secondary: secondary),
          textTheme: const TextTheme(
            titleLarge:
                TextStyle(fontFamily: "DCCAsh", fontSize: 24, letterSpacing: 1),
            bodyMedium: TextStyle(fontSize: 14),
            bodySmall: TextStyle(fontSize: 14),
            headlineLarge:
                TextStyle(fontFamily: "DCCAsh", fontSize: 24, color: primary),
            headlineMedium:
                TextStyle(fontFamily: "DCCAsh", fontSize: 18, color: secondary),
          )),
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
