import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pexels_view/src/app.dart';
import 'package:pexels_view/src/models/search_model.dart';
import 'package:pexels_view/src/services/search_service.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: '.env');

  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (context) => SearchService(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchModel(context.read<SearchService>()),
        ),
      ],
      child: const App(),
    ),
  );
}
