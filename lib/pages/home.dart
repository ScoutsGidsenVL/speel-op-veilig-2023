import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();

  @override
  Widget build(BuildContext context) {
    const headerStyle = TextStyle(fontSize: 20);

    return Scaffold(
        appBar: AppBar(title: const Text('Speel op Veilig')),
        body: ListView(
          children: [
            Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Thema\'s', style: headerStyle),
                      Text('Verwittig de hulpdiensten niet zelf!',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 118, 118, 118))),
                      Text(
                          '\nZit je met iets? Voel je je onveilig? Wil je een bezorgdheid delen? Bel dan het noodnummer: 0474 26 14 01\n\n \u2022 Kleine ongelukjes: Rode kruis in gebouw 39\n \u2022 Nood en ramp: 0474 26 14 01',
                          style: TextStyle(height: 1.2)),
                    ])),
          ],
        ));
  }
}

class HomeState extends State<Home> {
  List _chapters = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    setState(() {
      _chapters = data["chapters"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Speel op Veilig')),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: readJson,
              child: const Text('Load Data'),
            ),

            // Display the data loaded from sample.json
            _chapters.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: _chapters.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            title: Text(_chapters[index]["title"]),
                          ),
                        );
                      },
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
