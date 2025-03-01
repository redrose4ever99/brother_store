import 'dart:io';

import 'package:brother_store/data/repositoies/authentication/authentication_repository.dart';
import 'package:brother_store/data/repositoies/project/ask_request_repository.dart';
import 'package:brother_store/features/authontication/controllers/network_manager.dart';
import 'package:brother_store/features/project/models/ask_request_model.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/loader/loaders.dart';
import 'package:brother_store/utils/popups/full_screen_loader.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../screens/prices/prices.dart';

class AskPriceController extends GetxController {
  static AskPriceController get instance => Get.find();
  final format = DateFormat("MM/dd/yyyy");
  final title = TextEditingController();
  final description = TextEditingController();
  final quantity = TextEditingController();
  final city = TextEditingController();
  final country = TextEditingController();

  final descriptions1 = TextEditingController();
  final estimatedDate = TextEditingController();
  final location = TextEditingController();
  final phoneNumber = TextEditingController();
  final address = TextEditingController();
  final company = TextEditingController();
  final productionBlueprints = TextEditingController();
  final projectCategory = TextEditingController();
  final assembly1 = TextEditingController();
  final assembly2 = TextEditingController();
  final proposedPrice = TextEditingController();
  final confirmation = TextEditingController();
  String urlDownload = 'none';
  String? phone;
  final RxList requests = [].obs;
  //final pickedFile = Rx<PlatformFile>(PlatformFile);
  final List<String> categoryItems = [
    'Expos, Window display',
    'Saudi Calendar Ventures',
    'Constructions',
    'Wedding Decorations',
    'Assorted 3d Modeling',
    'Exceptional artworks',
    'Miniature Creations',
    'CNC carve, cut,and shape',
    'Layout Design, Printing',
    'UnKnown'
  ];
  String? selectedValue;

  final Rx<PlatformFile?> pickedFile = PlatformFile(name: '', size: 0).obs;
  UploadTask? uploadTask;

  GlobalKey<FormState> askRequestFormKey = GlobalKey<FormState>();

  // final isLoading = false.obs;

  final requestRepository = Get.put(AskRequestRepository());

  Future addNewRequest() async {
    try {
      //start loading
      TFullScreenLoader.openloadingDialog(
          AppLocalizations.of(Get.context!)!.addPriceRequest,
          TImages.proccessLottie);

      // check the internet connectivity

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      // form validations
      if (!askRequestFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      if (urlDownload == '') {
        TLoader.warningSnackBar(
            title: AppLocalizations.of(Get.context!)!.info,
            message: 'Just wait a second to finish the file upload');
        TFullScreenLoader.stopLoading();
        return;
      }

      var price = proposedPrice.text == '' ? '0.00' : proposedPrice.text;
      if (kDebugMode) {
        print('compare');
        print(estimatedDate.text == '');
      }
      // save address data
      final request = AskRequestModel(
          id: UniqueKey().toString(),
          uId: //'w0xDf8Cau2aqJrcH8vaaRYASY4I2',
              AuthenticationRepository.instance.authUser?.uid,
          title: title.text.trim(),
          state: 'pending',
          quantity: quantity.text.trim(),
          description: description.text.trim(),
          company: company.text.trim(),
          description1: descriptions1.text.trim(),
          phoneNumber: phone,
          address: address.text.trim(),
          location: location.text.trim(),
          estimatedDate: format.parse(
              estimatedDate.text != '' ? estimatedDate.text : '01/01/2000'),
          productionBlueprints: productionBlueprints.text,
          projectCategory: projectCategory.text,
          assembly1: assembly1.text,
          assembly2: assembly2.text,
          proposedPrice: double.parse(price),
          confirmation: confirmation.text == 'true' ? true : false,
          files: [urlDownload.toString()]);

      await requestRepository.addAskRequest(request);

      //remove loader
      TFullScreenLoader.stopLoading();

      //show success message
      fetchUserRequest();
      TLoader.successSnackBar(
          title: AppLocalizations.of(Get.context!)!.congratulation,
          message: 'Request for price send successfully');

      //Refresh data

      //reset Field

      resetFormField();
      // redirect
      Get.to(const TPricesRequestScreen());
      // Navigator.of(Get.context!).pop();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoader.erroreSnackBar(
        title: 'error',
        message: e.toString(),
      );
    }
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (kDebugMode) {
      print("==================$result");
    }
    if (result == null) return;
    pickedFile.value = result.files.first;
    urlDownload = '';
  }

  Future uploadFile() async {
    final path = 'Price_request/${pickedFile.value!.name}';
    final file = File(pickedFile.value!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);

    uploadTask = ref.putFile(file);
    final snapshot = await uploadTask!.whenComplete(() {});
    urlDownload = await snapshot.ref.getDownloadURL();
    if (kDebugMode) {
      print('Download link =======:$urlDownload');
    }

    uploadTask = null;
  }

  Future<List<AskRequestModel>> fetchUserRequest() async {
    try {
      final requests = await requestRepository.fetchUserRequsts();
      return requests;
    } catch (e) {
      TLoader.erroreSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  void resetFormField() {
    title.clear();
    phoneNumber.clear();
    productionBlueprints.clear();
    projectCategory.clear();
    proposedPrice.clear();
    proposedPrice.text = '0.00';
    estimatedDate.clear();
    assembly2.clear();
    assembly1.clear();
    confirmation.clear();
    location.clear();
    address.clear();
    descriptions1.clear();
    description.clear();
    city.clear();
    country.clear();
    quantity.clear();
    company.clear();
    urlDownload = 'none';
    askRequestFormKey.currentState?.reset();
  }
}
