import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:brother_store/common/widgets/texts/section_heading.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BrotherScreen extends StatelessWidget {
  const BrotherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final controller = BrandController.instance;
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
                          Text(
                            'Brother Creative',
                            style: Theme.of(context).textTheme.headlineMedium,
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
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    TSectionHeading(
                        showActionButton: false,
                        title: AppLocalizations.of(context)!.aboutUs),
                    TSectionHeading(
                        showActionButton: false,
                        title: AppLocalizations.of(context)!.phoneNumber),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
