import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:brother_store/common/widgets/list_tiles/setting_menu_tile.dart';
import 'package:brother_store/features/general/controllers/brother_controller.dart';
import 'package:brother_store/features/personlization/screens/settings/terms.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'widgets/social_media_widget.dart';

class BrotherScreen extends StatelessWidget {
  const BrotherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final isEg = Get.locale?.languageCode == 'en';
    final controller = BrothersController.instance;
    final brotherData = controller.allData;
    return Directionality(
      textDirection: Get.locale?.languageCode == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              TPrimaryHeaderContainer(
                child: Column(
                  children: [
                    const SizedBox(
                      height: TSizes.spaceBtWsections,
                    ),
                    TAppBar(
                      centerTitle: true,
                      title: Row(
                        children: [
                          Image(
                            image: AssetImage(Get.locale?.languageCode == 'en'
                                ? TImages.wordWhite
                                : TImages.arWord),
                            width: 125,
                            height: 50,
                            //color: TColors.primary,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtWsections,
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                child: Column(
                  children: [
                    // TRoundedContainer(
                    //     showBorder: true,
                    //     padding: const EdgeInsets.all(TSizes.md),
                    //     backgroundColor: dark ? TColors.dark : TColors.light,
                    //     child: ListTile(
                    //       onTap: () {},
                    //       leading: Icon(
                    //         Icons.info_outlined,
                    //         size: 35,
                    //         color: controller.color,
                    //       ),
                    //       title: Text(
                    //         AppLocalizations.of(context)!.aboutUs,
                    //         style: Theme.of(context).textTheme.titleMedium,
                    //       ),
                    //       subtitle: Text(isEg
                    //           ? controller.allData[0].aboutUs
                    //           : controller.allData[0].arabicAboutUs),
                    //     )),
                    // const SizedBox(
                    //   height: TSizes.spaceBtWItems,
                    // ),
                    TSettingMenuTile(
                      onTap: () => Get.to(() => TermsScreen(
                            data: isEg
                                ? brotherData[0].termsCondition
                                : brotherData[0].arabicTermsCondition,
                            title: AppLocalizations.of(context)!.termsCondition,
                          )),
                      icon: Icons.terminal,
                      iconColor: controller.color,
                      title: AppLocalizations.of(context)!.termsCondition,
                      subTitle: AppLocalizations.of(context)!.termsCondition,
                    ),
                    TSettingMenuTile(
                      onTap: () => Get.to(() => TermsScreen(
                            data: isEg
                                ? brotherData[0].privacyPolicy
                                : brotherData[0].arabicPrivacyPolicy,
                            title: AppLocalizations.of(context)!.privacyPolicy,
                          )),
                      icon: Icons.security,
                      iconColor: controller.color,
                      title: AppLocalizations.of(context)!.privacyPolicy,
                      subTitle: AppLocalizations.of(context)!.privacyPolicy,
                    ),
                    TSettingMenuTile(
                      onTap: () => Get.to(() => TermsScreen(
                            data: isEg
                                ? brotherData[0].returnPolicy
                                : brotherData[0].arabicReturnPolicy,
                            title: AppLocalizations.of(context)!.returnPolicy,
                          )),
                      icon: Icons.all_inclusive,
                      iconColor: controller.color,
                      title: AppLocalizations.of(context)!.returnPolicy,
                      subTitle: AppLocalizations.of(context)!.returnPolicy,
                    ),
                    TSettingMenuTile(
                      onTap: () => Get.to(() => TermsScreen(
                            data: isEg
                                ? brotherData[0].cancellationPolicy
                                : brotherData[0].arabicCancellationPolicy,
                            title: AppLocalizations.of(context)!.cancelPolicy,
                          )),
                      icon: Icons.cancel_schedule_send_rounded,
                      iconColor: controller.color,
                      title: AppLocalizations.of(context)!.cancelPolicy,
                      subTitle: AppLocalizations.of(context)!.cancelPolicy,
                    ),
                    TSettingMenuTile(
                      onTap: () => Get.to(() => TermsScreen(
                            data: isEg
                                ? brotherData[0].aboutUs
                                : brotherData[0].arabicAboutUs,
                            title: AppLocalizations.of(context)!.aboutUs,
                          )),
                      icon: Icons.info_outlined,
                      iconColor: controller.color,
                      title: AppLocalizations.of(context)!.aboutUs,
                      subTitle: AppLocalizations.of(context)!.aboutUs,
                    ),
                    const Divider(),
                    ListTile(
                        onTap: () {},
                        leading: Icon(
                          Icons.call,
                          //size: 35,
                          color: controller.color,
                        ),
                        title: Text(
                          AppLocalizations.of(context)!.phoneNumber,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        subtitle: SizedBox(
                          child: ListView.separated(
                              separatorBuilder: (_, __) => const Column(
                                    children: [
                                      SizedBox(
                                        height: TSizes.spaceBtWsections / 2,
                                      ),
                                    ],
                                  ),
                              shrinkWrap: true,
                              itemCount:
                                  controller.allData[0].phoneNumbers.length,
                              itemBuilder: (_, index) {
                                final phone =
                                    controller.allData[0].phoneNumbers[index];
                                return GestureDetector(
                                    onTap: () =>
                                        launchUrlString("tel://$phone"),
                                    child: Text(phone));
                              }),
                        )),
                    const SizedBox(
                      height: TSizes.spaceBtWItems,
                    ),
                    const SocialMediaVertical(),
                    const SizedBox(
                      height: TSizes.spaceBtWsections,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtWsections,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
