import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TAnimationLoaderWidget extends StatelessWidget {
  const TAnimationLoaderWidget({
    Key? key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  }) : super(key: key);

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image(image: AssetImage(animation)),
            // Lottie.network(
            //     'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),
            const SizedBox(
              height: TSizes.appBarHeight,
            ),
            Lottie.asset(animation,
                width: THelperFunctions.screenwidth() * 0.5),
            const SizedBox(
              height: TSizes.defaultSpace,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: TSizes.defaultSpace,
            ),
            showAction
                ? SizedBox(
                    width: 270,
                    child: OutlinedButton(
                        onPressed: onActionPressed,
                        child: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Center(
                            child: Text(
                              actionText!,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        )),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
