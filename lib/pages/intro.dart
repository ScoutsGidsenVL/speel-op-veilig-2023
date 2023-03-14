import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class Intro extends StatelessWidget {
  static const _introText = '''
Scouts en gidsen durven
tuimelen in het leven
en gaan samen op avontuur.
Risico's nemen hoort daarbij.
Blauwe plekken ook.

Als leiding neem je
samen met risico's
ook verantwoordelijkheid.

Weet wat je doet,
draag zorg
en wees voorbereid.

Kortom: speel op veilig.''';

  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
            color: MediaQuery.of(context).platformBrightness == Brightness.light
                ? const Color(0xFFFAFAFA)
                : const Color(0xFF272727)),
        const Image(
          image: AssetImage('assets/images/intro.jpg'),
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        ),
        ListView(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            children: [
              const Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Text(_introText,
                      style: TextStyle(
                          fontFamily: 'DCCAsh',
                          color: Colors.white,
                          fontSize: 26,
                          letterSpacing: 1))),
              FilledButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (_) => false);
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2.0)))),
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.secondary)),
                  child: const Text('GA VERDER')),
            ]),
      ]),
    );
  }
}
