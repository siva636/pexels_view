import 'package:flutter/material.dart';
import 'package:pexels_view/src/search/search.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pexels View',
      theme: ThemeData(),
      home: const Search(),
    );
  }
}
