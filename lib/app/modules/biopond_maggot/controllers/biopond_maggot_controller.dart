import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:redooceit/app/data/models/biopond_maggot_model.dart';

import '../../../routes/app_pages.dart';

enum BiopondState {
  loading,
  idle,
  active,
  harvest,
}

class BiopondMaggotController extends GetxController {
  final isLoading = false.obs;

  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  final biopondMaggotRef =
      FirebaseFirestore.instance.collection('biopond_maggot_log');
  final activityRef = FirebaseFirestore.instance.collection('activity_log');

  final maggotStepName = ['Larva', 'Pre Pupa', 'Pupa', 'BSF'];
  final maggotStepDescriptions = [
    'Larva adalah tahap pertama dari belatung. Ini adalah tahap di mana belatung menetas dari telur.',
    'Pre Pupa adalah tahap kedua dari belatung. Ini adalah tahap di mana belatung tumbuh dan bersiap untuk menjadi pupa.',
    'Pupa adalah tahap ketiga dari belatung. Ini adalah tahap di mana belatung istirahat dan bertransformasi menjadi pupa.',
    'BSF adalah tahap terakhir dari belatung. Ini adalah tahap di mana belatung bertransformasi menjadi Lalat Prajurit Hitam'
  ];

  final biopondMaggots = Rxn<List<BiopondMaggot>>();

  BiopondState biopondState = BiopondState.loading;

  final currentActiveBiopond = Rx<BiopondMaggot?>(null);
  final bipondCurrentStep = 0.obs;
  final biopondDayPassed = 0.obs;

  @override
  void onInit() {
    user = auth.currentUser;
    getBiopondMaggots();
    super.onInit();
  }

  void buttonAction() {
    switch (biopondState) {
      case BiopondState.loading:
        null;
        break;
      case BiopondState.idle:
        startNewBiopond();
        break;
      case BiopondState.active:
        cancelCurrentBiopond();
        break;
      case BiopondState.harvest:
        harvestBiopond();
        break;
    }
  }

  get buttonBackgroundColor {
    switch (biopondState) {
      case BiopondState.loading:
        return const Color(0xFFA9A9A9);
      case BiopondState.idle:
        return const Color(0xFF34D2C5);
      case BiopondState.active:
        return const Color(0xFFE94B3D);
      case BiopondState.harvest:
        return const Color(0xFF34D2C5);
    }
  }

  Color get buttonBorderColor {
    switch (biopondState) {
      case BiopondState.loading:
        return const Color(0xFF555555);
      case BiopondState.idle:
        return const Color(0xFF0BB2A5);
      case BiopondState.active:
        return const Color(0xFFD52515);
      case BiopondState.harvest:
        return const Color(0xFF0BB2A5);
    }
  }

  String get buttonText {
    switch (biopondState) {
      case BiopondState.loading:
        return 'Memuat...';
      case BiopondState.idle:
        return 'Mulai MaggoFeed';
      case BiopondState.active:
        return 'Batalkan Biopond';
      case BiopondState.harvest:
        return 'Panen Maggot';
    }
  }

  Future<void> getBiopondMaggots() async {
    isLoading.value = true;

    final wasteDepositsData = await biopondMaggotRef
        .withConverter<BiopondMaggot>(
          fromFirestore: (snapshot, _) =>
              BiopondMaggot.fromJson(snapshot.data()!),
          toFirestore: (biopondMaggot, _) => biopondMaggot.toJson(),
        )
        .get();
    biopondMaggots.value = wasteDepositsData.docs.map((e) => e.data()).toList();
    biopondMaggots.value!.sort((a, b) => a.startDate.compareTo(b.startDate));

    updateCurrentBiopondData();

    isLoading.value = false;
  }

  Future<void> startNewBiopond() async {
    isLoading.value = true;

    final id = biopondMaggotRef.doc().id;
    final DateTime startDate = DateTime.now();

    final biopondData = {
      'id': id,
      'start_date': startDate.toIso8601String(),
      'maggot_weight': 0,
      'kasgot_weight': 0,
      'remaining_food_weight': 0,
      'status': 'active',
    };

    final activityId = activityRef.doc().id;
    final activityData = {
      'id': activityId,
      'user_id': user!.uid,
      'tps_id': '9XudJQLlvtZm8pgQEJnG',
      'activity_type': 'biopond_maggot',
      'activity_detail_id': id,
      'activity_description': 'Biopond maggot dimulai',
      'date': startDate.toIso8601String(),
    };

    await biopondMaggotRef.doc(id).set(biopondData).then((value) {
      activityRef.doc(activityId).set(activityData);
    }).then((value) {
      Fluttertoast.showToast(msg: 'Biopond berhasil dimulai');
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(msg: 'Gagal memulai biopond');
    });

    await getBiopondMaggots();

    isLoading.value = false;
  }

  Future<void> cancelCurrentBiopond() async {
    isLoading.value = true;

    final DateTime date = DateTime.now();

    final activityId = activityRef.doc().id;
    final activityData = {
      'id': activityId,
      'user_id': user!.uid,
      'tps_id': '9XudJQLlvtZm8pgQEJnG',
      'activity_type': 'biopond_maggot',
      'activity_detail_id': currentActiveBiopond.value!.id,
      'activity_description': 'Biopond maggot dibatalkan',
      'date': date.toIso8601String(),
    };

    await biopondMaggotRef.doc(currentActiveBiopond.value!.id).update({
      'status': 'canceled',
    }).then((value) {
      activityRef.doc(activityId).set(activityData);
    }).then((value) {
      Fluttertoast.showToast(msg: 'Biopond berhasil dibatalkan');
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(msg: 'Gagal membatalkan biopond');
    });

    await getBiopondMaggots();

    isLoading.value = false;
  }

  void harvestBiopond() async {
    var result = await Get.toNamed(
      Routes.ADD_BIOPOND_MAGGOT_HARVEST_LOG,
      arguments: currentActiveBiopond.value!,
    );
    if (result == true) {
      await getBiopondMaggots();
    }
  }

  void updateCurrentBiopondData() {
    final activeBioponds = biopondMaggots.value!
        .where((element) => element.status == 'active')
        .toList();

    if (activeBioponds.isNotEmpty) {
      currentActiveBiopond.value = activeBioponds.last;

      final DateTime currentDate = DateTime.now();
      final DateTime startDate = currentActiveBiopond.value!.startDate;
      biopondDayPassed.value = currentDate.difference(startDate).inDays;

      if (biopondDayPassed.value >= 15) {
        bipondCurrentStep.value = 3;
      } else if (biopondDayPassed.value > 10) {
        bipondCurrentStep.value = 2;
      } else if (biopondDayPassed.value > 5) {
        bipondCurrentStep.value = 1;
      } else {
        bipondCurrentStep.value = 0;
      }

      if (biopondDayPassed.value < 15) {
        biopondState = BiopondState.active;
      } else if (biopondDayPassed.value >= 15) {
        biopondState = BiopondState.harvest;
      }
    } else {
      currentActiveBiopond.value = null;
      biopondState = BiopondState.idle;
    }

    debugPrint('biopond state: $biopondState');
  }
}
