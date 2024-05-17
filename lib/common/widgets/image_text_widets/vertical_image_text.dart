import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor,
    this.backgroundColor,
    this.onTap,
  });
  final String image, title;
  final Color? textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
            right: TSizes.spaceBtWItems / 1.5,
            left: TSizes.spaceBtWItems / 1.5),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              padding: const EdgeInsets.all(TSizes.md),
              decoration: BoxDecoration(
                  color:
                      backgroundColor ?? (dark ? TColors.white : TColors.white),
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtWItems / 2,
            ),
            Wrap(children: [
              SizedBox(
                width: 90,
                child: Text(
                  title,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .apply(color: TColors.white),
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
