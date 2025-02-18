// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/common/widgets/images/rounded_image.dart';
import 'package:brother_store/common/widgets/layout/grid_gallery_layout.dart';
import 'package:brother_store/common/widgets/shimmers/shimmer.dart';
import 'package:brother_store/features/general/screens/gallery_widget.dart';
import 'package:brother_store/features/shop/models/clients_model.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class ClientScreen extends StatelessWidget {
  const ClientScreen({
    Key? key,
    required this.client,
  }) : super(key: key);
  final ClientModel client;
  @override
  Widget build(BuildContext context) {
    //final controller = BrandController.instance;
    // final imageController = Get.put(ImagesController());
    var isEg = Get.locale?.languageCode == 'en';
    return Directionality(
        textDirection: Get.locale?.languageCode == 'en'
            ? TextDirection.ltr
            : TextDirection.rtl,
        child: Scaffold(
          appBar: TAppBar(
            title: Text(
              isEg ? client.name ?? 'Client' : client.arabicName ?? 'عميل',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            showBackArrow: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                          fit: BoxFit.fill,
                          // width: THelperFunctions.screenwidth() ,
                          //height: THelperFunctions.screenwidth() / 1.7,
                          // color: TColors.darkGrey.withOpacity(0.1),
                          imageUrl: client.thumbnail,
                          imageBuilder: (context, imageProvider) =>
                              GestureDetector(
                                onTap: () {},
                                child: Hero(
                                  tag: 's',
                                  child: Container(
                                    width: THelperFunctions.screenwidth(),
                                    height: 220,
                                    decoration: BoxDecoration(
                                      color: TColors.light,
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.contain),
                                    ),
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
                              )),

                      // client.thumbnail == ''
                      //     ? TShimmerEffect(
                      //         width: THelperFunctions.screenwidth() - 16,
                      //         height: THelperFunctions.screenwidth() * 0.7)
                      //     : TRoundedImage(
                      //         imageUrl: client.thumbnail,
                      //         padding:
                      //             const EdgeInsets.all(TSizes.defaultSpace),
                      //         fit: BoxFit.cover,
                      //         isNetworkImage: true,
                      //       ),
                      const SizedBox(
                        height: TSizes.spaceBtWItems,
                      ),
                      // Row(
                      //   children: [
                      //     Text(AppLocalizations.of(context)!.name,
                      //         style: Theme.of(context).textTheme.headlineSmall),
                      //     Text(': ',
                      //         style: Theme.of(context).textTheme.headlineSmall),
                      //     Text(isEg
                      //         ? client.name ?? ''
                      //         : client.arabicName ?? ''),
                      //   ],
                      // ),
                      // const SizedBox(
                      //   height: TSizes.spaceBtWItems / 4,
                      // ),
                      Wrap(
                        children: [
                          Text(AppLocalizations.of(context)!.about,
                              style: Theme.of(context).textTheme.headlineSmall),
                          Text(isEg
                              ? client.text ?? ''
                              : client.arabicText ?? ''),
                        ],
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtWItems / 4,
                      ),

                      Visibility(
                        visible: false,
                        child: Text(AppLocalizations.of(context)!.someOfOurWork,
                            style: Theme.of(context).textTheme.headlineSmall),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: false,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.defaultSpace, vertical: 0),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: TGridGalleryLayout(
                        itemCount: client.images!.length,
                        itemBuilder: (_, index) => GestureDetector(
                              onTap: () => Get.to(() => GalleryWidget(
                                    index: index,
                                    urlImage: client.images!,
                                  )),

                              // imageController.fullScreenImage(
                              //     index, client.images![index], client.images!),
                              child: TRoundedImage(
                                imageUrl: client.images![index],
                                fit: BoxFit.fill,
                                isNetworkImage: true,
                              ),
                            )),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
/////////////
