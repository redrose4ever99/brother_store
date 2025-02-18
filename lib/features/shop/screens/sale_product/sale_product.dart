import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:brother_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:brother_store/features/shop/controllers/product/product_controller.dart';
import 'package:brother_store/features/shop/models/product_model.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class SaleProducts extends StatelessWidget {
  const SaleProducts({super.key, this.futureMethode});

  final Future<List<ProductModel>>? futureMethode;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Directionality(
      textDirection: Get.locale?.languageCode == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            AppLocalizations.of(context)!.offers,
            //style: Theme.of(context).textTheme.headlineMedium,
          ),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: FutureBuilder(
                future: controller.getSaleProduct(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const TVerticalProductShummer();
                  }
                  if (!snapshot.hasData ||
                      snapshot.data == null ||
                      snapshot.data!.isEmpty) {
                    Center(
                      child: Text(
                        AppLocalizations.of(context)!.noData,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    );
                  }
                  if (snapshot.hasError) {
                    Center(
                      child: Text(
                        AppLocalizations.of(context)!.somethingWentWrong,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    );
                  }
                  final products = snapshot.data!;

                  if (products == []) {
                    return Center(
                      child: Text(
                        AppLocalizations.of(context)!.noData,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    );
                  }
                  return TSortableProducts(products: products);
                }),
          ),
        ),
      ),
    );
  }
}
