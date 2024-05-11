import 'package:brother_store/common/widgets/texts/product_price_text.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'add_remove_button.dart';
import 'cart_item_widget.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemoveButtons = true});
  final bool showAddRemoveButtons;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(
        height: TSizes.spaceBtWsections,
      ),
      itemCount: 3,
      itemBuilder: (_, index) => Column(
        children: [
          const TCartItem(),
          if (showAddRemoveButtons)
            const SizedBox(
              height: TSizes.spaceBtWItems,
            ),
          //--add & remove buttons
          if (showAddRemoveButtons)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 70,
                    ),
                    TProductQuantityWithAddRemoveButtons(),
                  ],
                ),
                TProductPriceText(price: '239')
              ],
            ),
        ],
      ),
    );
  }
}
