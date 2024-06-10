import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:iconly/iconly.dart';
import 'package:redooceit/app/core/utils/helpers.dart';
import 'package:redooceit/app/core/widgets/custom_app_bar.dart';
import 'package:redooceit/app/data/models/waste_processing_daily_report_model.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../../core/widgets/custom_clip.dart';
import '../../../core/widgets/empty_data.dart';
import '../../../core/widgets/waste_processing_log_item.dart';
import '../controllers/waste_processing_controller.dart';

class WasteProcessingView extends GetView<WasteProcessingController> {
  const WasteProcessingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: CustomAppBar(
          height: 60,
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
                      'Sampah Makanan',
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
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: AppValues.padding,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      padding: const EdgeInsets.all(6.40),
                                      decoration: ShapeDecoration(
                                        gradient: const LinearGradient(
                                          begin: Alignment(-0.00, -1.00),
                                          end: Alignment(0, 1),
                                          colors: [
                                            Color(0xFF1F6ECB),
                                            Color(0xFF003667)
                                          ],
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6.40),
                                        ),
                                      ),
                                      child: const Icon(
                                        IconlyBold.download,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    const Text(
                                      'Sampah Terkumpul',
                                      style: TextStyle(
                                        color: Color(0xFF777777),
                                        fontSize: 14,
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      Helpers.formatGramToKg(
                                        controller.totalWasteReceived.value,
                                      ),
                                      style: const TextStyle(
                                        color: Color(0xFF090A0A),
                                        fontSize: 20,
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      padding: const EdgeInsets.all(6.40),
                                      decoration: ShapeDecoration(
                                        gradient: const LinearGradient(
                                          begin: Alignment(0.00, -1.00),
                                          end: Alignment(0, 1),
                                          colors: [
                                            Color(0xFF12CABA),
                                            Color(0xFF058076)
                                          ],
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6.40),
                                        ),
                                      ),
                                      child: const Icon(
                                        IconlyBold.setting,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    const Text(
                                      'Sampah Terolah',
                                      style: TextStyle(
                                        color: Color(0xFF777777),
                                        fontSize: 14,
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      Helpers.formatGramToKg(
                                        controller.totalWasteProcessed.value,
                                      ),
                                      style: const TextStyle(
                                        color: Color(0xFF090A0A),
                                        fontSize: 20,
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: AppValues.margin,
                        ),
                        width: Get.width,
                        child: ElevatedButton(
                          onPressed: () => controller.addDataWasteProcessing(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.colorPrimary,
                            elevation: 0,
                            padding: const EdgeInsets.fromLTRB(64, 16, 64, 16),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 2,
                                strokeAlign: BorderSide.strokeAlignOutside,
                                color: Color(0xFF0AB2A4),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "Catat Sampah Makanan",
                            textAlign: TextAlign.center,
                            style: TextStyle(
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
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: AppValues.margin,
                ),
                child: const Text(
                  'Data Sampah Makanan',
                  style: TextStyle(
                    color: Color(0xFF090A0A),
                    fontSize: 18,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: AppValues.margin,
                ),
                child: controller.isLoading.value
                    ? Container(
                        padding: const EdgeInsets.all(42),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : controller.groupedWasteProcessings.value!.isEmpty
                        ? const EmptyData(
                            text: 'Belum ada Data\nyang ditampilkan',
                            imageSize: 140,
                            fontSize: 18,
                          )
                        : GroupedListView<WasteProcessingDailyReport, String>(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            elements: controller.groupedWasteProcessings.value!,
                            groupBy: (element) => element.date.toString(),
                            groupComparator: (value1, value2) =>
                                value2.compareTo(value1),
                            groupSeparatorBuilder: (String value) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  IconlyBold.calendar,
                                  size: 20,
                                  color: Color(0xffA2B5C5),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    Helpers.formatDateFromString(value),
                                    style: const TextStyle(
                                      color: Color(0xFF777777),
                                      fontSize: 14,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Helpers.formatDate(DateTime.now()) ==
                                        Helpers.formatDateFromString(value)
                                    ? const Text(
                                        'Hari Ini',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Color(0xFFFBA536),
                                          fontSize: 14,
                                          fontFamily: 'DM Sans',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                            itemBuilder: (context, element) {
                              bool isLastItem = controller
                                      .groupedWasteProcessings.value!
                                      .indexOf(element) ==
                                  0;
                              return WasteProcessingLogItem(
                                isLastItem: isLastItem,
                                data: element,
                              );
                            },
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
