import 'package:brother_store/features/authontication/controllers.onboarding/onboarding_controller.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/onboarding_dot_navigation.dart';
import 'widgets/onboarding_next_button.dart';
import 'widgets/onboarding_page.dart';
import 'widgets/onboarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(children: [
        ///Horizontal scrolle pages
        PageView(
          controller: controller.pageController,
          onPageChanged: controller.updatePageIndicator,
          children: const [
            OnBoardingPage(
              image: TImages.onBoarding1,
              title: TTexts.onBoardingTitle1,
              subTitle: TTexts.onBoardingSubTitle1,
            ),
            OnBoardingPage(
              image: TImages.onBoarding2,
              title: TTexts.onBoardingTitle2,
              subTitle: TTexts.onBoardingSubTitle1,
            ),
            OnBoardingPage(
              image: TImages.onBoarding3,
              title: TTexts.onBoardingTitle3,
              subTitle: TTexts.onBoardingSubTitle1,
            )
          ],
        ),

        ///skip button
        const OnBoardingSkip(),

        ///dot navigation indicator
        const OnBoardingDotNavigation(),

        /// button circuler

        const OnBoardingNextButton()
      ]),
    );
  }
}
