import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/data/repositoies/authentication/authentication_repository.dart';
import 'package:brother_store/features/project/screens/prices/add_new_price_request.dart';
import 'package:brother_store/utils/constants/color.dart';

import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iconsax/iconsax.dart';

import 'widgets/prices_list.dart';

class TPricesRequestScreen extends StatelessWidget {
  const TPricesRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Directionality(
      textDirection: Get.locale?.languageCode == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        floatingActionButton: !AuthenticationRepository.instance.isGust.value
            ? FloatingActionButton.extended(
                backgroundColor: dark ? TColors.dark : TColors.light,
                onPressed: () => Get.to(() => const AddNewPriceRequestScreen()),
                label: Text(
                  'Add Price Request',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                icon: const Icon(
                  Iconsax.dollar_circle,
                  color: TColors.primary,
                ),
              )
            : null,
        appBar: TAppBar(
          title: Text(
              'Prices Requests', //Text(AppLocalizations.of(context)!.myProjects,
              style: Theme.of(context).textTheme.headlineSmall),
          showBackArrow: true,
        ),
        body: const Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: TPricesList(),
        ),
      ),
    );
  }
}
