// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:brother_store/features/project/screens/projects/widgets/payment_screen.dart';
import 'package:brother_store/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/icons_string.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:brother_store/features/project/models/project_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TSinglePriceRequestScreen extends StatelessWidget {
  TSinglePriceRequestScreen({
    Key? key,
    required this.project,
  }) : super(key: key);
  final ProjectModel project;
  @override
  Widget build(BuildContext context) {
    //final controller = BrandController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    RxInt activeStep = 0.obs;
    return Directionality(
      textDirection: Get.locale?.languageCode == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
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
        body:
            //  Stepper(
            //   type: StepperType.vertical,
            //   steps: getSteps(),
            //   currentStep: currentStep.value,
            //   onStepCancel: null,
            //   onStepContinue: null,
            // ),

            SingleChildScrollView(
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
                      Text('Completion rate'),
                      SizedBox(
                        width: TSizes.spaceBtWItems,
                      ),
                      LinearPercentIndicator(
                        width: 140.0,
                        animation: true,
                        lineHeight: 15.0,
                        animationDuration: 2000,
                        barRadius: Radius.circular(20),
                        progressColor: TColors.primary,
                        percent: 0.9,
                        center: Text(
                          "90.0%",
                          style: new TextStyle(fontSize: 12.0),
                        ),
                        trailing: Icon(Icons.mood),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        backgroundColor: Colors.grey,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: TSizes.spaceBtWItems,
                ),
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
                            percent: 0.90,
                            center: const Text("90%"),
                            progressColor: Colors.green,
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
                TRoundedContainer(
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
                              title: ChartTitle(text: project.state.toString()),
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
                                    xValueMapper: (ChartData data, _) => data.y,
                                    yValueMapper: (ChartData data, _) => data.x)
                              ])
                          //     //////////////

                          ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  RxInt currentStep = 0.obs;
  var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
  List<Step> getSteps() => [
        Step(
            isActive: currentStep.value >= 0,
            content: //
                SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        project.description,
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtWItems,
                    ),
                    SizedBox(
                      width: 230,

                      child: Sparkline(
                        data: data,
                      ), //////////////
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtWItems,
                    ),
                    SizedBox(
                        width: 230,
                        height: 220,
                        child: SfCartesianChart(
                            title: ChartTitle(text: project.state.toString()),
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
                                    ChartData(3, 'Processing'),
                                    ChartData(4, 'finishing'),
                                  ],
                                  xValueMapper: (ChartData data, _) => data.y,
                                  yValueMapper: (ChartData data, _) => data.x)
                            ])
                        //     //////////////

                        ),
                    const SizedBox(
                      height: TSizes.spaceBtWItems,
                    ),
                    // Center(
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(TSizes.md),
                    //     child: GFProgressBar(
                    //       percentage: 0.7,
                    //       width: 100,
                    //       radius: 100,
                    //       backgroundColor: Colors.black38,
                    //       progressBarColor: TColors.primary,
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
            title: Text('Pending',
                style: Theme.of(Get.context!)
                    .textTheme
                    .labelMedium!
                    .apply(color: TColors.primary))),
        Step(
            isActive: currentStep.value >= 1,
            content: Container(),
            title: Text('Analizing',
                style: Theme.of(Get.context!)
                    .textTheme
                    .labelMedium!
                    .apply(color: TColors.primary))),
        Step(
            isActive: currentStep.value >= 2,
            content: Container(),
            title: Text('Processing',
                style: Theme.of(Get.context!)
                    .textTheme
                    .labelMedium!
                    .apply(color: TColors.primary))),
        Step(
            isActive: currentStep.value >= 3,
            content: Container(),
            title: Text('fineshing',
                style: Theme.of(Get.context!)
                    .textTheme
                    .labelMedium!
                    .apply(color: TColors.primary))),
        Step(
            isActive: currentStep.value >= 3,
            content: Container(),
            title: Text('fineshing',
                style: Theme.of(Get.context!)
                    .textTheme
                    .labelMedium!
                    .apply(color: TColors.primary))),
        Step(
            isActive: currentStep.value >= 3,
            content: Container(),
            title: Text('fineshing',
                style: Theme.of(Get.context!)
                    .textTheme
                    .labelMedium!
                    .apply(color: TColors.primary)))
      ];
}

class ChartData {
  ChartData(this.x, this.y);
  final double? x;
  final String y;
}
