import 'package:flutter/material.dart';
import 'package:pexels_view/src/models/core_model.dart';
import 'package:pexels_view/src/models/photo.dart';
import 'package:pexels_view/src/services/search_service.dart';

class SearchModel extends ChangeNotifier with CoreModel {
  SearchService searchService;
  List<Photo> searchResults = [];

  SearchModel(this.searchService);

  fetchPhotos(String query) async {
    loading = true;
    List<Photo> photos = await searchService.fetchPhotos(query);
    loading = false;
    searchResults.addAll(photos);
    notifyListeners();
  }
}
