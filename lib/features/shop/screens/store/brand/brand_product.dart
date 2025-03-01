import 'package:brother_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:brother_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:brother_store/features/shop/controllers/brand_controller.dart';
import 'package:brother_store/features/shop/models/brand_model.dart';
import 'package:brother_store/features/shop/screens/store/brand/brand_up_page.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});
  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Directionality(
      textDirection: Get.locale?.languageCode == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        // appBar: TAppBar(
        //   title: Text(
        //     brand.name,
        //     style: Theme.of(context).textTheme.headlineMedium,
        //   ),
        //   showBackArrow: true,
        // ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TBrandUpPage(showBorder: false, brand: brand),
              // const SizedBox(
              //   height: TSizes.spaceBtWItems,
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //       left: TSizes.defaultSpace, right: TSizes.defaultSpace),
              //   child: TSectionHeading(title: 'kjhghf'),
              // ),
              // BrandCategory(brand: brand),
              // const SizedBox(
              //   height: TSizes.spaceBtWItems,
              // ),
              Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: FutureBuilder(
                    future: controller.getBrandProducts(brandId: brand.id),
                    builder: (context, snapshot) {
                      const loader = TVerticalProductShummer();
                      final widget =
                          TCloudHelperFunctions.checkMuiltiRecordState(
                              snapshot: snapshot, loader: loader);
                      if (widget != null) return widget;

                      final brandProducts = snapshot.data!;

                      if (brandProducts.isEmpty) {
                        return Center(
                          child: Text(
                            AppLocalizations.of(context)!.noData,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        );
                      }
                      return TSortableProducts(products: brandProducts);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
