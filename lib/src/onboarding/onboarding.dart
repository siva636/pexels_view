import 'package:flutter/material.dart';
import 'package:pexels_view/src/onboarding/onboarding_actions.dart';
import 'package:pexels_view/src/onboarding/onboarding_page_1.dart';
import 'package:pexels_view/src/onboarding/onboarding_page_2.dart';
import 'package:pexels_view/src/onboarding/onboarding_page_3.dart';
import 'package:pexels_view/src/onboarding/page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  late int currentPage;
  late PageController pageController;
  late List<Widget> onboardingPages;

  @override
  void initState() {
    super.initState();
    currentPage = 1;
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    onboardingPages = [
      const OnboardingPage1(),
      const OnboardingPage2(),
      const OnboardingPage3(),
    ];
    return Scaffold(
        body: SafeArea(
          child: Center(
            child: PageView(
              onPageChanged: (value) => setState(() {
                currentPage = value + 1;
              }),
              controller: pageController,
              children: onboardingPages,
            ),
          ),
        ),
        persistentFooterButtons: [
          ColoredBox(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Column(
              children: [
                const OnboardingActions(),
                PageIndicator(currentPage),
              ],
            ),
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.primaryContainer);
  }
}
