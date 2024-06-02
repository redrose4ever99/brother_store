// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:brother_store/utils/constants/color.dart';
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
                    width: 250,
                    child: OutlinedButton(
                        onPressed: onActionPressed,
                        style: OutlinedButton.styleFrom(
                            backgroundColor: TColors.dark),
                        child: Text(
                          actionText!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .apply(color: TColors.light),
                        )),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
