// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:brother_store/common/widgets/images/rounded_image.dart';
import 'package:brother_store/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:brother_store/common/widgets/texts/product_title_text.dart';
import 'package:brother_store/features/shop/models/cart_item_model.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    Key? key,
    required this.cartItem,
  }) : super(key: key);
  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    bool dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        TRoundedImage(
          imageUrl: cartItem.image ?? '',
          isNetworkImage: cartItem.image != null ? true : false,
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
              TBrandTitleWithVerifiedIcon(title: cartItem.brandName ?? ''),
              Flexible(
                child: TProductTitleText(
                  title: cartItem.title,
                  maxLines: 1,
                ),
              ),

              ///Atributes

              // Row(
              //   children: [
              //     Text.rich(TextSpan(children: [
              //       TextSpan(
              //           text: 'color: ',
              //           style: Theme.of(context).textTheme.bodySmall),
              //       TextSpan(
              //           text: 'green',
              //           style: Theme.of(context).textTheme.bodyLarge),
              //     ])),
              //     const SizedBox(
              //       width: 16,
              //     ),
              //     Text.rich(TextSpan(children: [
              //       TextSpan(
              //           text: 'Size: ',
              //           style: Theme.of(context).textTheme.bodySmall),
              //       TextSpan(
              //           text: '30*20*40',
              //           style: Theme.of(context).textTheme.bodyLarge),
              //     ])),
              //   ],
              // )
            ],
          ),
        )
      ],
    );
  }
}
