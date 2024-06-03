import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/member_model.dart';
import '../../../data/models/waste_deposit_model.dart';
import '../../../routes/app_pages.dart';

class WasteDepositController extends GetxController {
  final isLoading = false.obs;

  ScrollController scrollController = ScrollController();
  final isSliverAppBarExpanded = true.obs;

  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  final Rxn<List<WasteDeposit>> wasteDeposits = Rxn<List<WasteDeposit>>();
  final Rxn<List<Member>> members = Rxn<List<Member>>();

  final totalMembers = 0.obs;

  @override
  void onInit() {
    scrollController.addListener(() {
      updateSliverAppBarStatus(scrollController.offset);
    });
    user = auth.currentUser;
    fetchAllData();
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<void> onRefresh() async {
    debugPrint('refrsh');
    await fetchAllData();
  }

  void updateSliverAppBarStatus(double offset) {
    isSliverAppBarExpanded.value = offset < (200 - kToolbarHeight);
  }

  void addMember() async {
    var result = await Get.toNamed(Routes.ADD_MEMBER);
    if (result == true) {
      await fetchAllData();
    }
  }

  void addDataWasteDeposit() async {
    var result = await Get.toNamed(Routes.ADD_WASTE_DEPOSIT_LOG);
    if (result == true) {
      await fetchAllData();
    }
  }

  Future<void> fetchAllData() async {
    isLoading.value = true;

    await getWasteDeposits();
    await getMembers();

    isLoading.value = false;
  }

  Future<void> getWasteDeposits() async {
    final wasteDepositRef =
        FirebaseFirestore.instance.collection('waste_deposit_log');
    final wasteDepositData = await wasteDepositRef
        .withConverter<WasteDeposit>(
          fromFirestore: (snapshot, _) =>
              WasteDeposit.fromJson(snapshot.data()!),
          toFirestore: (wasteDeposit, _) => wasteDeposit.toJson(),
        )
        .get();

    wasteDeposits.value = wasteDepositData.docs.map((e) => e.data()).toList();
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
  }

  Future<void> getMembers() async {
    final membersRef = FirebaseFirestore.instance.collection('members');
    final membersData = await membersRef
        .withConverter<Member>(
          fromFirestore: (snapshot, _) => Member.fromJson(snapshot.data()!),
          toFirestore: (members, _) => members.toJson(),
        )
        .get();
    members.value = membersData.docs.map((e) => e.data()).toList();
    members.value!.sort((a, b) => a.name.compareTo(b.name));

    totalMembers.value = members.value!.length;
  }
}
