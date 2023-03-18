import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:pexels_view/src/media/model/items_page.dart';
import 'package:pexels_view/src/utility/constant/constant.dart';
import 'package:pexels_view/src/media/model/photo.dart';

String key = dotenv.env['key']!;

class MediaRepository {
  Future<Photo> fetchItem(int id) async {
    final response = await http.get(
      Uri.parse('${photosBaseUrl}photos/$id'),
      headers: {
        HttpHeaders.authorizationHeader: key,
      },
    );
    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);
      return Photo.fromJson(res);
    } else {
      throw Exception('Failed to load photo');
    }
  }

  Future<ItemsPage<Photo>> fetchPage(
      {required int pageNumber, required String query}) async {
    final response = await http.get(
      Uri.parse(
          '${photosBaseUrl}search?query=$query&page=$pageNumber&per_page=$itemsPerPage'),
      headers: {
        HttpHeaders.authorizationHeader: key,
      },
    );
    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);
      List photos = res['photos'];
      int totalResults = res['total_results'];
      int pageNumber = res['page'];
      bool hasNext = res['next_page'] != null;
      List<Photo> processedPhotos = photos
          .map(
            (photo) => Photo.fromJson(photo),
          )
          .toList();
      return ItemsPage(
          totalResults: totalResults,
          pageNumber: pageNumber,
          items: processedPhotos,
          hasNext: hasNext);
    } else {
      throw Exception('Failed to load photos');
    }
  }
}
