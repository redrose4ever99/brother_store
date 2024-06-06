// ignore_for_file: public_member_api_docs, sort_constructors_first
import "package:brother_store/features/general/controllers/brother_controller.dart";
import "package:brother_store/utils/helpers/helper_functions.dart";
import "package:flutter/material.dart";

import "package:brother_store/common/widgets/custom_shapes/containers/circuler_container.dart";
import "package:brother_store/common/widgets/custom_shapes/curved_edges/curved_edge_widget.dart";
import "package:brother_store/utils/constants/color.dart";
import 'package:string_to_color/string_to_color.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final controller = BrothersController.instance;
    final strColor = controller.allData[0].primaryColor;
    // brotherData[0].termsCondition
    return TCurvedEdgesWidget(
        child: Container(
            color: THelperFunctions.isDarkMode(context)
                ? TColors.darkerGray
                : ColorUtils.stringToColor(strColor),
            padding: const EdgeInsets.all(0),
            child: SizedBox(
              child: Stack(
                children: [
                  Positioned(
                    top: -150,
                    right: -250,
                    child: TCirculerContainer(
                      backgroundColor: TColors.textWhite.withOpacity(0.1),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    right: -300,
                    child: TCirculerContainer(
                      backgroundColor: TColors.textWhite.withOpacity(0.1),
                    ),
                  ),
                  child,
                ],
              ),
            )));
  }
}
