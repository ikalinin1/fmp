import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fmp/task2/routes.dart';

class SecondScreen extends StatelessWidget {
  static const String _fortyTwo = '42';
  static const String _abyrvalg = 'abyrvalg';

  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second screen'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: const Text("Return: $_fortyTwo"),
              color: Colors.blueAccent,
              onPressed: () => Navigator.pop(context, _fortyTwo),
            ),
            MaterialButton(
              child: const Text("Return: $_abyrvalg"),
              color: Colors.red,
              onPressed: () => Navigator.pop(context, _abyrvalg),
            ),
          ],
        ),
      ),
    );
  }
}
