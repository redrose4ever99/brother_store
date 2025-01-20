import 'package:brother_store/data/repositoies/authentication/authentication_repository.dart';
import 'package:brother_store/data/repositoies/project/project_repository.dart';
import 'package:brother_store/features/authontication/controllers/network_manager.dart';
import 'package:brother_store/features/project/models/project_model.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/loader/loaders.dart';
import 'package:brother_store/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class ProjectController extends GetxController {
  static ProjectController get instance => Get.find();

  final name = TextEditingController();
  final description = TextEditingController();
  final quantity = TextEditingController();
  final city = TextEditingController();
  final country = TextEditingController();

  GlobalKey<FormState> projectFormKey = GlobalKey<FormState>();

  // final isLoading = false.obs;

  final projectRepository = Get.put(ProjectRepository());

  Future addNewProject() async {
    try {
      //start loading
      TFullScreenLoader.openloadingDialog(
          AppLocalizations.of(Get.context!)!.storingAddress,
          TImages.proccessLottie);

      // check the internet connectivity

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      // form validations
      if (!projectFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // save address data
      final project = ProjectModel(
        id: UniqueKey().toString(),
        uId: //'w0xDf8Cau2aqJrcH8vaaRYASY4I2',
            AuthenticationRepository.instance.authUser?.uid,
        name: name.text.trim(),
        state: 'pending',
        quantity: quantity.text.trim(),
        description: description.text.trim(),
        city: city.text.trim(),
        country: country.text.trim(),
      );

      await projectRepository.addProject(project);

      //remove loader
      TFullScreenLoader.stopLoading();

      //show success message

      TLoader.successSnackBar(
          title: AppLocalizations.of(Get.context!)!.congratulation,
          message: AppLocalizations.of(Get.context!)!.saveProjectMessage);

      //Refresh data

      //reset Field

      resetFormField();
      // redirect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoader.erroreSnackBar(
        title: 'error',
        message: e.toString(),
      );
    }
  }

  Future selectFile() async {}
  Future uploadFile() async {}

  Future<List<ProjectModel>> fetchUserProject() async {
    try {
      final userProjects = await projectRepository.fetchUserProjects();
      return userProjects;
    } catch (e) {
      TLoader.erroreSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  void resetFormField() {
    name.clear();
    description.clear();
    city.clear();
    country.clear();
    projectFormKey.currentState?.reset();
  }
}
