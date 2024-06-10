import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/activity_model.dart';
import '../../../data/models/biopond_maggot_model.dart';
import '../../../data/models/member_model.dart';
import '../../../data/models/waste_deposit_model.dart';
import '../../../data/models/waste_processing_model.dart';
import '../../../routes/app_pages.dart';

class ActivityLogController extends GetxController {
  final isLoading = false.obs;

  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  final activities = Rxn<List<Activity>>();

  final totalWasteReceived = 0.obs;
  final totalWasteProcessed = 0.obs;

  @override
  void onInit() {
    user = auth.currentUser;
    getActivity();
    super.onInit();
  }

  Future<void> onRefresh() async {
    getActivity();
  }

  void addDataActivity() async {
    var result = await Get.toNamed(Routes.ADD_WASTE_PROCESSING_LOG);
    if (result == true) {
      getActivity();
    }
  }

  Future<void> getActivity() async {
    isLoading.value = true;

    final activityRef = FirebaseFirestore.instance.collection('activity_log');
    final activityData = await activityRef.withConverter<Activity>(
      fromFirestore: (snapshot, _) {
        return Activity.fromJson(snapshot.data()!);
      },
      toFirestore: (activity, _) {
        return activity.toJson();
      },
    ).get();

    activities.value = activityData.docs.map((e) => e.data()).toList();
    activities.value!.sort((a, b) => b.date.compareTo(a.date));

    List<Activity> activitiesWithDetailInfo = [];

    for (var activity in activities.value!) {
      WasteDeposit? wasteDeposit;
      WasteProcessing? wasteProcessing;
      BiopondMaggot? biopondMaggot;

      switch (activity.activityType) {
        case 'waste_deposit':
          {
            var wasteDepositData = await FirebaseFirestore.instance
                .collection('waste_deposit_log')
                .doc(activity.actyvityDetailId)
                .get();

            var memberData = await FirebaseFirestore.instance
                .collection('members')
                .doc(wasteDepositData['member_id'])
                .withConverter<Member>(
                  fromFirestore: (snapshot, _) =>
                      Member.fromJson(snapshot.data()!),
                  toFirestore: (member, _) => member.toJson(),
                )
                .get();

            wasteDeposit = WasteDeposit(
              id: wasteDepositData['id'],
              date: DateTime.parse(wasteDepositData['date']),
              weight: wasteDepositData['weight'],
              memberId: wasteDepositData['member_id'],
              memberData: memberData.data()!,
            );
          }
          break;
        case 'waste_processing':
          {
            var wasteProcessingData = await FirebaseFirestore.instance
                .collection('waste_processing_log')
                .doc(activity.actyvityDetailId)
                .get();

            wasteProcessing = WasteProcessing(
              id: wasteProcessingData['id'],
              date: DateTime.parse(wasteProcessingData['date']),
              wasteReceived: wasteProcessingData['waste_received'],
              wasteProcessed: wasteProcessingData['waste_processed'],
            );
          }
          break;
        case 'biopond_maggot':
          {
            var biopondMaggotData = await FirebaseFirestore.instance
                .collection('biopond_maggot_log')
                .doc(activity.actyvityDetailId)
                .get();

            biopondMaggot = BiopondMaggot(
              id: biopondMaggotData['id'],
              startDate: DateTime.parse(biopondMaggotData['start_date']),
              maggotWeight: biopondMaggotData['maggot_weight'],
              kasgotWeight: biopondMaggotData['kasgot_weight'],
              remainingFoodWeight: biopondMaggotData['remaining_food_weight'],
              status: biopondMaggotData['status'],
            );
          }
          break;
      }

      activitiesWithDetailInfo.add(
        Activity(
          id: activity.id,
          userId: activity.userId,
          tpsId: activity.tpsId,
          activityType: activity.activityType,
          activityDescription: activity.activityDescription,
          actyvityDetailId: activity.actyvityDetailId,
          date: activity.date,
          wasteDepositData: wasteDeposit,
          wasteProcessingData: wasteProcessing,
          biopondMaggotData: biopondMaggot,
        ),
      );
    }

    activities.value = activitiesWithDetailInfo;

    isLoading.value = false;
  }

  getData() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    List<QueryDocumentSnapshot> _activityDocuments = [];
    bool _isLoading = false;

    final QuerySnapshot activitySnapshot = await firestore
        .collection('activity_log')
        .orderBy('date', descending: true)
        .limit(20)
        .get();

    _activityDocuments = activitySnapshot.docs;
  }
}
