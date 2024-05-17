import 'package:brother_store/features/authontication/controllers.onboarding/onboarding_controller.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/onboarding_dot_navigation.dart';
import 'widgets/onboarding_next_button.dart';
import 'widgets/onboarding_page.dart';
import 'widgets/onboarding_skip.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Directionality(
      textDirection: Get.locale?.languageCode == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        body: Stack(children: [
          ///Horizontal scrolle pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                image: TImages.bBlack,
                title: AppLocalizations.of(context)!.onboardingTitle1,
                subTitle: AppLocalizations.of(context)!.onboardingSubtitle1,
              ),
              OnBoardingPage(
                image: TImages.bBlack,
                title: AppLocalizations.of(context)!.onboardingTitle2,
                subTitle: AppLocalizations.of(context)!.onboardingSubtitle2,
              ),
              OnBoardingPage(
                image: TImages.bBlack,
                title: AppLocalizations.of(context)!.onboardingTitle3,
                subTitle: AppLocalizations.of(context)!.onboardingSubtitle3,
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
      ),
    );
  }
}
