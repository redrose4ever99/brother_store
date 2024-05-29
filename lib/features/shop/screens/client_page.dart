// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:brother_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:brother_store/common/widgets/texts/section_heading.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/features/shop/models/clients_model.dart';
import 'package:brother_store/utils/constants/sizes.dart';

class ClientScreen extends StatelessWidget {
  const ClientScreen({
    Key? key,
    required this.client,
  }) : super(key: key);
  final ClientModel client;
  @override
  Widget build(BuildContext context) {
    //final controller = BrandController.instance;
    return Directionality(
      textDirection: Get.locale?.languageCode == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            Get.locale?.languageCode == 'en'
                ? client.name ?? 'Client'
                : client.arabicName ?? 'عميل',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          showBackArrow: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: client.images!.length,
              separatorBuilder: (_, __) => const SizedBox(
                    height: 1,
                  ),
              itemBuilder: (_, index) {
                return TRoundedContainer(
                  width: double.infinity,
                  child: CachedNetworkImage(
                      imageUrl: client.images![index],
                      progressIndicatorBuilder: (_, __, DownloadProgress) =>
                          CircularProgressIndicator(
                            value: DownloadProgress.progress,
                            color: TColors.primary,
                          )),
                );
              }),
        ),
      ),
    );
  }
}
/////////////
