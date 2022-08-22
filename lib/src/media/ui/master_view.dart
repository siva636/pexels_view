import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pexels_view/src/media/bloc/media_bloc.dart';
import 'package:pexels_view/src/media/model/photo.dart';
import 'package:pexels_view/src/media/ui/empty.dart';
import 'package:pexels_view/src/utility/enum/view_state.dart';
import 'package:pexels_view/src/ux/loading/loading.dart';
import 'package:pexels_view/src/ux/error/error.dart';

class MasterView extends StatefulWidget {
  MasterView({Key? key}) : super(key: key);

  @override
  State<MasterView> createState() => _MasterViewState();
}

class _MasterViewState extends State<MasterView> {
  late MediaBloc mediaBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mediaBloc = context.watch<MediaBloc>();
    List<Photo> searchResults = mediaBloc.state.searchResults;

    if (mediaBloc.state.viewState == ViewState.busy) {
      return const Loading();
    }
    if (mediaBloc.state.viewState == ViewState.error) {
      return const Error();
    }

    if (mediaBloc.state.viewState == ViewState.idle &&
        mediaBloc.state.searchResults.isEmpty) {
      return const Empty();
    }

    return Scaffold(
      appBar: AppBar(),
      body: GridView.count(
        crossAxisCount: 2,
        children: mediaBloc.state.searchResults
            .map(
              (e) => Image(
                image: NetworkImage(e.mediumUrl),
              ),
            )
            .toList(),
      ),
    );
  }
}
