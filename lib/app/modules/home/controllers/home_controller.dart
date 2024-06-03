import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/models/member_model.dart';
import '../../../data/models/waste_deposit_model.dart';
import '../../../data/models/waste_processing_model.dart';

class HomeController extends GetxController {
  final isLoading = false.obs;

  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  final wasteProcessings = Rxn<List<WasteProcessing>>();
  final wasteDeposits = Rxn<List<WasteDeposit>>();

  final todayTotalWasteReceived = 0.obs;
  final todayTotalWasteProcessed = 0.obs;

  @override
  void onInit() {
    user = auth.currentUser;
    fetchAllData();
    super.onInit();
  }

  Future<void> onRefresh() async {
    fetchAllData();
  }

  Future<void> fetchAllData() async {
    isLoading.value = true;

    await getWasteProcessing();
    await getWasteDeposits();

    isLoading.value = false;
  }

  Future<void> getWasteProcessing() async {
    isLoading.value = true;

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

    final today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final todayWasteProcessings = wasteProcessings.value!.where(
      (element) => DateFormat('yyyy-MM-dd').format(element.date) == today,
    );

    todayTotalWasteReceived.value = 0;
    todayTotalWasteProcessed.value = 0;

    for (var wasteProcessing in todayWasteProcessings) {
      todayTotalWasteReceived.value += wasteProcessing.wasteReceived;
      todayTotalWasteProcessed.value += wasteProcessing.wasteProcessed;
    }

    isLoading.value = false;
  }

  Future<void> getWasteDeposits() async {
    isLoading.value = true;

    final wasteDepositsRef =
        FirebaseFirestore.instance.collection('waste_deposit_log');
    final wasteDepositsData = await wasteDepositsRef
        .withConverter<WasteDeposit>(
          fromFirestore: (snapshot, _) =>
              WasteDeposit.fromJson(snapshot.data()!),
          toFirestore: (wasteDeposit, _) => wasteDeposit.toJson(),
        )
        .get();
    wasteDeposits.value = wasteDepositsData.docs.map((e) => e.data()).toList();
    wasteDeposits.value!.sort((a, b) => b.date.compareTo(a.date));

    List<WasteDeposit> depositsWithMemberInfo = [];

    for (var wasteDeposit in wasteDeposits.value!) {
      var memberId = wasteDeposit.memberId;

      var memberData = await FirebaseFirestore.instance
          .collection('members')
          .doc(memberId)
          .withConverter<Member>(
            fromFirestore: (snapshot, _) => Member.fromJson(snapshot.data()!),
            toFirestore: (member, _) => member.toJson(),
          )
          .get();

      var depositWithMemberInfo = WasteDeposit(
        id: wasteDeposit.id,
        date: wasteDeposit.date,
        weight: wasteDeposit.weight,
        memberId: memberId,
        memberData: memberData.data()!,
      );

      depositsWithMemberInfo.add(depositWithMemberInfo);
    }

    wasteDeposits.value = depositsWithMemberInfo;

    isLoading.value = false;
  }
}
