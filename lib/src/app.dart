import 'package:flutter/material.dart';
import 'package:pexels_view/src/media/ui/search.dart';
import 'package:pexels_view/src/utility/constant/constant.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
          brightness: Brightness.dark,
          error: Colors.red,
        ),
      ),
      home: const Search(),
    );
  }
}
