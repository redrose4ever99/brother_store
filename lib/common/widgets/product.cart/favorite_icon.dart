import 'package:brother_store/common/widgets/icons/circuler_icon.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TFavoriteIcon extends StatelessWidget {
  const TFavoriteIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TCircularIcon(
      icon: Iconsax.heart5,
      color: Colors.red,
    );
  }
}
