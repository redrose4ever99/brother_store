// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:brother_store/common/widgets/product.cart/favorite_icon.dart';
import 'package:brother_store/common/widgets/product.cart/save_for_later_icon.dart';
import 'package:brother_store/common/widgets/texts/product_price_text.dart';
import 'package:brother_store/features/shop/controllers/product/cart_controller.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

import 'package:brother_store/common/widgets/images/rounded_image.dart';
import 'package:brother_store/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:brother_store/common/widgets/texts/product_title_text.dart';
import 'package:brother_store/features/shop/models/cart_item_model.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';

import 'add_remove_button.dart';

class TCartItem extends StatelessWidget {
  const TCartItem(
      {Key? key, required this.cartItem, this.showAddRemoveButtons = false})
      : super(key: key);
  final CartItemModel cartItem;
  final bool? showAddRemoveButtons;
  @override
  Widget build(BuildContext context) {
    bool dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        TRoundedImage(
          borderRaduis: BorderRadius.circular(20),
          imageUrl: cartItem.image ?? TImages.bBlack,

          isNetworkImage: cartItem.image != null ? true : false,
          fit: BoxFit.cover,
          backgroundColor: dark ? TColors.darkerGray : TColors.light,
          // border: Border.all(color: TColors.primary),
          width: 100,
          height: 120,
          padding: const EdgeInsets.all(0),
        ),
        const SizedBox(
          width: TSizes.spaceBtWItems,
        ),
        Expanded(
          child: SizedBox(
            height: 120,
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
                // TSaveForLaterIcon(productId: cartItem.productId),
                if (showAddRemoveButtons!) const Spacer(),
                if (showAddRemoveButtons!)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          //
                          // // ),
                          TProductQuantityWithAddRemoveButtons(
                            quantity: cartItem.quantity,
                            add: () =>
                                CartController.instance.addOneToCart(cartItem),
                            remove: () => CartController.instance
                                .removeOneFromCart(cartItem),
                          ),
                        ],
                      ),
                      TProductPriceText(
                          color: TColors.black,
                          isLarg: true,
                          price: (cartItem.price * cartItem.quantity)
                              .toStringAsFixed(1))
                    ],
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
          ),
        )
      ],
    );
  }
}
