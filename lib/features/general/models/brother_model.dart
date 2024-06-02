class Brother {
  String name;
  String arabicName;
  String aboutUs;
  String arabicAboutUs;
  String cancellationPolicy;
  String arabicCancellationPolicy;
//ArabicCancellationPolicy
  List<String> phoneNumbers;
  Brother(
      {required this.name,
      required this.arabicName,
      required this.aboutUs,
      required this.arabicAboutUs,
      required this.cancellationPolicy,
      required this.arabicCancellationPolicy,
      required this.phoneNumbers});

  toJson() {
    return {
      'Name': name,
      'ArabicName': arabicName,
      'ArabicCancellationPolicy': arabicCancellationPolicy,
      'CancellationPolicy': cancellationPolicy,
      'AboutUs': aboutUs,
      'ArabicAboutUs': arabicAboutUs,
      'PhoneNumbers': phoneNumbers
    };
  }
}
