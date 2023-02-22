import 'package:flutter/material.dart';

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
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/intro.jpg'),
                    fit: BoxFit.cover))),
        Container(color: const Color.fromRGBO(0, 0, 0, 0.2)),
        ListView(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            children: [
              const Text(_introText,
                  style: TextStyle(
                      fontFamily: 'DCCAsh',
                      color: Colors.white,
                      fontSize: 26,
                      letterSpacing: 1)),
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
