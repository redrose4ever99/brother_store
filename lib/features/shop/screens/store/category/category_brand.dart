import 'package:brother_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:brother_store/common/widgets/shimmers/boxes_shimmer.dart';
import 'package:brother_store/common/widgets/shimmers/listTile_shimmer.dart';
import 'package:brother_store/features/shop/controllers/brand_controller.dart';
import 'package:brother_store/features/shop/models/brand_model.dart';
import 'package:brother_store/features/shop/models/category_model.dart';
import 'package:brother_store/features/shop/screens/store/brand/brand_card.dart';
import 'package:brother_store/features/shop/screens/store/brand/brand_show_case.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/cloud_helper_function.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CategoryBrand extends StatelessWidget {
  const CategoryBrand({super.key, required this.category});

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
      future: controller.getBrandForCategory(category.id),
      builder: (context, snapshot) {
        const loader = Column(
          children: [
            TListTilehummer(),
            SizedBox(
              height: TSizes.spaceBtWItems,
            ),
            TBoxesShummer(),
            SizedBox(
              height: TSizes.spaceBtWItems,
            ),
          ],
        );
        final widget = TCloudHelperFunctions.checkMuiltiRecordState(
            snapshot: snapshot, loader: loader);
        if (widget != null) return widget;
        final brands = snapshot.data!;
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: brands.length,
          itemBuilder: (_, index) {
            final brand = brands[index];
            return FutureBuilder(
                future:
                    controller.getBrandProducts(brandId: brand.id, limit: 3),
                builder: (context, snapshot) {
                  final widget = TCloudHelperFunctions.checkMuiltiRecordState(
                      snapshot: snapshot, loader: loader);
                  if (widget != null) return widget;
                  final products = snapshot.data!;
                  return TBrandShowCase(
                      images: products.map((e) => e.thumbnail).toList(),
                      brand: brand);
                });
          },
        );
      },
    );
  }
}
