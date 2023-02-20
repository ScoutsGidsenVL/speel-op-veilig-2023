import 'package:flutter/material.dart';

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Speel op veilig')),
      body: ListView(
        children: const [Text('Lorem ipsum')],
      ),
    );
  }
}
