import 'package:brother_store/features/authontication/controllers/network_manager.dart';
import 'package:brother_store/features/general/controllers/brother_controller.dart';
import 'package:brother_store/features/shop/controllers/address_controller.dart';
import 'package:brother_store/features/shop/controllers/product/checkoutController.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(BrothersController());
    Get.put(AddressController());
    Get.put(CheckoutController());
  }
}
