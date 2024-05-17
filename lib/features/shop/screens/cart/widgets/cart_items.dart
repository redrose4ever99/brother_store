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
      separatorBuilder: (_, __) => const Column(
        children: [
          SizedBox(
            height: TSizes.spaceBtWsections / 2,
          ),
          Divider(),
          SizedBox(
            height: TSizes.spaceBtWsections / 2,
          ),
        ],
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
                    //
                    // // ),
                    TProductQuantityWithAddRemoveButtons(),
                  ],
                ),
                TProductPriceText(isLarg: true, price: '239')
              ],
            ),
        ],
      ),
    );
  }
}
