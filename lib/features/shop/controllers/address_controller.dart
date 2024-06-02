import 'package:brother_store/common/widgets/texts/section_heading.dart';
import 'package:brother_store/data/repositoies/address/address_repository.dart';
import 'package:brother_store/features/authontication/controllers/network_manager.dart';
import 'package:brother_store/features/personlization/screens/address/add_new_address.dart';
import 'package:brother_store/features/personlization/screens/address/widgets/single_address.dart';
import 'package:brother_store/features/shop/models/address_model.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/cloud_helper_function.dart';
import 'package:brother_store/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final country = TextEditingController();
  final details = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  // final isLoading = false.obs;
  final addressRepository = Get.put(AddressRepository());
  Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  RxBool refreshData = true.obs;
  // RxList<CategoryModel> featureCategories = <CategoryModel>[].obs;

  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      final addresses = await AddressRepository.instance.fetchUserAddress();
      selectedAddress.value = addresses.firstWhere(
          (element) => element.selectedAddress,
          orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      Get.snackbar(
          snackPosition: SnackPosition.BOTTOM,
          'address not found',
          e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedAddress(
            selectedAddress.value.id, false);
      }
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;
      await addressRepository.updateSelectedAddress(
          selectedAddress.value.id, true);
    } catch (e) {
      Get.snackbar(
          snackPosition: SnackPosition.BOTTOM,
          'error in selection ',
          e.toString());
    }
  }

  Future addNewAddress() async {
    try {
      //start loading
      TFullScreenLoader.openloadingDialog(
          AppLocalizations.of(Get.context!)!.storingAddress, TImages.bBlack);

      // check the internet connectivity

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      // form validations
      if (!addressFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // save address data
      final address = AddressModel(
          id: '',
          name: name.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          street: street.text.trim(),
          city: city.text.trim(),
          country: country.text.trim(),
          postalCode: postalCode.text.trim(),
          details: details.text.trim(),
          selectedAddress: true);

      final id = await addressRepository.addAddress(address);

      //update selected address status
      address.id = id;
      await selectAddress(address);

      //remove loader
      TFullScreenLoader.stopLoading();

      //show success message

      Get.snackbar(
          snackPosition: SnackPosition.BOTTOM,
          AppLocalizations.of(Get.context!)!.congratulation,
          AppLocalizations.of(Get.context!)!.saveAddressMessage);

      //Refresh data
      refreshData.toggle();

      //reset Field

      resetFormField();
      // redirect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      Get.snackbar(
        'error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void resetFormField() {
    name.clear();
    phoneNumber.clear();
    postalCode.clear();
    street.clear();
    city.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }

  Future<dynamic> selectNewAddressPopup(BuildContext context) {
    return showModalBottomSheet(
        //isScrollControlled: true,
        context: context,
        builder: (_) => SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(TSizes.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TSectionHeading(
                        showActionButton: false,
                        title: AppLocalizations.of(context)!.selectAddress),
                    const SizedBox(
                      height: TSizes.spaceBtwInputFields,
                    ),
                    FutureBuilder(
                        future: getAllUserAddresses(),
                        builder: (_, snapshot) {
                          final response =
                              TCloudHelperFunctions.checkMuiltiRecordState(
                                  snapshot: snapshot);
                          if (response != null) return response;

                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (_, index) => TSingleAddress(
                                    address: snapshot.data![index],
                                    onTap: () async {
                                      await selectAddress(
                                          snapshot.data![index]);
                                      Get.back();
                                    },
                                  ));
                        }),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () =>
                              Get.to(() => const AddNewAddressScreen()),
                          child: Text(
                              AppLocalizations.of(context)!.addNewAddress)),
                    )
                  ],
                ),
              ),
            ));
  }
}
