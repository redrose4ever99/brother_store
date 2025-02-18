import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/blog_items.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Get.locale?.languageCode == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: const Scaffold(
        appBar: TAppBar(
          showBackArrow: true,
          title: Text(
            'Blog',
          ),
        ),
        body: BlogItems(),
      ),
    );
  }
}
