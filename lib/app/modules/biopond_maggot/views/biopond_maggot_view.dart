import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:redooceit/app/core/widgets/empty_data.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_clip.dart';
import '../../../core/widgets/timeline_item.dart';
import '../controllers/biopond_maggot_controller.dart';

class BiopondMaggotView extends GetView<BiopondMaggotController> {
  const BiopondMaggotView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: CustomAppBar(
          child: SafeArea(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: AppValues.padding),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Icon(
                        IconlyLight.arrow_left_2,
                        size: 18,
                        color: Color(0xFF030319),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Text(
                      'Biopond Maggot',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const SizedBox(
                    width: 40,
                    height: 40,
                  )
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipPath(
                clipper: CustomClip(),
                child: Container(
                  color: const Color(0xFF001C35),
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      controller.isLoading.value == false &&
                              controller.currentActiveBiopond.value == null
                          ? const Padding(
                              padding: EdgeInsets.all(30),
                              child: EmptyData(
                                text:
                                    'Maggofeed belum dijalankan, Mulai Sekarang!',
                                fontColor: Colors.white,
                              ),
                            )
                          : SizedBox(
                              width: Get.width,
                              child: Column(
                                children: [
                                  CircularStepProgressIndicator(
                                    width: Get.width * 0.8,
                                    height: Get.width * 0.8,
                                    padding: 0,
                                    totalSteps: 15,
                                    currentStep:
                                        controller.biopondDayPassed.value,
                                    stepSize: 0,
                                    selectedStepSize: 40,
                                    selectedColor: const Color(0x49E7FFFD),
                                    unselectedColor: Colors.transparent,
                                    child: CircularStepProgressIndicator(
                                      totalSteps: 15,
                                      currentStep:
                                          controller.biopondDayPassed.value,
                                      padding: 0,
                                      stepSize: 0,
                                      selectedStepSize: 5,
                                      selectedColor: const Color(0xFFFEBC37),
                                      unselectedColor: Colors.transparent,
                                      child: Container(
                                        decoration: const ShapeDecoration(
                                          color: Colors.white,
                                          shape: OvalBorder(),
                                          shadows: [
                                            BoxShadow(
                                              color: Color(0x6034D2C5),
                                              blurRadius: 108,
                                              offset: Offset(4, 25),
                                              spreadRadius: 0,
                                            )
                                          ],
                                        ),
                                        child: controller.isLoading.value
                                            ? Container(
                                                padding:
                                                    const EdgeInsets.all(42),
                                                child: const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              )
                                            : Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    'assets/images/maggot.png',
                                                    height: Get.width * 0.15,
                                                  ),
                                                  Text(
                                                    '${controller.biopondDayPassed.value} hari',
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                      color: Color(0xFF130F26),
                                                      fontSize: 36,
                                                      fontFamily: 'DM Sans',
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  const Text(
                                                    'Bisa panen hari ke-15',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Color(0xFF777777),
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'SF Pro Display',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  )
                                                ],
                                              ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      const SizedBox(height: 32),
                      Container(
                        width: Get.width * 0.5,
                        margin: const EdgeInsets.symmetric(
                          horizontal: AppValues.margin,
                        ),
                        child: ElevatedButton(
                          onPressed: () => controller.buttonAction(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: controller.buttonBackgroundColor,
                            disabledBackgroundColor: AppColors.lightGrey,
                            elevation: 0,
                            padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2,
                                strokeAlign: BorderSide.strokeAlignOutside,
                                color: controller.buttonBorderColor,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            controller.buttonText,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 64),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              controller.biopondState == BiopondState.loading ||
                      controller.biopondState == BiopondState.idle
                  ? Container()
                  : Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: AppValues.margin,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Informasi Maggot',
                            style: TextStyle(
                              color: Color(0xFF777777),
                              fontSize: 16,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 80,
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.maggotStepName.length,
                              itemExtent: (Get.width - 40) / 4,
                              itemBuilder: (context, index) {
                                return TimelineItem(
                                  isFirst: index == 0,
                                  isLast: index ==
                                      controller.maggotStepName.length - 1,
                                  isActive: index ==
                                      controller.bipondCurrentStep.value,
                                  isPrev: index <
                                      controller.bipondCurrentStep.value,
                                  stepName: controller.maggotStepName[index],
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 24),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: ShapeDecoration(
                              color: const Color(0xFFF3F8FA),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(1000),
                              ),
                            ),
                            child: const Text(
                              '💡 Penjelasan',
                              style: TextStyle(
                                color: Color(0xFF130F26),
                                fontSize: 16,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            controller.maggotStepDescriptions[
                                controller.bipondCurrentStep.value],
                            style: const TextStyle(
                              color: Color(0xFF130F26),
                              fontSize: 14,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}
