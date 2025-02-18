// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:brother_store/common/widgets/shimmers/shimmer.dart';
import 'package:brother_store/features/general/screens/gallery_widget.dart';
import 'package:brother_store/features/shop/controllers/banner_controller.dart';

import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:brother_store/common/widgets/custom_shapes/containers/circuler_container.dart';

import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/sizes.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    Key? key,
    this.autoPlay = true,
  }) : super(key: key);

  final bool autoPlay;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    List<String> images = controller.banners.value.map((e) => e.image).toList();

    ;
    return Obx(() {
      if (controller.isLoading.value) {
        return const TShimmerEffect(width: double.infinity, height: 200);
      }
      if (controller.banners.isEmpty) {
        return Center(
          child: Text(
            AppLocalizations.of(context)!.noData,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        );
      }
      return Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
                autoPlay: autoPlay,
                autoPlayCurve: Curves.linear,
                viewportFraction: 1,
                onPageChanged: (index, _) =>
                    controller.updatePageIndicator(index)),
            items: controller.banners
                .map((banner) => CachedNetworkImage(
                    fit: BoxFit.fill,
                    // width: THelperFunctions.screenwidth() ,
                    //height: THelperFunctions.screenwidth() / 1.7,
                    // color: TColors.darkGrey.withOpacity(0.1),
                    imageUrl: banner.image,
                    imageBuilder: (context, imageProvider) => GestureDetector(
                          onTap: () {
                            Get.to(GalleryWidget(
                                urlImage: images,
                                index: images.indexOf(banner.image)));
                          },
                          child: Container(
                            width: THelperFunctions.screenwidth(),
                            height: 200,
                            decoration: BoxDecoration(
                              // borderRadius: BorderRadius.circular(0),
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.fitWidth),
                            ),
                          ),
                        ),
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => ClipRRect(
                            //  borderRadius: BorderRadius.circular(0),
                            child: TShimmerEffect(
                                raduis: 0,
                                width: THelperFunctions.screenwidth(),
                                height: 200)),
                    errorWidget: (context, url, error) => const Icon(
                          Icons.error,
                          size: 50,
                        )))
                .toList(),
          ),
          const SizedBox(
            height: TSizes.spaceBtWItems,
          ),
          Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < controller.banners.length; i++)
                  TCirculerContainer(
                    width: 20,
                    height: 5,
                    margin: const EdgeInsets.only(right: 5, left: 5),
                    backgroundColor: controller.carousalCurrentIndex.value == i
                        ? TColors.black
                        : TColors.grey,
                  )
              ],
            ),
          )
        ],
      );
    });
  }
}
