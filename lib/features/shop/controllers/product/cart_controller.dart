import 'package:brother_store/features/shop/models/cart_item_model.dart';
import 'package:brother_store/features/shop/models/product_model.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/storage/storage_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();
  RxInt numOfCartItems = 0.obs;
  RxDouble totalOfCartPrice = 0.0.obs;
  RxInt productQuantityinCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;

  CartController() {
    loadCartItem();
  }

  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    final price = product.salePrice > 0.0 ? product.salePrice : product.price;
    return CartItemModel(
        productId: product.id,
        quantity: quantity,
        title: product.title,
        price: price,
        image: product.thumbnail,
        brandName: product.brand != null ? product.brand!.name : '');
  }

  void addOneToCart(CartItemModel item) {
    int index = cartItems
        .indexWhere((cartItem) => cartItem.productId == item.productId);
    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }
    updateCart();
  }

  void removeOneFromCart(CartItemModel item) {
    int index = cartItems
        .indexWhere((cartItem) => cartItem.productId == item.productId);

    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        cartItems[index].quantity == 1
            ? removeFromCartDialog(index)
            : cartItems.removeAt(index);
      }
      updateCart();
    }
  }

  void removeFromCartDialog(int index) {
    Get.defaultDialog(
        title: 'Remove Product',
        middleText: 'Are you Sure you want to remove this item?',
        onConfirm: () {
          cartItems.removeAt(index);
          updateCart();
          Get.back();
          Get.snackbar(
            AppLocalizations.of(Get.context!)!.info,
            AppLocalizations.of(Get.context!)!.productHasBeenRemovedFromCart,
            snackPosition: SnackPosition.BOTTOM,
          );
        },
        onCancel: () => Get.back());
  }

  void addToCart(ProductModel product) {
    if (productQuantityinCart.value < 1) {
      Get.snackbar(
        'warning',
        'Please Select Quantity',
        snackPosition: SnackPosition.BOTTOM,
      );

      return;
    } else if (product.stock < productQuantityinCart.value) {
      Get.snackbar(
          snackPosition: SnackPosition.BOTTOM,
          'ooh snap!',
          'Selected Product is out of stock',
          backgroundColor: Colors.orange,
          colorText: TColors.white,
          icon: const Icon(
            Iconsax.warning_2,
            color: TColors.white,
          ));
      return;
    }
    final selectedCartItem =
        convertToCartItem(product, productQuantityinCart.value);

    ///Check if already added on cart

    int index = cartItems.indexWhere(
        (cartItem) => cartItem.productId == selectedCartItem.productId);
    if (index >= 0) {
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }
    updateCart();
    Get.snackbar(
      AppLocalizations.of(Get.context!)!.info,
      AppLocalizations.of(Get.context!)!.successfullyAddedToCart,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void updateCart() {
    updateTotal();
    saveCartItems();
    cartItems.refresh();
  }

  void updateTotal() {
    double total = 0.0;
    int calculatedItem = 0;
    for (var item in cartItems) {
      total += (item.price) * item.quantity.toDouble();
      calculatedItem += item.quantity;
    }
    totalOfCartPrice.value = total;
    numOfCartItems.value = calculatedItem;
  }

  void saveCartItems() {
    final cartItemsStrings =
        cartItems.map((element) => element.toJason()).toList();
    TLocalStorage.instance().writeData('cartItem', cartItemsStrings);
  }

  void loadCartItem() {
    final cartItemStrings =
        TLocalStorage.instance().readData<List<dynamic>>('cartItem');
    if (cartItemStrings != null) {
      cartItems.assignAll(cartItemStrings
          .map((e) => CartItemModel.fromJason(e as Map<String, dynamic>)));
      updateTotal();
    }
  }

  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems
        .where((p0) => p0.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  void clearCart() {
    productQuantityinCart.value = 0;
    cartItems.clear();
    updateCart();
  }

  void updateAlreadyAddedProductCount(ProductModel product) {
    productQuantityinCart.value = getProductQuantityInCart(product.id);
  }
}
