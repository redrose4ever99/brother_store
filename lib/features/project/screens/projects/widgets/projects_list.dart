import 'package:brother_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProjectsListItem extends StatelessWidget {
  const TProjectsListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 6,
      separatorBuilder: (_, __) => const SizedBox(
        height: TSizes.spaceBtWItems,
      ),
      itemBuilder: (_, index) => TRoundedContainer(
          showBorder: true,
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.dark : TColors.light,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Iconsax.ship),
                const SizedBox(width: TSizes.spaceBtWItems / 2),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Starting',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: TColors.primary, fontWeightDelta: 1),
                    ),
                    Text('13 Oct 2024',
                        style: Theme.of(context).textTheme.headlineSmall),
                  ],
                )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Iconsax.arrow_right_34,
                      size: TSizes.iconSm,
                    ))
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtWItems,
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Iconsax.tag),
                      const SizedBox(width: TSizes.spaceBtWItems / 2),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'contract',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(fontWeightDelta: 1),
                          ),
                          Text('#341/34',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      )),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Iconsax.tag),
                      const SizedBox(width: TSizes.spaceBtWItems / 2),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Deliverd Date',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(fontWeightDelta: 1),
                          ),
                          Text('25 Oct 2024',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ])),
    );
  }
}
