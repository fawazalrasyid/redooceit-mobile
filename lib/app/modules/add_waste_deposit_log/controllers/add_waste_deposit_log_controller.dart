import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../core/utils/helpers.dart';
import '../../../data/models/member_model.dart';

class AddWasteDepositLogController extends GetxController {
  final isLoading = false.obs;

  final weightCtrl = TextEditingController();
  var stampCtrl = TextEditingController();

  final isValidForm = false.obs;

  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  final Rxn<List<Member>> members = Rxn<List<Member>>();
  Member? selectedMember;

  @override
  void onInit() {
    user = auth.currentUser;
    getWasteMembers();
    weightCtrl.addListener(() {
      calculateStamp();
    });
    super.onInit();
  }

  checkIsValidForm() {
    isValidForm.value = selectedMember != null &&
        weightCtrl.text.isNotEmpty &&
        stampCtrl.text.isNotEmpty;
  }

  void calculateStamp() {
    weightCtrl.text.isNotEmpty
        ? stampCtrl.text =
            (double.parse(weightCtrl.text.replaceAll(',', '.')).round() * 2)
                .toString()
        : stampCtrl.clear();

    checkIsValidForm();
  }

  Future<void> getWasteMembers() async {
    isLoading.value = true;

    final membersRef = FirebaseFirestore.instance.collection('members');
    final membersData = await membersRef
        .withConverter<Member>(
          fromFirestore: (snapshot, _) => Member.fromJson(snapshot.data()!),
          toFirestore: (members, _) => members.toJson(),
        )
        .get();
    members.value = membersData.docs.map((e) => e.data()).toList();
    members.value!.sort((a, b) => a.name.compareTo(b.name));

    // selectedMember = members.value!.first;

    isLoading.value = false;
  }

  void saveWasteDepositLog() {
    isLoading.value = true;

    final memberRef = FirebaseFirestore.instance.collection('members');
    final wasteDepositRef =
        FirebaseFirestore.instance.collection('waste_deposit_log');
    final activityRef = FirebaseFirestore.instance.collection('activity_log');

    final id = wasteDepositRef.doc().id;
    final memberId = selectedMember!.id;
    final date = DateTime.now().toIso8601String();
    final weight = double.parse(weightCtrl.text.replaceAll(',', '.'));
    final totalStamp = selectedMember!.totalStamp + int.parse(stampCtrl.text);

    final wasteDepositData = {
      'id': id,
      'tps_id': '9XudJQLlvtZm8pgQEJnG',
      'member_id': memberId,
      'weight': Helpers.kgToGram(weight),
      'date': date,
    };

    final memberData = {
      'total_stamp': totalStamp,
    };

    final activityId = activityRef.doc().id;
    final activityData = {
      'id': activityId,
      'user_id': user!.uid,
      'tps_id': '9XudJQLlvtZm8pgQEJnG',
      'activity_type': 'waste_deposit',
      'activity_detail_id': id,
      'date': date,
    };

    wasteDepositRef.doc(id).set(wasteDepositData).then((_) {
      memberRef.doc(memberId).update(memberData);
    }).then((_) {
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
