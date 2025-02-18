import 'package:brother_store/common/widgets/images/rounded_image.dart';
import 'package:brother_store/common/widgets/layout/grid_gallery_layout.dart';
import 'package:brother_store/common/widgets/shimmers/gallery_photo_shimmer.dart';
import 'package:brother_store/features/gallery/controller/album_controller.dart';
import 'package:brother_store/features/gallery/models/album_model.dart';
import 'package:brother_store/features/general/screens/gallery_widget.dart';
import 'package:brother_store/features/shop/controllers/product/images_controller.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class TTabGalleryView extends StatelessWidget {
  const TTabGalleryView({
    super.key,
    required this.album,
  });
  final AlbumModel album;
  @override
  Widget build(BuildContext context) {
    final imageController = Get.put(ImagesController());
    final controller = AlbumController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //-- Brands
              // const TBrandShowCase(
              //   images: [
              //     TImages.brandImage1,
              //     TImages.brandImage2,
              //     TImages.productImg1
              //   ],
              // ),

              // TSectionHeading(
              //   title: AppLocalizations.of(context)!.artPaces,
              //   buttonTitle: AppLocalizations.of(context)!.viewAll,
              //   showActionButton: true,
              //   onPress: () {},
              // ),
              const SizedBox(
                height: TSizes.spaceBtWItems,
              ),
              FutureBuilder(
                  future: controller.getGalleryAlbum(albumId: album.id),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const TGalleryPhotoShimmer(
                        itemCount: 4,
                      );
                    }
                    if (!snapshot.hasData ||
                        snapshot.data == null ||
                        snapshot.data!.isEmpty) {
                      return Center(
                        child: Text(
                          AppLocalizations.of(context)!.noData,
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
                    final photos = snapshot.data!;
                    if (photos.isEmpty) {
                      return Center(
                        child: Text(
                          AppLocalizations.of(context)!.noData,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    }

                    return TGridGalleryLayout(
                        itemCount: photos.length,
                        itemBuilder: (_, index) => GestureDetector(
                              onTap: () => Get.to(GalleryWidget(
                                  urlImage: photos.map((e) => e.image).toList(),
                                  index: index)),

                              //  imageController.showEnLargedImage(
                              //     photos[index].image,
                              //     Get.locale?.languageCode == 'en'
                              //         ? photos[index].name ?? ""
                              //         : photos[index].arabicName ?? "",
                              //     Get.locale?.languageCode == 'en'
                              //         ? photos[index].description ?? ""
                              //         : photos[index].arabicDescription ?? ""),
                              child: TRoundedImage(
                                imageUrl: photos[index].image,
                                // width: 100,
                                fit: BoxFit.cover,
                                isNetworkImage: true,
                                width: THelperFunctions.screenwidth() -
                                    TSizes.defaultSpace * 2,
                                height: THelperFunctions.screenwidth() / 1.7,
                              ),
                            ));
                  }),
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
