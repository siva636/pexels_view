import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:pexels_view/src/constants/constants.dart';
import 'package:pexels_view/src/models/photo.dart';

String key = dotenv.env['key']!;

class SearchService {
  Future<List<Photo>> fetchPhotos(String query) async {
    final response = await http.get(
      Uri.parse('${photosBaseUrl}search?query=$query'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $key',
      },
    );
    if (response.statusCode == 200) {
      List photos = jsonDecode(response.body)['photos'];
      return photos
          .map(
            (photo) => Photo.fromJson(photo),
          )
          .toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }
}
