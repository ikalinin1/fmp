import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'links_roll.dart';

class Task1 extends StatelessWidget {
  const Task1({Key? key}) : super(key: key);

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

