import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  const Error({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: ListTile(
          leading: Icon(Icons.error),
          title: Text('Error'),
          subtitle: Text(
            'Check your network connection. If your network connection is stable and still you get this message means, the Pexels API request rate has been exceeded. Please try again latter.',
          ),
        ),
      ),
    );
  }
}
