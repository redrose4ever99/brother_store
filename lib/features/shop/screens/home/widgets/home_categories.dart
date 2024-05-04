import 'package:brother_store/common/widgets/image_text_widets/vertical_image_text.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 16,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return TVerticalImageText(
                image: TImages.categoryIcon,
                title: 'sofaiate',
                onTap: () {},
              );
            }));
  }
}
