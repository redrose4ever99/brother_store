import 'package:brother_store/common/widgets/image_text_widets/vertical_image_text.dart';
import 'package:brother_store/common/widgets/shimmers/catrgory_shimmer.dart';
import 'package:brother_store/features/shop/controllers/category_controller.dart';
import 'package:brother_store/features/shop/models/brand_model.dart';
import 'package:brother_store/features/shop/screens/all_products/all_products.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandCategory extends StatelessWidget {
  const BrandCategory({super.key, required this.brand});

  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return FutureBuilder(
      future: controller.getBrandCategorys(brand.id),
      builder: (context, snapshot) {
        const loader = TCategoryShummer();
        final widget = TCloudHelperFunctions.checkMuiltiRecordState(
            snapshot: snapshot, loader: loader);
        if (widget != null) return widget;
        final categories = snapshot.data!;
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categories.length,
          itemBuilder: (_, index) {
            final category = categories[index];
            return TVerticalImageText(
              borderColor: TColors.primary,
              image: category.image == "" ? TImages.bBlack : category.image,
              textColor: TColors.black,
              isNetworkImage: category.image == "" ? false : true,
              title: Get.locale?.languageCode == 'en'
                  ? category.name
                  : category.arabicName,
              onTap: () => Get.to(() => AllProducts(
                    title: Get.locale?.languageCode == 'en'
                        ? category.name
                        : category.arabicName,
                    futureMethode: controller.getCategoryProduct(
                        categoryId: category.id, limit: -1),
                  )),

              // SubCategoriesScreen(
              //   category: category,
              // )),
            );
          },
        );
      },
    );
  }
}
