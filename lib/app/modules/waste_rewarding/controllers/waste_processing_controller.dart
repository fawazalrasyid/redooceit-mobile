import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/models/waste_processing_daily_report_model.dart';
import '../../../data/models/waste_processing_model.dart';
import '../../../routes/app_pages.dart';

class WasteProcessingController extends GetxController {
  final isLoading = false.obs;

  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  final wasteProcessings = Rxn<List<WasteProcessing>>();
  final groupedWasteProcessings = Rxn<List<WasteProcessingDailyReport>>();

  final totalWasteReceived = 0.obs;
  final totalWasteProcessed = 0.obs;

  @override
  void onInit() {
    user = auth.currentUser;
    getWasteProcessing();
    super.onInit();
  }

  Future<void> onRefresh() async {
    await getWasteProcessing();
  }

  void addDataWasteProcessing() async {
    var result = await Get.toNamed(Routes.ADD_WASTE_PROCESSING_LOG);
    if (result == true) {
      getWasteProcessing();
    }
  }

  Future<void> getWasteProcessing() async {
    isLoading.value = true;

    // Get waste processing data
    final wasteProcessingRef =
        FirebaseFirestore.instance.collection('waste_processing_log');
    final wasteProcessingData =
        await wasteProcessingRef.withConverter<WasteProcessing>(
      fromFirestore: (snapshot, _) {
        return WasteProcessing.fromJson(snapshot.data()!);
      },
      toFirestore: (wasteProcessing, _) {
        return wasteProcessing.toJson();
      },
    ).get();

    wasteProcessings.value =
        wasteProcessingData.docs.map((e) => e.data()).toList();
    wasteProcessings.value!.sort((a, b) => a.date.compareTo(b.date));

    // Group waste processing data by date
    final Map<String, List<WasteProcessing>> groupedData = {};

    for (var wp in wasteProcessings.value!) {
      final dateString = DateFormat('yyyy-MM-dd').format(wp.date);
      if (groupedData.containsKey(dateString)) {
        groupedData[dateString]!.add(wp);
      } else {
        groupedData[dateString] = [wp];
      }
    }

    // Create daily report
    final List<WasteProcessingDailyReport> result = [];
    WasteProcessingDailyReport? previousGroup;

    for (var entry in groupedData.entries) {
      final List<WasteProcessing> wasteProcessingList = entry.value;
      final int totalWasteReceived = wasteProcessingList
          .map((e) => e.wasteReceived)
          .reduce((a, b) => a + b);
      final int totalWasteProcessed = wasteProcessingList
          .map((e) => e.wasteProcessed)
          .reduce((a, b) => a + b);

      final int wasteReceivedIncreasePercent =
          previousGroup != null && previousGroup.totalWasteReceived > 0
              ? ((totalWasteReceived - previousGroup.totalWasteReceived) /
                      previousGroup.totalWasteReceived *
                      100)
                  .toInt()
              : 0;

      final int wasteProcessedIncreasePercent =
          previousGroup != null && previousGroup.totalWasteProcessed > 0
              ? ((totalWasteProcessed - previousGroup.totalWasteProcessed) /
                      previousGroup.totalWasteProcessed *
                      100)
                  .toInt()
              : 0;

      // int year = int.parse(entry.key.substring(0, 4));
      // int month = int.parse(entry.key.substring(4, 6));
      // int day = int.parse(entry.key.substring(6, 8));

      final wasteProcessingDailyReport = WasteProcessingDailyReport(
        date: DateFormat('yyyy-MM-dd').parse(entry.key),
        totalWasteReceived: totalWasteReceived,
        totalWasteProcessed: totalWasteProcessed,
        wasteReceivedIncreasePercent: wasteReceivedIncreasePercent,
        wasteProcessedIncreasePercent: wasteProcessedIncreasePercent,
      );

      result.add(wasteProcessingDailyReport);
      previousGroup = wasteProcessingDailyReport;
    }

    groupedWasteProcessings.value = result;

    // Calculate total waste received and processed
    totalWasteReceived.value = groupedWasteProcessings.value!
        .map((report) => report.totalWasteReceived)
        .fold(0, (prev, amount) => prev + amount);
    totalWasteProcessed.value = groupedWasteProcessings.value!
        .map((report) => report.totalWasteProcessed)
        .fold(0, (prev, amount) => prev + amount);

    isLoading.value = false;
  }
}
