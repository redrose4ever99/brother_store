import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
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
