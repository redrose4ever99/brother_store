import 'package:brother_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:brother_store/common/widgets/shimmers/home_album_shimmer.dart';
import 'package:brother_store/common/widgets/shimmers/shimmer.dart';
import 'package:brother_store/features/gallery/controller/album_controller.dart';
import 'package:brother_store/features/gallery/models/album_model.dart';
import 'package:brother_store/features/shop/screens/home/widgets/album_photos.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iconsax/iconsax.dart';

class TAlbumList extends StatelessWidget {
  const TAlbumList({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AlbumController());
    final isEg = Get.locale?.languageCode == 'en';
    final List<AlbumModel> albums = [];
    return Padding(
      padding: const EdgeInsets.only(
          left: TSizes.defaultSpace, right: TSizes.defaultSpace),
      child: Obx(() {
        albums.assignAll(controller.allalbums);
        if (controller.isLoading.value) return const THomeAlbumShimmer();
        if (albums.isEmpty) {
          return Center(
            child: Text(
              AppLocalizations.of(context)!.noData,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          );
        }

        return SizedBox(
          width: double.infinity,
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: albums.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                    onTap: () =>
                        Get.to(TSingleAlbumPhotoView(album: albums[index])),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                      child: Stack(
                        children: [
                          //TRoundedImage(imageUrl: albums[index].image!),
                          CachedNetworkImage(
                              fit: BoxFit.fill,
                              width: THelperFunctions.screenwidth() -
                                  TSizes.defaultSpace * 2,
                              height: THelperFunctions.screenwidth() / 1.7,
                              // color: TColors.darkGrey.withOpacity(0.1),
                              imageUrl: albums[index].image!,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                    width: THelperFunctions.screenwidth() - 17,
                                    height:
                                        THelperFunctions.screenwidth() / 1.7,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => ClipRRect(
                                      borderRadius: BorderRadius.circular(40),
                                      child: TShimmerEffect(
                                          width:
                                              THelperFunctions.screenwidth() -
                                                  16,
                                          height: 230)),
                              errorWidget: (context, url, error) => const Icon(
                                    Icons.error,
                                    size: 50,
                                  )),
                          TRoundedContainer(
                              width: THelperFunctions.screenwidth() -
                                  TSizes.defaultSpace * 2,
                              backgroundColor: TColors.black.withOpacity(0.3),
                              height: THelperFunctions.screenwidth() / 1.7),
                          Positioned(
                            bottom: 50,
                            left: 30,
                            right: 30,
                            child: Wrap(
                              children: [
                                Text(
                                  isEg
                                      ? albums[index].name
                                      : albums[index].arabicName,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right:
                                isEg ? 0 : THelperFunctions.screenwidth() - 100,
                            child: IconButton(
                                onPressed: () => Get.to(TSingleAlbumPhotoView(
                                    album: albums[index])),
                                icon: Icon(
                                    isEg
                                        ? Iconsax.arrow_right
                                        : Iconsax.arrow_left_3,
                                    size: 30,
                                    color: Colors.white)),
                          ),
                        ],
                      ),
                    ));
              }),
        );
      }),
    );
  }
}
