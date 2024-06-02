import 'package:brother_store/common/widgets/layout/grid_layout.dart';
import 'package:brother_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:brother_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:brother_store/common/widgets/texts/section_heading.dart';
import 'package:brother_store/features/shop/controllers/category_controller.dart';
import 'package:brother_store/features/shop/models/category_model.dart';
import 'package:brother_store/features/shop/screens/store/brand/brand_show_case.dart';
import 'package:brother_store/features/shop/screens/store/category/category_brand.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({
    super.key,
    required this.category,
  });
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //-- Brands
              CategoryBrand(category: category),
              const SizedBox(
                height: TSizes.spaceBtWItems,
              ),

              TSectionHeading(
                title: AppLocalizations.of(context)!.youMightLike,
                showActionButton: true,
                buttonTitle: AppLocalizations.of(context)!.viewAll,
                onPress: () {},
              ),
              const SizedBox(
                height: TSizes.spaceBtWItems,
              ),

              FutureBuilder(
                  future:
                      controller.getCategoryProduct(categoryId: category.id),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const TVerticalProductShummer();
                    }
                    if (!snapshot.hasData ||
                        snapshot.data == null ||
                        snapshot.data!.isEmpty) {
                      return Center(
                        child: Text(
                          'لايوجد بيانات',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          AppLocalizations.of(context)!.somethingWentWrong,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    }
                    final products = snapshot.data!;
                    if (products.isEmpty) {
                      return Center(
                        child: Text(
                          AppLocalizations.of(context)!.noData,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    }

                    return TGridLayout(
                        itemCount: products.length,
                        itemBuilder: (_, index) => TProductCardVertical(
                              product: products[index],
                            ));

                    //return TSortableProducts(products: products);
                  }),

              // TGridLayout(
              //     itemCount: products.length,
              //     itemBuilder: (_, index) => TProductCardVertical(
              //           product: ProductModel.empty(),
              //         )),
              const SizedBox(
                height: TSizes.spaceBtWsections,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
