import 'package:brother_store/data/repositoies/authentication/authentication_repository.dart';
import 'package:brother_store/features/shop/models/address_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  Future<List<AddressModel>> fetchUserAddress() async {
    try {
      // const userId = 'EyTbtgIxRwamzlhsPnSs4lehlcc2';
      var userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) {
        throw 'Unable to find user information. try again later';
      }
      final result = await _db
          .collection('Users')
          .doc(userId)
          .collection('Addresses')
          .get();
      return result.docs
          .map((e) => AddressModel.fromDocumentSnapShot(e))
          .toList();
    } catch (e) {
      throw 'Something wrong while fetch data';
    }
  }

  ///clear the selected address for all addresses

  Future<void> updateSelectedAddress(String addressId, bool selected) async {
    try {
      //const userId = 'EyTbtgIxRwamzlhsPnSs4lehlcc2';
      final userId = AuthenticationRepository.instance.authUser!.uid;
      await _db
          .collection('Users')
          .doc(userId)
          .collection('Addresses')
          .doc(addressId)
          .update({'SelectedAddress': selected});
    } catch (e) {
      throw 'wwwwwwwwwwwwwwrrrrrrrrrrrrrooooooooonnnnnnnnnnnggggggggg';
    }
  }

  Future<String> addAddress(AddressModel address) async {
    try {
      var userId = //'EyTbtgIxRwamzlhsPnSs4lehlcc2';
          AuthenticationRepository.instance.authUser!.uid;
      final currentAddress = await _db
          .collection('Users')
          .doc(userId)
          .collection('Addresses')
          .add(address.toJson());
      if (kDebugMode) {
        print('currentAddress $currentAddress.id');
      }
      return currentAddress.id;
    } catch (e) {
      throw 'Some thing wrong while saving address';
    }
  }
}
