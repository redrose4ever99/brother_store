import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/common/widgets/product.cart/cart_menu_icon.dart';
import 'package:brother_store/features/shop/screens/cart/cart.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class THomeAppbar extends StatelessWidget {
  const THomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Row(
        children: [
          const Image(
            image: AssetImage(TImages.logo),
            width: 40,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good day for shopping',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: TColors.grey),
              ),
              Text(
                'Nuwwar Saeed',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: TColors.white),
              )
            ],
          ),
        ],
      ),
      actions: [
        TCartCounterIcon(
          iconColor: THelperFunctions.isDarkMode(context)
              ? TColors.white
              : TColors.black,
          onPress: () => Get.to(() => const CartScreen()),
        )
      ],
    );
  }
}
