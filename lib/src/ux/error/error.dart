import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  const Error({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gutter = getBreakpointEntry(context).gutter;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(gutter),
          child: const SizedBox(
            width: 500,
            child: ListTile(
              title: Text('Error'),
              subtitle: Text(
                'Check your network connection. If your network connection is stable and still you get this message means, the Pexels API request rate has been exceeded. Please try again latter.',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
