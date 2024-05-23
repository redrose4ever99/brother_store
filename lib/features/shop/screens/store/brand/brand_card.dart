// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:brother_store/features/shop/models/brand_model.dart';
import 'package:flutter/material.dart';

import 'package:brother_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:brother_store/common/widgets/images/circular_image.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/image_strings.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    Key? key,
    required this.showBorder,
    required this.brand,
    this.onTap,
  }) : super(key: key);
  final BrandModel brand;
  final bool showBorder;

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TRoundedContainer(
          showBorder: showBorder,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkContainer
              : TColors.lightContainer,
          child: Row(
            children: [
              Flexible(
                child: TCircularImage(
                    image:
                        brand.image == '' ? TImages.brandImage1 : brand.image,
                    isNetworkImage: brand.image == '' ? false : true,
                    backgroundColor: Colors.transparent),
              ),
              const SizedBox(height: TSizes.spaceBtWItems / 2),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(brand.name),
                    Text(
                      ' ${brand.productCount ?? 0} Product ',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
