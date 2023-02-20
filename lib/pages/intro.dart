import 'package:flutter/material.dart';

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/intro.jpg'),
                fit: BoxFit.cover)),
        child: ListView(padding: const EdgeInsets.all(20), children: [
          const Text('''
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

Kortom: speel op veilig.
        ''',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(blurRadius: 2)])),
          FilledButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (_) => false);
              },
              child: const Text('Ga verder')),
        ]),
      ),
    );
  }
}
