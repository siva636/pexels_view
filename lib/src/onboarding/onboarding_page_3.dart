import 'package:flutter/material.dart';
import 'package:pexels_view/src/utility/constant/constant.dart';

class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/onboarding/onboarding_3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            onboardingSlogan3,
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
