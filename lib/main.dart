import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grably',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LinksRollPage(title: 'Grably app'),
    );
  }
}

class LinksRollPage extends StatefulWidget {
  const LinksRollPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LinksRollPage> createState() => _LinksRollPageState();
}

class _LinksRollPageState extends State<LinksRollPage> {
  List<_Link> links = [
    _Link('Google', 'https://google.com'),
    _Link('Yandex', 'https://yandex.ru')
  ];

  void _addLink() {
    setState(() {
      links.add(_Link('Link', 'https://grably.app'));
    });
  }

  List<Widget> _links() {
    return links
        .map((link) => SizedBox(
              height: 50,
              child: Row(
                children: <Widget>[
                  _LinkWidget.name(link),
                ],
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: _links(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addLink,
        tooltip: 'Add new link',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _LinkWidget extends StatelessWidget {
  final _Link _link;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Card(
        child: ListTile(
          leading: SizedBox(
            width: 100,
            child: Row(
              children: <Widget>[
                const Icon(Icons.link),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(_link.title),
                  ),
                ),
              ],
            ),
          ),
          title: InkWell(
            onTap: () => _launchURL(_link),
            child: Text(
              _link.url,
              style: const TextStyle(color: Colors.blue),
            ),
          ),
          // ToDo: Implement tags via https://pub.dev/packages/flutter_tags
        ),
      ),
    );
  }

  const _LinkWidget.name(this._link);
}

_launchURL(_Link link) async {
  final String url = link.url;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class _Link {
  final String title;
  final String url;
  List<String> tags = [];

  _Link(this.title, this.url);
}
