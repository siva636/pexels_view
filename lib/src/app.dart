import 'package:flutter/material.dart';
import 'package:pexels_view/src/search/search.dart';
import 'constants/constants.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(),
      home: const Search(),
    );
  }
}
