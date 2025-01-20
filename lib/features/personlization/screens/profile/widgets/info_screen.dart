import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/features/personlization/controllers/update_name_controller.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iconsax/iconsax.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key, required this.info, required this.title});
  final String title;
  final String info;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Directionality(
      textDirection: Get.locale?.languageCode == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          showBackArrow: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                Text(info, style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(
                  height: TSizes.spaceBtWsections,
                ),
              ],
            )),
      ),
    );
  }
}
//////////////
