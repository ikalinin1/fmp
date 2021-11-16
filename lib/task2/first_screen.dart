import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fmp/task2/routes.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("first screen"),
        ),
        body: Center(
          child: MaterialButton(
              child: const Text("Go next"),
              onPressed: () async {
                final answer =
                    await Navigator.pushNamed(context, Routes.secondScreen);
                await _showMyDialog(context, answer);
              }),
        ),
      ),
      onWillPop: () async {
        return await _showExitDialog(context) ?? false;
      },
    );
  }
}

Future<bool?> _showExitDialog(BuildContext context) async {
  return showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Do you want to exit an app?'),
      actions: <Widget>[
        MaterialButton(
          child: const Text('sure'),
          onPressed: () => Navigator.pop(ctx, true),
        ),
        MaterialButton(
          child: const Text('no way'),
          onPressed: () => Navigator.pop(ctx, false),
        ),
      ],
    ),
  );
}

Future<void> _showMyDialog(BuildContext context, Object? answer) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Returned value'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('The answer is $answer'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      );
    },
  );
}
