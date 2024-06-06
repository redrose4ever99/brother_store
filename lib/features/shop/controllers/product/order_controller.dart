import 'package:brother_store/common/widgets/success_screen/success_screen.dart';
import 'package:brother_store/data/repositoies/order/order_repository.dart';
import 'package:brother_store/features/shop/controllers/address_controller.dart';
import 'package:brother_store/features/shop/controllers/product/cart_controller.dart';
import 'package:brother_store/features/shop/controllers/product/checkoutController.dart';
import 'package:brother_store/features/shop/models/order_model.dart';
import 'package:brother_store/navigation_menu.dart';
import 'package:brother_store/utils/constants/enums.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:brother_store/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  final cartController = CartController.instance;
  final addressController = Get.put(AddressController());
  final checkoutController = Get.put(CheckoutController());
  final orderRepository = Get.put(OrderRepository());

  // RxInt numOfCartItems = 0.obs;
  // RxDouble totalOfCartPrice = 0.0.obs;
  // RxInt productQuantityinCart = 0.obs;
  // RxList<CartItemModel> cartItems = <CartItemModel>[].obs;

  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrder = await orderRepository.fetchUserOrders();
      return userOrder;
    } catch (e) {
      Get.snackbar('Oh Snap!', e.toString());
      return [];
    }
  }

  void processOrder(double totalAmount) async {
    TFullScreenLoader.openloadingDialog(
        'Processing your order', TImages.bBlack);
    const userId = 'EyTbtgIxRwamzlhsPnSs4lehlcc2';

    // final userId = AuthenticationRepository.instance.authUser.uid;
    // if (userId.isEmpty) return;
    final order = OrderModel(
      id: UniqueKey().toString(),
      userId: userId,
      status: OrderStatus.pinding,
      totalAmount: totalAmount,
      orderDate: DateTime.now(),
      paymentMethod: checkoutController.selectedPaymentMethode.value.name,
      address: addressController.selectedAddress.value,
      deliveryDate: DateTime.now(),
      items: cartController.cartItems.toList(),
    );
    await orderRepository.saveOrder(order, userId);
    cartController.clearCart();
    Get.off(() => SuccessScreen(
          image: THelperFunctions.isDarkMode(Get.context!)
              ? TImages.truePaymentblack
              : TImages.truePaymentwhite,
          title: AppLocalizations.of(Get.context!)!.paymentSuccessfull,
          subTitle:
              AppLocalizations.of(Get.context!)!.yourItemWillBeShippingSoon,
          onPressed: () => Get.to(() => const NavigationMenu()),
        ));
  }
}
