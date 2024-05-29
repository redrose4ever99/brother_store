import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? firstName;
  String? lastName;
  String? email;

  String? id;
  String? phoneNumber;
  String profilePicture;

  UserModel(
      {this.firstName,
      this.lastName,
      this.phoneNumber,
      this.email,
      this.id,
      this.profilePicture = ''});

  String get fullName => '$firstName $lastName';
  static UserModel empty() => UserModel(
      id: '',
      firstName: '',
      lastName: '',
      phoneNumber: '',
      profilePicture: '',
      email: '');

  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
      'Email': email
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      return UserModel(
        id: document.id,
        firstName: data['FirstName'],
        lastName: data['LastName'],
        email: data['Email'],
        phoneNumber: data['PhoneNumber'],
        profilePicture: data['ProfilePicture'],
      );
    }
    return UserModel.empty();
  }
}
