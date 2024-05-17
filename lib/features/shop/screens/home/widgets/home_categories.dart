import 'package:brother_store/common/widgets/image_text_widets/vertical_image_text.dart';
import 'package:brother_store/common/widgets/shimmers/catrgory_shimmer.dart';
import 'package:brother_store/features/shop/controllers/category_controller.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx(() {
      if (categoryController.isLoading.value) return const TCategoryShummer();
      if (categoryController.allCategories.isEmpty) {
        return const Center(
          child: Text('no data'),
        );
      }
      return SizedBox(
          height: 130,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: categoryController.featureCategories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final category = categoryController.featureCategories[index];
                return TVerticalImageText(
                  image: category.image == "" ? TImages.bBlack : category.image,
                  title: Get.locale?.languageCode == 'en'
                      ? category.name
                      : category.arabicName,
                  onTap: () {},
                );
              }));
    });
  }
}
