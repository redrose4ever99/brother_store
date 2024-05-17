import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InterviewRequestScreen extends StatelessWidget {
  const InterviewRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Get.locale?.languageCode == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        appBar: const TAppBar(
          title: Text('Interview Request'),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Form(
                child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.title),
                      labelText: 'Interview Title'),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone), labelText: 'Phone Number'),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email Address'),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),
                TextFormField(
                  maxLines: 3,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.description),
                      labelText: 'the purpose'),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text('Load Files')),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text('Send')),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
