import 'package:brother_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle});
  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            SizedBox(
              width: THelperFunctions.screenwidth(),
              height: THelperFunctions.screenHeight(),
              //color: TColors.black.withOpacity(0.8),
              child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: image,
                  progressIndicatorBuilder: (_, __, downloadProgress) =>
                      Transform.scale(
                          scale: 0.1,
                          child: CircularProgressIndicator(
                            color: TColors.darkGrey.withOpacity(0.3),
                          ))),
            ),

            // image != ''
            //     ? NetworkImage(image) as ImageProvider
            //     : const AssetImage(TImages.bBlack),

            TRoundedContainer(
              radius: BorderRadius.circular(20),
              width: THelperFunctions.screenwidth(),
              height: THelperFunctions.screenHeight(),
              backgroundColor: TColors.black.withOpacity(0.3),
            ),
          ],
        ),
        // TRoundedContainer(
        //   child: Stack(
        //     children: [
        //       Image(
        //         fit: BoxFit.cover,
        //         width: THelperFunctions.screenwidth(),
        //         height: THelperFunctions.screenHeight(),
        //         image: image != ''
        //             ? NetworkImage(image) as ImageProvider
        //             : const AssetImage(TImages.bBlack),
        //       ),
        //       TRoundedContainer(
        //         width: THelperFunctions.screenwidth(),
        //         height: THelperFunctions.screenHeight(),
        //         backgroundColor: TColors.black.withOpacity(0.2),
        //       )
        //     ],
        //   ),
        // ),
        Positioned(
          bottom: 140,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: TSizes.spaceBtWItems,
                ),
                Text(
                  subTitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
