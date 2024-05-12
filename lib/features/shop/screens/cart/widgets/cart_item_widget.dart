import 'package:brother_store/common/widgets/images/rounded_image.dart';
import 'package:brother_store/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:brother_store/common/widgets/texts/product_title_text.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        TRoundedImage(
          imageUrl: TImages.productImg1,
          backgroundColor: dark ? TColors.darkerGray : TColors.light,
          // border: Border.all(color: TColors.primary),
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
        ),
        const SizedBox(
          width: TSizes.spaceBtWItems,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBrandTitleWithVerifiedIcon(title: 'Amazone'),
              Flexible(
                child: TProductTitleText(
                  title: AppLocalizations.of(context)!.woodChair,
                  maxLines: 1,
                ),
              ),

              ///Atributes

              Row(
                children: [
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: 'color: ',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: 'green',
                        style: Theme.of(context).textTheme.bodyLarge),
                  ])),
                  const SizedBox(
                    width: 16,
                  ),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: 'Size: ',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: '30*20*40',
                        style: Theme.of(context).textTheme.bodyLarge),
                  ])),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
