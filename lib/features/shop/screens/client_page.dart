// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:brother_store/common/widgets/images/rounded_image.dart';
import 'package:brother_store/common/widgets/layout/grid_gallery_layout.dart';
import 'package:brother_store/features/shop/controllers/product/images_controller.dart';
import 'package:flutter/material.dart';
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
    final imageController = Get.put(ImagesController());
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
          body: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: TGridGalleryLayout(
                itemCount: client.images!.length,
                itemBuilder: (_, index) => GestureDetector(
                      onTap: () => imageController.showEnLargedImage(
                          client.images![index], '', ''),
                      child: TRoundedImage(
                        imageUrl: client.images![index],
                        fit: BoxFit.cover,
                        isNetworkImage: true,
                      ),
                    )),
          ),
        ));
  }
}
/////////////
