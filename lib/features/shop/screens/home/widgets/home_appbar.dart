import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/common/widgets/product.cart/cart_menu_icon.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class THomeAppbar extends StatelessWidget {
  const THomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
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
      actions: [
        TCartCounterIcon(
          iconColor: THelperFunctions.isDarkMode(context)
              ? TColors.white
              : TColors.black,
          onPress: () {},
        )
      ],
    );
  }
}
