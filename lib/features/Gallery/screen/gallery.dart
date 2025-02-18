import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/common/widgets/appbar/tabbar.dart';
import 'package:brother_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../controller/album_controller.dart';
import 'widgets/album_tab.dart';

class TGalleryScreen extends StatelessWidget {
  const TGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isEg = Get.locale?.languageCode == 'en';
    final controller = Get.put(AlbumController());
    final albums = controller.allalbums;
    return DefaultTabController(
      length: albums.length,
      child: Scaffold(
        appBar: TAppBar(
          showBackArrow: true,
          title: Text(
            AppLocalizations.of(context)!.gallery,
            // style: Theme.of(context).textTheme.headlineSmall,
          ),
          // actions: [
          //   TCartCounterIcon(
          //     iconColor: THelperFunctions.isDarkMode(context)
          //         ? TColors.white
          //         : TColors.black,
          //     onPress: () {},
          //   )
          // ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                floating: false,
                pinned: true,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.black
                    : TColors.white,
                expandedHeight: 150,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(height: TSizes.spaceBtWItems),
                      TSearchContainer(
                        text: AppLocalizations.of(context)!.searchinGallery,
                        showBorder: true,
                        padding: EdgeInsets.zero,
                        icon: Iconsax.search_normal,
                        showBackground: false,
                      ),
                      // const SizedBox(height: TSizes.spaceBtWsections),
                      // TSectionHeading(
                      //   title: 'Added Resently',
                      //   showActionButton: true,
                      //   onPress: () {},
                      // ),
                      // const SizedBox(height: TSizes.spaceBtWItems / 1.5),
                      // TGridLayout(
                      //     itemCount: 4,
                      //     maxAxisExtent: 80,
                      //     itemBuilder: (_, index) {
                      //       return const TBrandCard(
                      //         showBorder: false,
                      //       );
                      //     })
                    ],
                  ),
                ),
                bottom: TTabbar(
                    tabs: isEg
                        ? albums
                            .map((album) => Tab(child: Text(album.name)))
                            .toList()
                        : albums
                            .map((album) => Tab(child: Text(album.arabicName)))
                            .toList()),
              )
            ];
          },
          // ignore: prefer_const_constructors
          body: TabBarView(
              children: albums
                  .map((album) => TTabGalleryView(album: album))
                  .toList()),
        ),
      ),
    );
  }
}
