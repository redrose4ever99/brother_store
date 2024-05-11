import 'package:brother_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'subtotal',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text('\$256', style: Theme.of(context).textTheme.bodyLarge)
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtWItems / 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Shipping free',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text('\$6.0', style: Theme.of(context).textTheme.bodyLarge)
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtWItems / 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Order Total',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text('\$230.0', style: Theme.of(context).textTheme.bodyLarge)
          ],
        ),
      ],
    );
  }
}
