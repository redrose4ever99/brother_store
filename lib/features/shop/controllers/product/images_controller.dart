import 'package:brother_store/common/widgets/images/rounded_image.dart';
import 'package:brother_store/features/shop/models/product_model.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();
  RxString selectedProductImage = ''.obs;
  List<String> getAllProductImage(ProductModel product) {
    Set<String> images = {};
    images.add(product.thumbnail);
    selectedProductImage.value = product.thumbnail;
    if (product.images != null) {
      images.addAll(product.images!);
    }
    return images.toList();
  }

  void showEnLargedImage(String image, String? title, String? description) {
    Get.to(
        fullscreenDialog: true,
        () => Dialog.fullscreen(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.defaultSpace,
                        vertical: TSizes.defaultSpace * 2),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TRoundedImage(
                            isNetworkImage: true,
                            imageUrl: image,
                          ),
                        ),
                        if (title != '')
                          const SizedBox(height: TSizes.spaceBtWsections / 2),
                        if (title != '')
                          Padding(
                            padding: const EdgeInsets.only(
                                left: TSizes.defaultSpace,
                                right: TSizes.defaultSpace),
                            child: Align(
                              alignment: Get.locale?.languageCode == 'en'
                                  ? Alignment.topLeft
                                  : Alignment.topRight,
                              child: Text(title!,
                                  style: Theme.of(Get.context!)
                                      .textTheme
                                      .headlineSmall),
                            ),
                          ),
                        if (description != '')
                          const SizedBox(height: TSizes.spaceBtWsections / 2),
                        if (description != '')
                          Padding(
                            padding: const EdgeInsets.only(
                                left: TSizes.defaultSpace,
                                right: TSizes.defaultSpace),
                            child: Align(
                              alignment: Get.locale?.languageCode == 'en'
                                  ? Alignment.topLeft
                                  : Alignment.topRight,
                              child: Text(description!,
                                  style: Theme.of(Get.context!)
                                      .textTheme
                                      .bodyMedium),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtWsections),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 150,
                      child: OutlinedButton(
                          onPressed: () => Get.back(),
                          child:
                              Text(AppLocalizations.of(Get.context!)!.close)),
                    ),
                  )
                ],
              ),
            ));
  }
}
