import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectModel {
  final String id;
  String? uId;
  final String name;
  final String description;
  final String quantity;
  final String city;
  final String country;
  String? state;

  final DateTime? dateTime;
  ProjectModel({
    required this.id,
    required this.uId,
    required this.name,
    required this.state,
    required this.description,
    required this.quantity,
    required this.city,
    required this.country,
    this.dateTime,
  });
  String get formattedStartDate => THelperFunctions.getFormattedDate(dateTime!);
  static ProjectModel empty() => ProjectModel(
        id: '',
        uId: '',
        name: '',
        state: '',
        city: '',
        country: '',
        quantity: '',
        description: '',
      );

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'UId': uId ?? '',
      'State': state ?? '',
      'Name': name,
      'Description': description,
      'Quantity': quantity,
      'City': city,
      'Country': country,
      'DateTime': DateTime.now()
    };
  }

  factory ProjectModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      return ProjectModel(
        id: data['Id'] ?? '',
        uId: data['UId'] ?? '',
        state: data['State'] ?? '',
        name: data['Name'] ?? '',
        description: data['Description'] ?? '',
        quantity: data['Quantity'] ?? '',
        city: data['City'] ?? '',
        country: data['Country'] ?? '',
        //dateTime: (data['DateTime'] as Timestamp).toDate(),
      );
    }
    return ProjectModel.empty();
  }

  factory ProjectModel.fromMap(Map<String, dynamic> data) {
    return ProjectModel(
      id: data['Id'] as String,
      uId: data['UId'] as String,
      state: data['State'] as String,
      name: data['Name'] as String,
      description: data['Description'] as String,
      quantity: data['Quantity'] as String,
      city: data['City'] as String,
      country: data['Country'] as String,
      dateTime: (data['DateTime'] as Timestamp).toDate(),
    );
  }

  factory ProjectModel.fromDocumentSnapShot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return ProjectModel(
      id: data['Id'] ?? '',
      uId: data['UId'] ?? '',
      state: data['State'] ?? '',
      name: data['Name'] ?? '',
      description: data['Description'] ?? '',
      quantity: data['Quantity'] ?? '',
      city: data['City'] ?? '',
      country: data['Country'] ?? '',
      dateTime: (data['DateTime'] as Timestamp).toDate(),
    );
  }
}
