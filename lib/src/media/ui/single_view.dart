import 'package:flutter/material.dart';
import 'package:pexels_view/src/media/model/photo.dart';

class SingleView extends StatelessWidget {
  final Photo photo;
  const SingleView(this.photo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Hero(
            tag: photo.id,
            child: Image.network(
              photo.large2xUrl,
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
