import 'package:flutter/material.dart';
import 'package:pexels_view/src/loading/loading.dart';
import 'package:pexels_view/src/error/error.dart';
import 'package:pexels_view/src/enums/view_state.dart';
import 'package:pexels_view/src/models/photo.dart';
import 'package:pexels_view/src/models/search_model.dart';
import 'package:provider/provider.dart';

class MasterView extends StatefulWidget {
  MasterView({Key? key}) : super(key: key);

  @override
  State<MasterView> createState() => _MasterViewState();
}

class _MasterViewState extends State<MasterView> {
  late SearchModel searchModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    searchModel = context.watch<SearchModel>();
    List<Photo> searchResults = searchModel.searchResults;

    if (searchModel.viewState == ViewState.busy) {
      return const Loading();
    }
    if (searchModel.viewState == ViewState.error) {
      return const Error();
    }

    // if (searchModel.viewState == ViewState.idle) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.count(
        crossAxisCount: 2,
        children: searchModel.searchResults
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
