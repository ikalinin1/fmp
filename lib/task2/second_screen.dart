import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fmp/task1/dimensions.dart';
import 'package:fmp/task2/routes.dart';
import 'package:http/http.dart' as http;

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  static final Uri _apiUrl =
      Uri.parse('https://jsonplaceholder.typicode.com/posts');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second screen'),
      ),
      body: Center(
        child: FutureBuilder(
          future: http.get(_apiUrl),
          builder:
              (BuildContext context, AsyncSnapshot<http.Response> snapshot) {
            if (!(snapshot.connectionState == ConnectionState.done)) {
              return const CircularProgressIndicator();
            }

            return ListView(
              children: _toMessagesList(snapshot.data),
            );
          },
        ),
      ),
    );
  }

  List<Widget> _toMessagesList(http.Response? response) {
    final responseBody = response?.body ?? '[]';
    var messages = jsonDecode(responseBody) as List;
    return messages
        .map((e) => _Message.fromJson(e))
        .map((m) => _MessageWidget(m))
        .toList();
  }
}

class _MessageWidget extends StatelessWidget {
  final _Message message;

  const _MessageWidget(this.message, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          leading: SizedBox(
            width: Dimensions.cardWidth,
            child: Row(
              children: <Widget>[
                const Icon(Icons.villa),
                Padding(
                  padding: Dimensions.defaultInsets,
                  child: Text(message.id.toString()),
                ),
              ],
            ),
          ),
          title: InkWell(
            onTap: () => Navigator.pop(context, message.body),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Text(
                message.body,
                style: const TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ),
    );
  }
}

class _Message {
  final int id;
  final int userId;
  final String title;
  final String body;

  _Message(this.id, this.userId, this.title, this.body);

  _Message.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userId = json['userId'],
        title = json['title'],
        body = json['body'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'userId': userId, 'title': title, 'body': body};
}
