import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.borderColor,
    this.isNetworkImage = false,
    this.textColor,
    this.backgroundColor,
    this.onTap,
  });
  final String image, title;
  final Color? textColor;
  final bool isNetworkImage;

  final Color? backgroundColor;
  final Color? borderColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
            right: TSizes.spaceBtWItems / 2.5,
            left: TSizes.spaceBtWItems / 2.5),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              padding: const EdgeInsets.all(TSizes.md),
              decoration: BoxDecoration(
                  border: Border.all(color: borderColor ?? Colors.transparent),
                  color:
                      backgroundColor ?? (dark ? TColors.white : TColors.white),
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Image(
                  image: isNetworkImage
                      ? NetworkImage(image)
                      : AssetImage(image) as ImageProvider,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtWItems / 2,
            ),
            Wrap(children: [
              SizedBox(
                width: 92,
                child: Center(
                  child: Text(
                    title,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .apply(color: textColor),
                  ),
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
