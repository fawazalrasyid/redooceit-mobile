import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:redooceit/app/core/utils/helpers.dart';

class AddWasteProcessingLogController extends GetxController {
  final isLoading = false.obs;

  final wasteReceivedCtrl = TextEditingController();
  final wasteProcessedCtrl = TextEditingController();

  final isValidForm = false.obs;

  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  @override
  void onInit() {
    user = auth.currentUser;
    super.onInit();
  }

  checkIsValidForm() {
    isValidForm.value =
        wasteReceivedCtrl.text.isNotEmpty && wasteProcessedCtrl.text.isNotEmpty;
  }

  void saveWasteProcessingLog() {
    isLoading.value = true;

    final wasteProcessingRef =
        FirebaseFirestore.instance.collection('waste_processing_log');
    final activityRef = FirebaseFirestore.instance.collection('activity_log');

    final id = wasteProcessingRef.doc().id;
    final date = DateTime.now().toIso8601String();
    final wasteReceived = double.parse(
      wasteReceivedCtrl.text.replaceAll(',', '.'),
    );
    final wasteProcessed = double.parse(
      wasteProcessedCtrl.text.replaceAll(',', '.'),
    );

    final wasteProcessingData = {
      'id': id,
      'tps_id': '9XudJQLlvtZm8pgQEJnG',
      'waste_received': Helpers.kgToGram(wasteReceived),
      'waste_processed': Helpers.kgToGram(wasteProcessed),
      'date': date,
    };

    final activityId = activityRef.doc().id;

    final activityData = {
      'id': activityId,
      'user_id': user!.uid,
      'tps_id': '9XudJQLlvtZm8pgQEJnG',
      'activity_type': 'waste_processing',
      'activity_detail_id': id,
      'date': date,
    };

    wasteProcessingRef.doc(id).set(wasteProcessingData).then((_) {
      activityRef.doc(activityId).set(activityData);
    }).then((_) {
      Fluttertoast.showToast(msg: 'Data berhasil disimpan');
      Get.back(result: true);
    }).catchError((e) {
      Fluttertoast.showToast(msg: 'Gagal menyimpan data!');
    });

    isLoading.value = false;
  }
}
