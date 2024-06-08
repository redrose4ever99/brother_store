// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:brother_store/common/widgets/image_text_widets/vertical_image_text.dart';
import 'package:brother_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:brother_store/features/shop/controllers/category_controller.dart';
import 'package:brother_store/features/shop/screens/all_products/all_products.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/common/widgets/images/rounded_image.dart';
import 'package:brother_store/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:brother_store/common/widgets/texts/section_heading.dart';
import 'package:brother_store/features/shop/models/category_model.dart';
import 'package:brother_store/utils/constants/sizes.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({
    Key? key,
    required this.category,
  }) : super(key: key);
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    Get.put(CategoryController());
    final controller = CategoryController.instance;

    final isEg = Get.locale?.languageCode == 'en';
    return Directionality(
      textDirection: isEg ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            isEg ? category.name : category.arabicName,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                ///sub categories
                FutureBuilder(
                    future: controller.getSubCategories(category.id),
                    builder: (context, snapshot) {
                      const loader = TVerticalProductShummer();
                      final widget =
                          TCloudHelperFunctions.checkMuiltiRecordState(
                              snapshot: snapshot, loader: loader);
                      if (widget != null) {
                        return widget;
                      }
                      final subCategories = snapshot.data!;
                      if (subCategories.isEmpty) {
                        return const SizedBox();
                      }
                      return Column(
                        children: [
                          SizedBox(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: subCategories.length,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (_, index) {
                                    final subCategory = subCategories[index];
                                    return FutureBuilder(
                                        future: controller.getCategoryProduct(
                                            categoryId: subCategory.id),
                                        builder: (context, snapshot) {
                                          final widget = TCloudHelperFunctions
                                              .checkMuiltiRecordState(
                                                  snapshot: snapshot,
                                                  loader: loader);
                                          if (widget != null) return widget;
                                          final products = snapshot.data!;
                                          return Column(
                                            children: [
                                              TSectionHeading(
                                                title: isEg
                                                    ? subCategory.name
                                                    : subCategory.arabicName,
                                                showActionButton: true,
                                                onPress: () =>
                                                    Get.to(() => AllProducts(
                                                          title: isEg
                                                              ? subCategory.name
                                                              : subCategory
                                                                  .arabicName,
                                                          futureMethode: controller
                                                              .getCategoryProduct(
                                                                  categoryId:
                                                                      subCategory
                                                                          .id,
                                                                  limit: -1),
                                                        )),
                                              ),
                                              const SizedBox(
                                                height: TSizes.spaceBtWsections,
                                              ),
                                              SizedBox(
                                                height: 150,
                                                child: ListView.separated(
                                                  itemCount: products.length,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  separatorBuilder:
                                                      (context, index) =>
                                                          const SizedBox(
                                                    width: TSizes.spaceBtWItems,
                                                  ),
                                                  itemBuilder: (context,
                                                          index) =>
                                                      TProductCardHorizontal(
                                                    product: products[index],
                                                  ),
                                                ),
                                              )
                                            ],
                                          );
                                        });
                                    // TVerticalImageText(
                                    //     image: category.image == ""
                                    //         ? TImages.bBlack
                                    //         : category.image,
                                    //     isNetworkImage:
                                    //         category.image == "" ? false : true,
                                    //     title: Get.locale?.languageCode == 'en'
                                    //         ? category.name
                                    //         : category.arabicName,
                                    //     onTap: () => AllProducts(
                                    //           title: Get.locale?.languageCode ==
                                    //                   'en'
                                    //               ? category.name
                                    //               : category.arabicName,
                                    //           futureMethode:
                                    //               controller.getCategoryProduct(
                                    //                   categoryId: category.id,
                                    //                   limit: -1),
                                    //         ));
                                  })),
                          // SizedBox(
                          //   height: TSizes.spaceBtWsections,
                          // ),
                          // GridView.builder(
                          //     shrinkWrap: true,
                          //     padding: EdgeInsets.zero,
                          //     physics: const NeverScrollableScrollPhysics(),
                          //     gridDelegate:
                          //         const SliverGridDelegateWithFixedCrossAxisCount(
                          //             crossAxisCount: 2,
                          //             mainAxisSpacing: TSizes.gridViewSpacing,
                          //             crossAxisSpacing: TSizes.gridViewSpacing,
                          //             mainAxisExtent: 2),
                          //     itemBuilder: (_, index) =>
                          //         Text(subCategories[index].name))
                        ],
                      );

                      //  ListView.builder(
                      //     shrinkWrap: true,
                      //     itemCount: subCategories.length,
                      //     physics: const NeverScrollableScrollPhysics(),
                      //     itemBuilder: (_, index) {
                      //       final subCategory = subCategories[index];
                      //       FutureBuilder(
                      //           future: controller.getCategoryProduct(
                      //               categoryId: subCategory.id),
                      //           builder: (context, snapshot) {
                      //             final widget = TCloudHelperFunctions
                      //                 .checkMuiltiRecordState(
                      //                     snapshot: snapshot, loader: loader);
                      //             if (widget != null) return widget;
                      //             final products = snapshot.data!;
                      //             if (products.isEmpty) {
                      //               return Center(
                      //                 child: Text(
                      //                   AppLocalizations.of(context)!.noData,
                      //                   style: Theme.of(context)
                      //                       .textTheme
                      //                       .bodyMedium,
                      //                 ),
                      //               );
                      //             }

                      //             return Column(
                      //               children: [
                      //                 TSectionHeading(
                      //                   title: isEg
                      //                       ? subCategory.name
                      //                       : subCategory.arabicName,
                      //                   onPress: () => Get.to(() => AllProducts(
                      //                         title: subCategory.name,
                      //                         futureMethode:
                      //                             controller.getCategoryProduct(
                      //                                 categoryId:
                      //                                     subCategory.id,
                      //                                 limit: -1),
                      //                       )),
                      //                 ),
                      //                 const SizedBox(
                      //                   height: TSizes.spaceBtWItems / 2,
                      //                 ),
                      //                 SizedBox(
                      //                   height: 150,
                      //                   child: ListView.separated(
                      //                     itemCount: products.length,
                      //                     scrollDirection: Axis.horizontal,
                      //                     separatorBuilder: (context, index) =>
                      //                         const SizedBox(
                      //                       width: TSizes.spaceBtWItems,
                      //                     ),
                      //                     itemBuilder: (context, index) =>
                      //                         TProductCardHorizontal(
                      //                       product: products[index],
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             );
                      //           });
                      //       return null;
                      //     });
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
