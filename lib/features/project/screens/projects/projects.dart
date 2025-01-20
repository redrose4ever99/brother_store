import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/data/repositoies/authentication/authentication_repository.dart';
import 'package:brother_store/features/project/screens/projects/add_new_project.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'widgets/projects_list.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Get.locale?.languageCode == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        floatingActionButton: !AuthenticationRepository.instance.isGust.value
            ? FloatingActionButton(
                backgroundColor: TColors.primary,
                onPressed: () => Get.to(() => const AddNewProjectScreen()),
                child: const Icon(
                  Iconsax.add,
                  color: TColors.white,
                ),
              )
            : null,
        appBar: TAppBar(
          title: Text(AppLocalizations.of(context)!.myProjects,
              style: Theme.of(context).textTheme.headlineSmall),
          showBackArrow: true,
        ),
        body: const Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: TProjectsListItem(),
        ),
      ),
    );
  }
}
