// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({
    Key? key,
    required this.data,
    required this.title,
  }) : super(key: key);
  final String data;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Get.locale?.languageCode == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          showBackArrow: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
              // image: DecorationImage(
              //   image: AssetImage(TImages.arWord),
              //   fit: BoxFit.cover,
              // ),
              ),
          child: Stack(
            children: [
              Container(
                color: Theme.of(context).primaryColor.withOpacity(.1),
              ),
              SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: Text(
                      data,
                      maxLines: 200,
                      style: Theme.of(context).textTheme.bodyMedium,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
