import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/blog_item.dart';
import 'widgets/single_blog.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Get.locale?.languageCode == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        appBar: TAppBar(
          showBackArrow: true,
          title: Text(
            'Blog',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                TBlogItem(
                  onTap: () => Get.to(() => const TSingleBlog()),
                  selectedAddress: false,
                ),
                TBlogItem(
                  onTap: () => Get.to(() => const TSingleBlog()),
                  selectedAddress: true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
