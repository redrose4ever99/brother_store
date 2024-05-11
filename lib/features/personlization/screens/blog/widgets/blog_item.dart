// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import 'package:brother_store/common/widgets/custom_shapes/containers/rounded_container.dart';

class TBlogItem extends StatelessWidget {
  const TBlogItem(
      {Key? key, required this.selectedAddress, required this.onTap})
      : super(key: key);
  final bool selectedAddress;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.md),
        width: double.infinity,
        showBorder: true,
        backgroundColor: Colors.transparent,
        borderColor: selectedAddress
            ? Colors.transparent
            : THelperFunctions.isDarkMode(context)
                ? TColors.darkerGray
                : TColors.grey,
        margin: const EdgeInsets.only(bottom: TSizes.spaceBtWItems),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Folow the real smart disitions in art',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: TSizes.sm / 2,
            ),
            const Text(
              'auther Winto',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: TSizes.sm / 2,
            ),
            const Text(
              'Esse nostrud consectetur cupidatat ad in anim magna esse aliqua aute excepteur.',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
