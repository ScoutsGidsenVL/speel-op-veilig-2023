import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speel_op_veilig/widgets/section.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  List _chapters = [];
  final _infoPages = {
    '/veilige-activiteit': 'Veilige activiteit',
    '/verzekeringen': 'Verzekeringen en aansprakelijkheid',
    '/crisis': 'Crisis en noodsituaties',
    '/vragen-en-antwoorden': 'Vragen en Antwoorden',
    '/wegwijs': 'Wegwijs',
  }.entries.toList();

  @override
  initState() {
    super.initState();
    rootBundle.loadString('assets/data.json').then((source) async {
      final data = await json.decode(source);
      setState(() {
        _chapters = data["chapters"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Speel op Veilig')),
      body: ListView(
        padding: const EdgeInsets.all(25),
        children: [
          Section(title: 'Thema\'s', children: [
            _chapters.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: _chapters.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(_chapters[index]["title"]),
                        ),
                      );
                    },
                  )
                : const Center(child: CircularProgressIndicator()),
          ]),
          Section(title: 'Bijkomende info', children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: _infoPages.length,
              itemBuilder: (context, index) {
                return Card(
                    child: InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, _infoPages[index].key),
                  child: ListTile(
                    title: Text(_infoPages[index].value),
                  ),
                ));
              },
            ),
          ]),
        ],
      ),
    );
  }
}
