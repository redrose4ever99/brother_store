import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/common/widgets/layout/grid_layout.dart';
import 'package:brother_store/common/widgets/shimmers/calient_shimmer%20.dart';
import 'package:brother_store/features/shop/controllers/clients_controller.dart';
import 'package:brother_store/utils/constants/color.dart';

import 'package:brother_store/utils/constants/sizes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class AllClientsScreen extends StatelessWidget {
  const AllClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ClientController.instance;
    return Directionality(
      textDirection: Get.locale?.languageCode == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            AppLocalizations.of(context)!.clients,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                // TSectionHeading(
                //     title: AppLocalizations.of(context)!.brand,
                //     showActionButton: false),
                const SizedBox(
                  height: TSizes.spaceBtWItems,
                ),
                Obx(() {
                  if (controller.isLoading.value) {
                    return TClientShummer(
                      itemCount: controller.allClients.length,
                    );
                  }
                  if (controller.allClients.isEmpty) {
                    return Center(
                      child: Text(
                        AppLocalizations.of(context)!.noData,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    );
                  }
                  return TGridLayout(
                      itemCount: controller.allClients.length,
                      crossColumn: 4,
                      maxAxisExtent: 100,
                      itemBuilder: (_, index) {
                        return Center(
                            child: Column(
                          children: [
                            SizedBox(
                              height: 75,
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: CachedNetworkImage(
                                    imageUrl:
                                        controller.allClients[index].thumbnail,
                                    progressIndicatorBuilder:
                                        (_, __, DownloadProgress) =>
                                            CircularProgressIndicator(
                                              value: DownloadProgress.progress,
                                              color: TColors.primary,
                                            )),
                              ),
                            ),
                            const SizedBox(
                              height: TSizes.spaceBtWItems / 4,
                            ),
                            Text(
                              controller.allClients[index].name ?? "",
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ],
                        ));
                      });
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
