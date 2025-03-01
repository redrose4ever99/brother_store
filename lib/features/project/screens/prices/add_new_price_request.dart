import 'package:brother_store/common/widgets/appbar/appbar.dart';
import 'package:brother_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:brother_store/features/project/controllers/ask_price_controller.dart';
import 'package:brother_store/utils/constants/color.dart';
import 'package:brother_store/utils/constants/sizes.dart';
import 'package:brother_store/utils/helpers/helper_functions.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:flutter_phone_number_field/flutter_phone_number_field.dart';
import 'widgets/round_checkbox.dart';

class AddNewPriceRequestScreen extends StatelessWidget {
  const AddNewPriceRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = AskPriceController.instance;
    // controller.proposedPrice.text = '0.00';

    return Directionality(
      textDirection: Get.locale?.languageCode == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(AppLocalizations.of(context)!.addPriceRequest),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace / 1.4),
            child: Form(
                key: controller.askRequestFormKey,
                child: Obx(
                  () => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(AppLocalizations.of(context)!.priceRequestText,
                                style: Theme.of(context).textTheme.bodyLarge,
                                textAlign: TextAlign.justify),
                            const SizedBox(
                              height: TSizes.spaceBtwInputFields,
                            ),
                            const Divider(
                              color: TColors.primary,
                            ),
                            const SizedBox(
                              height: TSizes.spaceBtwInputFields / 2,
                            ),
                            TRoundedContainer(
                              enableShadow: true,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              //borderColor: TColors.primary.withOpacity(0.1),
                              // showBorder: true,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Text(
                                        AppLocalizations.of(context)!
                                            .personalInformation,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge!
                                            .copyWith(color: TColors.primary),
                                        textAlign: TextAlign.justify),
                                    const SizedBox(
                                      height: TSizes.spaceBtwInputFields,
                                    ),
                                    Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: FlutterPhoneNumberField(
                                          controller: controller.phoneNumber,
                                          textAlign: TextAlign.left,
                                          focusNode: FocusNode(),
                                          initialCountryCode: "SA",
                                          pickerDialogStyle: PickerDialogStyle(
                                            countryFlagStyle:
                                                const TextStyle(fontSize: 17),
                                          ),
                                          decoration: InputDecoration(
                                            // prefixIcon: Icon(Icons.phone),
                                            labelText:
                                                AppLocalizations.of(context)!
                                                    .phoneNumber,
                                            //alignLabelWithHint: true,
                                            // border: OutlineInputBorder(
                                            //   borderSide: BorderSide(),
                                            // ),
                                          ),
                                          languageCode:
                                              Get.locale?.languageCode ?? 'en',
                                          onChanged: (phone) => controller
                                              .phone = phone.completeNumber),
                                    ),
                                    const SizedBox(
                                      height: TSizes.spaceBtwInputFields,
                                    ),
                                    TextFormField(
                                      controller: controller.company,
                                      decoration: InputDecoration(
                                          prefixIcon:
                                              const Icon(Iconsax.building),
                                          labelText:
                                              AppLocalizations.of(context)!
                                                  .yourCompany),
                                    ),
                                    const SizedBox(
                                      height: TSizes.spaceBtwInputFields,
                                    ),
                                    TextFormField(
                                      controller: controller.address,
                                      decoration: InputDecoration(
                                          prefixIcon:
                                              const Icon(Iconsax.location),
                                          labelText:
                                              AppLocalizations.of(context)!
                                                  .yourAddress),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: TSizes.spaceBtwInputFields / 2,
                            ),
                            const Divider(
                              color: TColors.primary,
                            ),
                            const SizedBox(
                              height: TSizes.spaceBtwInputFields / 2,
                            ),

                            TRoundedContainer(
                              enableShadow: true,
                              //borderColor: TColors.primary.withOpacity(0.1),
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    Text(
                                        AppLocalizations.of(context)!
                                            .projectInfo,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge!
                                            .copyWith(color: TColors.primary),
                                        textAlign: TextAlign.justify),
                                    const SizedBox(
                                      height: TSizes.spaceBtwInputFields,
                                    ),
                                    const Text('Work Type /Project name'),
                                    const SizedBox(
                                      height: TSizes.spaceBtwInputFields / 2,
                                    ),
                                    TextFormField(
                                      controller: controller.title,
                                      decoration: const InputDecoration(
                                          prefixIcon: Icon(Iconsax.text),
                                          labelText: 'Project Title'),
                                    ),
                                    const SizedBox(
                                      height: TSizes.spaceBtwInputFields,
                                    ),
                                    const Text(
                                        'Delivery location for off-factory site'),
                                    const SizedBox(
                                      height: TSizes.spaceBtwInputFields / 2,
                                    ),
                                    TextFormField(
                                      controller: controller.location,
                                      decoration: const InputDecoration(
                                          prefixIcon: Icon(Iconsax.location4),
                                          labelText: 'Project Location'),
                                    ),
                                    const SizedBox(
                                      height: TSizes.spaceBtwInputFields,
                                    ),
                                    DateTimeField(
                                      controller: controller.estimatedDate,
                                      decoration: const InputDecoration(
                                          prefixIcon:
                                              Icon(Icons.date_range_rounded),
                                          labelText: 'Estimated Date'),
                                      format: controller.format,
                                      onShowPicker: (context, currentValue) {
                                        return showDatePicker(
                                          context: context,
                                          firstDate: DateTime(1900),
                                          initialDate:
                                              currentValue ?? DateTime.now(),
                                          lastDate: DateTime(2100),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: TSizes.spaceBtwInputFields / 2,
                            ),
                            const Divider(
                              color: TColors.primary,
                            ),
                            const SizedBox(
                              height: TSizes.spaceBtwInputFields / 2,
                            ),

                            TRoundedContainer(
                              enableShadow: true,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    Text('Work Details',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge!
                                            .copyWith(color: TColors.primary),
                                        textAlign: TextAlign.justify),
                                    const SizedBox(
                                      height: TSizes.spaceBtwInputFields,
                                    ),
                                    Text(
                                      'Kindly select the appropriate option that best describes your work or project requirements',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),

                                    const SizedBox(
                                      height: TSizes.spaceBtwInputFields,
                                    ),
                                    //

                                    const Text(
                                        'Description of Project (Explaination), Shape, Dimensions, Color, Decoration, Structural Engineering, Your Vision.'),
                                    const SizedBox(
                                      height: TSizes.spaceBtwInputFields / 2,
                                    ),
                                    TextFormField(
                                      maxLines: 3,
                                      controller: controller.description,
                                      decoration: InputDecoration(
                                          prefixIcon:
                                              const Icon(Icons.description),
                                          labelText:
                                              AppLocalizations.of(context)!
                                                  .descriptions),
                                    ),
                                    const SizedBox(
                                      height: TSizes.spaceBtwInputFields,
                                    ),
                                    const Text(
                                        'Provide us with Production blueprints or genuine samples. Please choose one:'),

                                    const SizedBox(
                                      height: TSizes.spaceBtwInputFields / 2,
                                    ),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TRounsCheckBox(
                                              onTap: (isCheck) {
                                                if (isCheck!) {
                                                  controller
                                                          .productionBlueprints
                                                          .text =
                                                      'Provided example';
                                                }
                                              },
                                              text: 'Provided example',
                                            ),
                                            const SizedBox(
                                              height:
                                                  TSizes.spaceBtwInputFields,
                                            ),
                                            TRounsCheckBox(
                                                onTap: (isCheck) {
                                                  if (isCheck!) {
                                                    controller
                                                        .productionBlueprints
                                                        .text = 'Both';
                                                  }
                                                },
                                                text: 'Both'),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TRounsCheckBox(
                                                onTap: (isCheck) {
                                                  if (isCheck!) {
                                                    controller
                                                        .productionBlueprints
                                                        .text = 'File via email';
                                                  }
                                                },
                                                // isChecked: controller
                                                //         .productionBlueprints ==
                                                //     'File via email',
                                                text: 'File via email'),
                                            const SizedBox(
                                              height:
                                                  TSizes.spaceBtwInputFields,
                                            ),
                                            TRounsCheckBox(
                                                onTap: (isCheck) {
                                                  if (isCheck!) {
                                                    controller
                                                        .productionBlueprints
                                                        .text = 'Not present';
                                                  }
                                                },
                                                text: 'Not present'),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: TSizes.spaceBtwInputFields,
                                    ),
                                    const Text(
                                        'Work Type or project category. Please choose one:'),
                                    const SizedBox(
                                      height: TSizes.spaceBtwInputFields / 2,
                                    ),
                                    DropdownButtonFormField2<String>(
                                        isExpanded: true,
                                        decoration: InputDecoration(
                                          labelText: 'Select Project Category',
                                          prefixIcon: const Icon(
                                            Icons.list,
                                            color: TColors.darkGrey,
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 16),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                        items: controller.categoryItems
                                            .map((item) =>
                                                DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ))
                                            .toList(),
                                        // validator: (value) {
                                        //   if (value == null) {
                                        //     return 'Please select project Category';
                                        //   }
                                        //   return null;
                                        // },
                                        onChanged: (value) {
                                          controller.projectCategory.text =
                                              value.toString();
                                        },
                                        onSaved: (value) {
                                          controller.selectedValue =
                                              value.toString();
                                        },
                                        buttonStyleData: const ButtonStyleData(
                                          padding: EdgeInsets.only(
                                              right: 8, left: 8),
                                        ),
                                        iconStyleData: const IconStyleData(
                                          icon: Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.black45,
                                          ),
                                          iconSize: 24,
                                        ),
                                        dropdownStyleData: DropdownStyleData(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                        menuItemStyleData:
                                            const MenuItemStyleData(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16),
                                        )),

                                    const SizedBox(
                                      height: TSizes.spaceBtwInputFields,
                                    ),

                                    const Text(
                                        'Involves Assembly and Dismantling? Please select one:'),

                                    const SizedBox(
                                      height: TSizes.spaceBtwInputFields / 2,
                                    ),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TRounsCheckBox(
                                            onTap: (isCheck) {
                                              controller.assembly1.text =
                                                  'Exterior';
                                            },
                                            text: 'Exterior'),
                                        const SizedBox(
                                          height: TSizes.spaceBtwInputFields,
                                        ),
                                        TRounsCheckBox(
                                            onTap: (isCheck) {
                                              controller.assembly1.text =
                                                  'Interior';
                                            },
                                            text: 'Interior'),
                                        const SizedBox(
                                          height: TSizes.spaceBtwInputFields,
                                        ),
                                        TRounsCheckBox(
                                            onTap: (isCheck) {
                                              controller.assembly1.text =
                                                  'Don’t know';
                                            },
                                            text: 'Don’t know'),
                                      ],
                                    ),

                                    const SizedBox(
                                      height: TSizes.spaceBtwInputFields,
                                    ),
                                    const Text(
                                        'Involves Assembly and Dismantling? Please select one:'),

                                    const SizedBox(
                                      height: TSizes.spaceBtwInputFields / 2,
                                    ),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TRounsCheckBox(
                                                onTap: (isCheck) {
                                                  controller.assembly2.text =
                                                      'Installation';
                                                },
                                                text: 'Installation'),
                                            const SizedBox(
                                              height:
                                                  TSizes.spaceBtwInputFields,
                                            ),
                                            TRounsCheckBox(
                                                onTap: (isCheck) {
                                                  controller.assembly2.text =
                                                      'Both';
                                                },
                                                text: 'Both'),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TRounsCheckBox(
                                                onTap: (isCheck) {
                                                  controller.assembly2.text =
                                                      'Dismantling';
                                                },
                                                text: 'Dismantling'),
                                            const SizedBox(
                                              height:
                                                  TSizes.spaceBtwInputFields,
                                            ),
                                            TRounsCheckBox(
                                                onTap: (isCheck) {
                                                  controller.assembly2.text =
                                                      'Not required';
                                                },
                                                text: 'Not required'),
                                          ],
                                        ),
                                      ],
                                    ),

                                    const SizedBox(
                                      height: TSizes.spaceBtwInputFields,
                                    ),

                                    const Text('Unite/Quantity:'),
                                    const SizedBox(
                                      height: TSizes.spaceBtwInputFields / 2,
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: controller.quantity,
                                      decoration: InputDecoration(
                                          prefixIcon: const Icon(Icons.numbers),
                                          labelText:
                                              AppLocalizations.of(context)!
                                                  .quantity),
                                    ),
                                    const SizedBox(
                                      height: TSizes.spaceBtwInputFields,
                                    ),
                                    const Text('Proposed Price(incl. VAT):'),
                                    const SizedBox(
                                      height: TSizes.spaceBtwInputFields / 2,
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: controller.proposedPrice,
                                      decoration: const InputDecoration(
                                          prefixIcon: Icon(Icons.money),
                                          labelText: '156.200'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: TSizes.spaceBtwInputFields / 2,
                            ),

                            const Divider(
                              color: TColors.primary,
                            ),
                            const SizedBox(
                              height: TSizes.spaceBtwInputFields / 2,
                            ),
                            TRoundedContainer(
                              enableShadow: true,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Text('ADDITIONAL CONSIDERATIONS',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge!
                                            .copyWith(color: TColors.primary),
                                        textAlign: TextAlign.justify),
                                    const SizedBox(
                                      height: TSizes.spaceBtwInputFields,
                                    ),
                                    const Text(
                                        'Kindly indicate any additional requirements or services necessary for the work or on the project site, such asL Energu and Utilities, Technology Integrated, Living Elements, Logistic Operations etc.',
                                        textAlign: TextAlign.justify),
                                    const SizedBox(
                                      height: TSizes.spaceBtwInputFields / 2,
                                    ),
                                    TextFormField(
                                      maxLines: 3,
                                      controller: controller.descriptions1,
                                      decoration: InputDecoration(
                                          prefixIcon:
                                              const Icon(Icons.description),
                                          labelText:
                                              AppLocalizations.of(context)!
                                                  .descriptions),
                                    ),
                                    const SizedBox(
                                      height: TSizes.spaceBtwInputFields,
                                    ),
                                    const SizedBox(
                                      height: TSizes.spaceBtwInputFields,
                                    ),
                                    const Text(
                                        'Upload your files easily: PDFs, JPGs, PNGs, AI, EPS, SVG, DXF, DWG, and more. Perfect for sharing designs, 3D models, illustrations, and technical drawings.',
                                        textAlign: TextAlign.justify),
                                    const SizedBox(
                                      height: TSizes.spaceBtwInputFields / 2,
                                    ),
                                    IconButton(
                                      icon: Row(
                                        children: [
                                          const Icon(
                                            Iconsax.attach_square4,
                                            size: 30,
                                            color: TColors.primary,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Attach file',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall,
                                          ),
                                        ],
                                      ),
                                      onPressed: () {
                                        controller.selectFile();
                                      },
                                    ),
                                    if (controller.pickedFile.value!.extension
                                            .toString() ==
                                        'jpg')
                                      Stack(
                                        children: [
                                          TRoundedContainer(
                                              backgroundColor: dark
                                                  ? TColors.dark
                                                  : TColors.light,
                                              child: const Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: Icon(
                                                  Iconsax.image5,
                                                  size: 75,
                                                  color: Colors.grey,
                                                ),
                                              )),
                                          Positioned(
                                              top: 0,
                                              right: 0,
                                              child: IconButton(
                                                  icon: const Icon(
                                                    Icons.delete_forever,
                                                    color: Colors.red,
                                                  ),
                                                  onPressed: () {
                                                    controller.urlDownload =
                                                        'none';
                                                    controller
                                                            .pickedFile.value =
                                                        PlatformFile(
                                                            name: '', size: 0);
                                                  })),
                                        ],
                                      ),
                                    if (controller.pickedFile.value!.extension
                                            .toString() ==
                                        'pdf')
                                      Stack(
                                        children: [
                                          TRoundedContainer(
                                              backgroundColor: dark
                                                  ? TColors.dark
                                                  : TColors.light,
                                              child: const Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: Icon(
                                                  Icons.file_open_outlined,
                                                  size: 75,
                                                  color: Colors.grey,
                                                ),
                                              )),
                                          Positioned(
                                              top: 0,
                                              right: 0,
                                              child: IconButton(
                                                  icon: const Icon(
                                                    Icons.delete_forever,
                                                    color: Colors.red,
                                                  ),
                                                  onPressed: () {
                                                    controller.urlDownload =
                                                        'none';
                                                    controller
                                                            .pickedFile.value =
                                                        PlatformFile(
                                                            name: '', size: 0);
                                                  })),
                                        ],
                                      ),
                                    if (controller.pickedFile.value!.extension
                                            .toString() ==
                                        'mp4')
                                      Stack(
                                        children: [
                                          TRoundedContainer(
                                              backgroundColor: dark
                                                  ? TColors.dark
                                                  : TColors.light,
                                              child: const Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: Icon(
                                                  Icons.movie_outlined,
                                                  size: 75,
                                                  color: Colors.grey,
                                                ),
                                              )),
                                          Positioned(
                                              top: 0,
                                              right: 0,
                                              child: IconButton(
                                                  icon: const Icon(
                                                    Icons.delete_forever,
                                                    color: Colors.red,
                                                  ),
                                                  onPressed: () {
                                                    controller.urlDownload =
                                                        'none';
                                                    controller
                                                            .pickedFile.value =
                                                        PlatformFile(
                                                            name: '', size: 0);
                                                  })),
                                        ],
                                      ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Center(
                                        child: Text(
                                          controller.pickedFile.value!.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // const SizedBox(
                            //   height: TSizes.spaceBtwInputFields,
                            // ),

                            //////////////////////////
                          ],
                        ),
                        // const SizedBox(
                        //   height: TSizes.spaceBtwInputFields,
                        // ),
                        const SizedBox(
                          height: TSizes.spaceBtWItems / 2,
                        ),
                        const Divider(thickness: .7, color: TColors.primary),
                        const SizedBox(
                          height: TSizes.spaceBtWItems / 2,
                        ),

                        Row(
                          children: [
                            RoundCheckBox(
                              size: 20,
                              checkedWidget: const Icon(Icons.check,
                                  size: 15, color: Colors.white),
                              checkedColor: TColors.primary,
                              onTap: (selected) {
                                if (selected!) {
                                  controller.confirmation.text =
                                      true.toString();
                                }
                              },
                            ),
                            const SizedBox(width: TSizes.md),
                            SizedBox(
                              width: THelperFunctions.screenwidth() - 90,
                              child: Text(
                                  style: Theme.of(context).textTheme.bodyLarge,
                                  textAlign: TextAlign.justify,
                                  'I affirm my careful consideration of this Forms’ contents, and my complete understanding of attached Contract Terms and Rights by Brothers Creative.'),
                            )
                          ],
                        ),

                        const SizedBox(
                          height: TSizes.spaceBtwInputFields,
                        ),
                        SizedBox(
                          width: THelperFunctions.screenwidth() / 2.5,
                          child: ElevatedButton(
                              onPressed: () {
                                controller.uploadFile();
                                controller.addNewRequest();
                              },
                              child: const Text('Send')),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwInputFields,
                        ),
                        StreamBuilder<TaskSnapshot>(
                            stream: controller.uploadTask?.snapshotEvents,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final data = snapshot.data!;
                                double progress =
                                    data.bytesTransferred / data.totalBytes;
                                return Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    LinearProgressIndicator(
                                        //barRadius: Radius.circular(20),
                                        value: progress,
                                        backgroundColor: TColors.primary,
                                        color: Colors.green),
                                    Center(
                                      child: Text(
                                        '${(100 * progress).roundToDouble()}%',
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    )
                                  ],
                                );
                              } else {
                                return const SizedBox(
                                  height: 20,
                                );
                              }
                            }),
                      ]),
                )),
          ),
        ),
      ),
    );
  }
}
