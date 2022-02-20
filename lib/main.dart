import 'package:flutter/material.dart';
import 'package:networking_examples/categories.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MaterialApp(home: Categories());
}
