import 'package:flutter/material.dart';
import 'package:pexels_view/src/utility/constant/constant.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/onboarding/onboarding_2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            onboardingSlogan2,
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
