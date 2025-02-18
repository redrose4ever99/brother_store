import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TAlbumTitle extends StatelessWidget {
  const TAlbumTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: THelperFunctions.screenwidth(),
          height: 100,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: TColors.primary.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              color: TColors.primary,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(100),
                  bottomLeft: Radius.circular(100))),
        ),
        Container(
          width: THelperFunctions.screenwidth(),
          height: 85,
          decoration: const BoxDecoration(
              color: TColors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  bottomLeft: Radius.circular(100))),
        ),
        Container(
          width: THelperFunctions.screenwidth(),
          height: 70,
          decoration: BoxDecoration(
              color: TColors.black.withOpacity(0.7),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(100),
                  bottomLeft: Radius.circular(100))),
        ),
        Positioned(
            bottom: 45,
            left: 20,
            right: 10,
            child: Text(
              AppLocalizations.of(context)!.albumMessage,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.white),
            ))
      ],
    );
  }
}
