import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:redooceit/app/core/utils/helpers.dart';

import '../../../core/values/app_values.dart';
import '../../../core/widgets/activity_log_item.dart';
import '../../../core/widgets/custom_clip.dart';
import '../../../core/widgets/empty_data.dart';
import '../../../data/models/activity_model.dart';
import '../controllers/activity_log_controller.dart';

class ActivityLogView extends GetView<ActivityLogController> {
  ActivityLogView({Key? key}) : super(key: key);

  @override
  final ActivityLogController controller = Get.put(ActivityLogController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RefreshIndicator(
        onRefresh: controller.onRefresh,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipPath(
                  clipper: CustomClip(),
                  child: Container(
                    color: const Color(0xFF001C35),
                    child: SafeArea(
                      child: Column(
                        children: [
                          const SizedBox(height: 24),
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: AppValues.margin,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Riwayat',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF20D3C4),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(1000),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        IconlyBold.calendar,
                                        color: Colors.black,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        DateFormat('MMMM yyyy').format(
                                          DateTime.now(),
                                        ),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'DM Sans',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 64),
                        ],
                      ),
                    ),
                  ),
                ),
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
                      : controller.activities.value!.isEmpty
                          ? const EmptyData(
                              text: 'Belum ada Riwayat yang ditampilkan',
                            )
                          : GroupedListView<Activity, String>(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              elements: controller.activities.value!,
                              groupBy: (element) =>
                                  DateFormat('yyyy-MM-dd').format(element.date),
                              groupComparator: (value1, value2) =>
                                  value2.compareTo(value1),
                              groupSeparatorBuilder: (String value) => Padding(
                                padding: const EdgeInsets.only(
                                  top: 24,
                                  bottom: 20,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                              ),
                              itemBuilder: (context, element) {
                                bool isLastItem = controller.activities.value!
                                        .indexOf(element) ==
                                    0;
                                return ActivityLogItem(
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
      ),
    );
  }
}
