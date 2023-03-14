import 'package:flutter/material.dart';
import 'package:speel_op_veilig/model/dynamic_data.dart';
import 'package:speel_op_veilig/pages/home.dart';
import 'package:speel_op_veilig/pages/static.dart';
import 'package:speel_op_veilig/pages/vragen.dart';
import 'package:speel_op_veilig/pages/wegwijs.dart';
import 'package:speel_op_veilig/pages/intro.dart';
import 'package:speel_op_veilig/pages/thema.dart';
import 'package:provider/provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Future.delayed(const Duration(milliseconds: 400)).then((_) {
    FlutterNativeSplash.remove();
  });
  runApp(const MyApp());
}

const primary = Color.fromRGBO(87, 38, 0, 1);
const secondary = Color.fromRGBO(116, 141, 38, 1);

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DynamicData(),
      child: MaterialApp(
        title: 'Speel op Veilig',
        theme: ThemeData(
            colorScheme:
                const ColorScheme.light(primary: primary, secondary: secondary),
            textTheme: const TextTheme(
              titleLarge: TextStyle(
                  fontFamily: "DCCAsh", fontSize: 26, letterSpacing: 1),
              headlineLarge:
                  TextStyle(fontFamily: "DCCAsh", fontSize: 28, color: primary),
              headlineMedium: TextStyle(
                  fontFamily: "DCCAsh", fontSize: 24, color: secondary),
              headlineSmall: TextStyle(
                  fontSize: 18, color: primary, fontWeight: FontWeight.bold),
              bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              bodyMedium: TextStyle(fontSize: 18),
            )),
        initialRoute: '/intro',
        routes: <String, WidgetBuilder>{
          '/intro': (context) => const Intro(),
          '/': (context) => Home(),
          '/veilige-activiteit': (context) => const Static(
              path: 'veilige_activiteit', title: 'Een veilige activiteit'),
          '/verzekeringen': (context) => const Static(
              path: 'verzekeringen',
              title: 'Verzekeringen en aansprakelijkheid'),
          '/crisis': (context) =>
              const Static(path: 'crisis', title: 'Crisis-en-noodsituaties'),
          '/vragen-en-antwoorden': (context) => const Vragen(),
          '/wegwijs': (context) =>
              const Wegwijs(path: 'wegwijs', title: 'Wegwijs in deze app'),
          '/vuur': (context) => const Thema(name: 'vuur'),
          '/water': (context) => const Thema(name: 'water'),
          '/hoogte': (context) => const Thema(name: 'hoogte'),
          '/materiaal': (context) => const Thema(name: 'materiaal'),
          '/verkeer': (context) => const Thema(name: 'verkeer'),
          '/drugs-tabak-en-alcohol': (context) =>
              const Thema(name: 'drugs-tabak-en-alcohol'),
          '/welzijn': (context) => const Thema(name: 'welzijn'),
        },
      ),
    );
  }
}
