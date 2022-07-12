import 'package:flutter/material.dart';
import 'package:pexels_view/src/enums/view_state.dart';
import 'package:pexels_view/src/models/core_model.dart';
import 'package:pexels_view/src/models/photo.dart';
import 'package:pexels_view/src/services/search_service.dart';

class SearchModel extends ChangeNotifier with CoreModel {
  SearchService searchService;
  List<Photo> searchResults = [];

  SearchModel(this.searchService);

  fetchPhotos(String query) async {
    try {
      viewState = ViewState.busy;
      notifyListeners();
      List<Photo> photos = await searchService.fetchPhotos(query);
      searchResults.addAll(photos);
      viewState = ViewState.idle;
      notifyListeners();
    } catch (e) {
      viewState = ViewState.error;
      notifyListeners();
    }
  }
}
