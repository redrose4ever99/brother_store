import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/features/general/controllers/paytabs_controller.dart';
import 'package:brother_store/features/shop/controllers/product/cart_controller.dart';
import 'package:brother_store/features/shop/controllers/product/order_controller.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCardDetails extends StatefulWidget {
  const AddCardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PayTabsController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    final cartController = CartController.instance;
    final subtotal = cartController.totalOfCartPrice.value;
    final orderController = Get.put(OrderController());
    return Directionality(
        textDirection: Get.locale?.languageCode == 'en'
            ? TextDirection.ltr
            : TextDirection.rtl,
        child: Scaffold(
          appBar: TAppBar(
            showBackArrow: true,
            title: Text(
              'card info',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          body: Center(
              child: ElevatedButton(
            onPressed: () {
              controller.startPayment();
            },
            child: Text(
              'try pay',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          )),
        ));
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
