// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:brother_store/common/widgets/icons/circuler_icon.dart';
import 'package:brother_store/features/shop/controllers/product/cart_controller.dart';
import 'package:brother_store/features/shop/controllers/product/later_list_controller.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//TFavoriteIcon
class TSaveForLaterIcon extends StatelessWidget {
  const TSaveForLaterIcon({
    Key? key,
    required this.productId,
  }) : super(key: key);
  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LaterListController());
    var id = CartController.instance.cartItems.indexOf(productId);
    return Obx(
      () => Row(children: [
        Text("Save for Later"),
        TCircularIcon(
            backgroundColor: Colors.transparent,
            size: 35,
            icon: controller.isLaterShoping(productId)
                ? Icons.save_as_outlined
                : Icons.save_as_outlined,
            color: controller.isLaterShoping(productId)
                ? TColors.error
                : Colors.black,
            onPressed: () {
              controller.toggleLaterShopingProduct(productId);
              CartController.instance.cartItems.removeAt(id);
              CartController.instance.updateCart();
            }),
      ]),
    );
  }
}
