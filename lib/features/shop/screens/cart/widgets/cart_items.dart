import 'package:brother_store/common/widgets/texts/product_price_text.dart';
import 'package:brother_store/features/shop/controllers/product/cart_controller.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import 'add_remove_button.dart';
import 'cart_item_widget.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemoveButtons = true});
  final bool showAddRemoveButtons;
  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Obx(
      () => ListView.separated(
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
        itemCount: cartController.cartItems.length,
        itemBuilder: (_, index) => Obx(() {
          final item = cartController.cartItems[index];
          return Column(
            children: [
              TCartItem(cartItem: item),
              if (showAddRemoveButtons)
                const SizedBox(
                  height: TSizes.spaceBtWItems,
                ),
              //--add & remove buttons
              if (showAddRemoveButtons)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        //
                        // // ),
                        TProductQuantityWithAddRemoveButtons(
                          quantity: item.quantity,
                          add: () => cartController.addOneToCart(item),
                          remove: () => cartController.removeOneFromCart(item),
                        ),
                      ],
                    ),
                    TProductPriceText(
                        isLarg: true,
                        price: (item.price * item.quantity).toStringAsFixed(1))
                  ],
                ),
            ],
          );
        }),
      ),
    );
  }
}
