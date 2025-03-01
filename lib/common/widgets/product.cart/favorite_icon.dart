// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:brother_store/common/widgets/icons/circuler_icon.dart';
import 'package:brother_store/features/shop/controllers/product/favorites_controller.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TFavoriteIcon extends StatelessWidget {
  const TFavoriteIcon({
    Key? key,
    required this.productId,
  }) : super(key: key);
  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoriteController());
    return Obx(() => TCircularIcon(
          backgroundColor: Colors.transparent,
          size: 35,
          icon: controller.isFavorites(productId)
              ? Icons.favorite
              : Icons.favorite_border_rounded,
          color:
              controller.isFavorites(productId) ? TColors.error : Colors.black,
          onPressed: () => controller.toggleFavoriteProduct(productId),
        ));
  }
}
