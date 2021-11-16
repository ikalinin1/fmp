import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fmp/task2/routes.dart';
import 'package:fmp/task2/second_screen.dart';

import 'first_screen.dart';

class Task2 extends StatelessWidget {
  const Task2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.firstScreen,
      title: 'Grably',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        Routes.firstScreen: (context) => const FirstScreen(),
        Routes.secondScreen: (context) => const SecondScreen()
      },
      home: const FirstScreen(),
    );
  }
}

