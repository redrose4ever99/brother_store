import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:brother_store/common/widgets/texts/product_title_text.dart';
import 'package:brother_store/features/blog/model/blog_model.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TSingleBlog extends StatelessWidget {
  const TSingleBlog({
    super.key,
    required this.blog,
  });
  final BlogModel blog;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Article title'),
        showBackArrow: true,
      ),
      body: TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.md),
        width: double.infinity,
        // showBorder: true,
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.only(bottom: TSizes.spaceBtWItems),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Expanded(child: Image(image: AssetImage(TImages.appleIcon))),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Image(
                  image: NetworkImage(
                      "data:image/jpeg;base64,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"),
                  //width: 150,
                  fit: BoxFit.contain),
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
              maxLines: 100,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
