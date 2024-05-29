import 'package:brother_store/common/widgets/layout/grid_layout.dart';
import 'package:brother_store/common/widgets/shimmers/calient_shimmer%20.dart';
import 'package:brother_store/common/widgets/texts/section_heading.dart';
import 'package:brother_store/features/shop/controllers/clients_controller.dart';
import 'package:brother_store/features/shop/models/clients_model.dart';
import 'package:brother_store/features/shop/screens/client_page.dart';
import 'package:brother_store/features/shop/screens/store/clients/all_clients.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_storage/get_storage.dart';

class THomeClient extends StatelessWidget {
  const THomeClient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ClientController());

    final List<ClientModel> featureClients = [];
    return Padding(
      padding: const EdgeInsets.only(
          left: TSizes.defaultSpace, right: TSizes.defaultSpace),
      child: Obx(() {
        featureClients.assignAll(
            controller.allClients.where((p0) => p0.isFeature).take(8));
        if (controller.isLoading.value) return const TClientShummer();
        if (featureClients.isEmpty) {
          return Center(
            child: Text(
              AppLocalizations.of(context)!.noData,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          );
        }

        // featureCategories.assignAll(allCategories
        //     .where((cat) => cat.isFeature && cat.parentId.isEmpty)
        //     .take(8)
        //     .toList());
        return TGridLayout(
            itemCount: featureClients.length,
            crossColumn: 4,
            maxAxisExtent: 50,
            itemBuilder: (_, index) {
              return GestureDetector(
                onTap: () => featureClients[index].showPhoto
                    ? Get.to(() => ClientScreen(client: featureClients[index]))
                    : {},
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CachedNetworkImage(
                      imageUrl: featureClients[index].thumbnail,
                      progressIndicatorBuilder: (_, __, DownloadProgress) =>
                          CircularProgressIndicator(
                            value: DownloadProgress.progress,
                            color: TColors.primary,
                          )),
                )),
              );
            });
      }),
    );
  }
}
