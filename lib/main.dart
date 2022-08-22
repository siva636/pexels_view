import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pexels_view/src/app.dart';
import 'package:pexels_view/src/media/bloc/media_bloc.dart';
import 'package:pexels_view/src/media/repository/media_repository.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(RepositoryProvider(
    create: (context) => MediaRepository(),
    child: BlocProvider(
      create: (context) => MediaBloc(
        context.read<MediaRepository>(),
      ),
      child: const App(),
    ),
  ));
}
