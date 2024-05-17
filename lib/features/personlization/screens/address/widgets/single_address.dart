// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import 'package:brother_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({
    Key? key,
    required this.selectedAddress,
  }) : super(key: key);
  final bool selectedAddress;
  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      padding: const EdgeInsets.all(TSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress
          ? TColors.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : THelperFunctions.isDarkMode(context)
              ? TColors.darkerGray
              : TColors.grey,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtWItems),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: Get.locale?.languageCode == 'en' ? 5 : null,
            left: Get.locale?.languageCode == 'en' ? null : 5,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? THelperFunctions.isDarkMode(context)
                      ? TColors.light
                      : TColors.dark
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Company address',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: TSizes.sm / 2,
              ),
              const Text(
                '(+345) 5343 133434',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: TSizes.sm / 2,
              ),
              const Text(
                'Esse nostrud consectetur cupidatat ad in anim magna esse aliqua aute excepteur.',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}
