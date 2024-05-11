import 'package:brother_store/common/widgets/texts/section_heading.dart';
import 'package:brother_store/features/personlization/screens/address/address.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    //final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'change',
          showActionButton: true,
          onPress: () => Get.to(() => const UserAdressScreen()),
        ),
        const SizedBox(
          height: TSizes.spaceBtWItems / 2,
        ),
        Row(
          children: [
            const Icon(
              Icons.phone,
              size: 20,
            ),
            const SizedBox(
              width: TSizes.spaceBtWItems,
            ),
            Text('+963941141460', style: Theme.of(context).textTheme.bodyLarge)
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtWItems / 2,
        ),
        Row(
          children: [
            const Icon(
              Icons.location_history,
              size: 20,
            ),
            const SizedBox(
              width: TSizes.spaceBtWItems,
            ),
            Expanded(
                child: Text(
              'Consequat pariatur elit Lorem sunt laboris officia amet ex do proident qui voluptate duis ea.Sit ullamco eiusmod excepteur adipisicing aliquip nostrud nostrud sit Lorem in.Enim irure occaecat reprehenderit exercitation irure aute aliquip incididunt in reprehenderit.',
              style: Theme.of(context).textTheme.bodyMedium,
              softWrap: true,
            ))
          ],
        )
      ],
    );
  }
}
