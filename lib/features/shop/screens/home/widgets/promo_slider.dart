import 'package:brother_store/common/widgets/custom_shapes/containers/circuler_container.dart';
import 'package:brother_store/common/widgets/images/rounded_image.dart';
import 'package:brother_store/features/shop/controllers/home_controller.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({super.key, required this.banners});
  final List<String> banners;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              viewportFraction: 0.8,
              onPageChanged: (index, _) =>
                  controller.updatePageIndicator(index)),
          items: banners
              .map((url) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TRoundedImage(imageUrl: url),
                  ))
              .toList(),
        ),
        const SizedBox(
          height: TSizes.spaceBtWItems,
        ),
        Obx(
          () => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < banners.length; i++)
                TCirculerContainer(
                  width: 20,
                  height: 5,
                  margin: const EdgeInsets.only(right: 5, left: 5),
                  backgroundColor: controller.carousalCurrentIndex.value == i
                      ? TColors.primary.withOpacity(0.5)
                      : TColors.grey,
                )
            ],
          ),
        )
      ],
    );
  }
}
