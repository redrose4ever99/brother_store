import 'package:brother_store/common/widgets/texts/product_title_text.dart';
import 'package:brother_store/features/blog/model/blog_model.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:brother_store/common/widgets/custom_shapes/containers/rounded_container.dart';

class TBlogItem extends StatelessWidget {
  const TBlogItem({Key? key, required this.blog, required this.onTap})
      : super(key: key);

  final VoidCallback onTap;
  final BlogModel blog;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
            left: TSizes.defaultSpace, right: TSizes.defaultSpace),
        child: TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          width: double.infinity,
          showBorder: true,
          backgroundColor: Colors.transparent,
          borderColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGray
              : TColors.grey,
          margin: const EdgeInsets.only(bottom: TSizes.spaceBtWItems),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Expanded(child: Image(image: AssetImage(TImages.appleIcon))),

              CachedNetworkImage(
                imageBuilder: (context, imageProvider) => Container(
                  width: double.infinity,
                  height: 200,

                  //height: 110,
                  decoration: BoxDecoration(
                    // border:
                    //     Border.all(color: TColors.grey.withOpacity(0.4)),
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.contain),
                  ),
                ),
                imageUrl:
                    'https://firebasestorage.googleapis.com/v0/b/brothers-creative.appspot.com/o/gallery%2FAlbum2%2F4.PNG?alt=media&token=27fe4375-423a-4f85-bab6-2c0ce3ba7c63',
                placeholder: (context, url) => Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator()),
              ),
              const SizedBox(
                height: TSizes.sm * 2,
              ),
              Text(
                blog.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: TSizes.sm / 2,
              ),
              TProductTitleText(
                title: blog.auther,
                smalSize: true,
                maxLines: 2,
              ),
              const SizedBox(
                height: TSizes.sm / 2,
              ),
              Text(
                blog.details,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
