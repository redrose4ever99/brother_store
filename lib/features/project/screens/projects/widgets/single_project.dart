// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:brother_store/features/project/models/project_model.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/icons_string.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'payment_screen.dart';

class TSingleProjectScreen extends StatelessWidget {
  const TSingleProjectScreen({
    Key? key,
    required this.project,
  }) : super(key: key);
  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    RxInt activeStep = 0.obs;
    double completionRate = 0;
    final dark = THelperFunctions.isDarkMode(context);
    final isEg = Get.locale?.languageCode == 'en';
    double? payRate = 0;
    if (project.cost != null && project.cost != 0) {
      payRate = ((project.currentPaied! / project.cost!) * 100);
    }
    String inString = payRate.toStringAsFixed(2); // '2.35'
    payRate = double.parse(inString);

    // payRate = num.parse(payRate.toStringAsFixed(2)) as double?;

    switch (project.currentStage) {
      case ('Pending'):
        activeStep.value = 0;

        break;
      case ('Planing'):
        activeStep.value = 1;
        completionRate = 25 / 100;
        break;
      case ('Processing'):
        activeStep.value = 2;
        completionRate = 5 / 10;
        break;
      case ('Finishing'):
        activeStep.value = 3;
        completionRate = 75 / 100;
        break;
    }

    return Directionality(
      textDirection: isEg ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            'Project ',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: TColors.primary),
          ),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                Obx(
                  () => EasyStepper(
                    lineStyle: const LineStyle(
                        lineLength: 50,
                        lineSpace: 0,
                        lineType: LineType.normal,
                        defaultLineColor: TColors.darkGrey,
                        finishedLineColor: Colors.orange),
                    activeStep: activeStep.value,
                    enableStepTapping: false,
                    stepShape: StepShape.rRectangle,
                    stepBorderRadius: 15,
                    borderThickness: 2,
                    stepRadius: 28,
                    finishedStepBorderColor: TColors.primary,
                    finishedStepTextColor: TColors.primary,
                    finishedStepBackgroundColor:
                        TColors.primary.withOpacity(0.1),
                    activeStepIconColor: Colors.deepOrange,
                    showLoadingAnimation: false,
                    steps: [
                      EasyStep(
                        customStep: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Opacity(
                            opacity: activeStep.value >= 0 ? 1 : 0.3,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset(
                                TIcons.pendingIcon,
                                color: TColors.primary,
                              ),
                            ),
                          ),
                        ),
                        customTitle: Text(
                          AppLocalizations.of(context)!.pending,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      EasyStep(
                        customStep: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Opacity(
                            opacity: activeStep.value >= 1 ? 1 : 0.3,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset(
                                TIcons.planIcon,
                                color: TColors.primary,
                              ),
                            ),
                          ),
                        ),
                        customTitle: Text(
                          AppLocalizations.of(context)!.planing,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      EasyStep(
                        customStep: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Opacity(
                            opacity: activeStep.value >= 2 ? 1 : 0.3,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset(
                                TIcons.procesIcon,
                                color: TColors.primary,
                              ),
                            ),
                          ),
                        ),
                        customTitle: Text(
                          AppLocalizations.of(context)!.process,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      EasyStep(
                        customStep: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Opacity(
                            opacity: activeStep.value >= 3 ? 1 : 0.3,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset(
                                TIcons.finishIcon,
                                color: TColors.primary,
                              ),
                            ),
                          ),
                        ),
                        customTitle: Text(
                          AppLocalizations.of(context)!.delevering,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                    onStepReached: (index) => activeStep.value = index,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      const Text('Completion rate'),
                      const SizedBox(
                        width: TSizes.spaceBtWItems,
                      ),
                      LinearPercentIndicator(
                        width: 140.0,
                        animation: true,
                        lineHeight: 15.0,
                        animationDuration: 2000,
                        barRadius: const Radius.circular(20),
                        progressColor: TColors.primary,
                        percent: completionRate,
                        trailing: Text(
                          "$completionRate%",
                          style: TextStyle(fontSize: 12.0),
                        ),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        backgroundColor: Colors.grey,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtWItems,
                ),
                Stack(
                  children: [
                    TRoundedContainer(
                      showBorder: true,
                      padding: const EdgeInsets.all(TSizes.md),
                      backgroundColor: dark ? TColors.dark : TColors.light,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                AppLocalizations.of(context)!.projectTitle,
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              Text(
                                project.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .apply(color: TColors.primary),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: TSizes.spaceBtWItems,
                          ),
                          Text(
                            project.description,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: isEg ? 4 : null,
                      left: isEg ? null : 4,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: IconButton(
                          icon: const Icon(Iconsax.copy),
                          onPressed: () {
                            Clipboard.setData(ClipboardData(
                                text: project.description.toString()));
                            Get.snackbar('Copied!',
                                'project description copied to clipboard',
                                snackPosition: SnackPosition.BOTTOM);
                          },
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: TSizes.spaceBtWItems,
                ),
                TRoundedContainer(
                  showBorder: true,
                  padding: const EdgeInsets.all(TSizes.md),
                  backgroundColor: dark ? TColors.dark : TColors.light,
                  child: Column(
                    children: [
                      //completion Percentage

                      Column(
                        children: [
                          CircularPercentIndicator(
                            radius: 45.0,
                            animation: true,
                            animationDuration: 2000,
                            lineWidth: 10.0,
                            percent: payRate / 100,
                            center: Text('$payRate '),
                            progressColor: payRate < 50
                                ? Colors.red
                                : payRate < 75
                                    ? Colors.yellow
                                    : Colors.green,
                          ),
                          const SizedBox(
                            height: TSizes.spaceBtWItems,
                          ),
                          const Center(
                            child: Text('Payment rate'),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtWItems,
                      ),
                      const Center(
                          child: Text(
                              'You almost will finish the payment amounts')),
                      // TbillingPaymentSection(),
                      const SizedBox(
                        height: TSizes.spaceBtWItems,
                      ),
                      SizedBox(
                        width: 500,
                        child: Center(
                            child: ElevatedButton(
                                onPressed: () =>
                                    Get.to(() => const TPaymentScreen()),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text('Add pay amount '),
                                ))),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtWItems,
                ),
                Visibility(
                  visible: false,
                  child: TRoundedContainer(
                    showBorder: true,
                    padding: const EdgeInsets.all(TSizes.md),
                    backgroundColor: dark ? TColors.dark : TColors.light,
                    child: Column(
                      children: [
                        const Text('Here the time process'),
                        SizedBox(
                            width: 530,
                            height: 220,
                            child: SfCartesianChart(
                                title:
                                    ChartTitle(text: project.state.toString()),
                                primaryXAxis: CategoryAxis(),
                                series: <ChartSeries>[
                                  // Initialize line series
                                  LineSeries<ChartData, String>(
                                      color: TColors.primary,
                                      width: 5,
                                      dataSource: [
                                        // Bind data source
                                        ChartData(1, 'Pending'),
                                        ChartData(2, 'planing'),
                                        ChartData(2.5, 'Processing'),
                                        ChartData(2, 'finishing'),
                                      ],
                                      xValueMapper: (ChartData data, _) =>
                                          data.y,
                                      yValueMapper: (ChartData data, _) =>
                                          data.x)
                                ])
                            //     //////////////

                            ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //static RxInt currentStep = 0.obs;

  //static var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
}

class ChartData {
  ChartData(this.x, this.y);
  final double? x;
  final String y;
}
