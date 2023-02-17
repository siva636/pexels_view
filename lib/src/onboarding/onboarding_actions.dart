import 'package:flutter/material.dart';
import 'package:pexels_view/src/media/ui/search.dart';
import 'package:pexels_view/src/utility/constant/constant.dart';

class OnboardingActions extends StatelessWidget {
  const OnboardingActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: contentPadding),
        FilledButton(
          style: FilledButton.styleFrom(
            fixedSize: const Size(200, 50),
          ),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => const Search()),
              (route) => false,
            );
          },
          child: const Text('Getting started'),
        ),
        const SizedBox(height: contentPadding),
        // This feature not available yet
        // FilledButton(
        //   style: FilledButton.styleFrom(
        //     fixedSize: const Size(200, 50),
        //   ),
        //   onPressed: () {},
        //   child: const Text('Account'),
        // ),
        // const SizedBox(height: contentPadding),
      ],
    );
  }
}
