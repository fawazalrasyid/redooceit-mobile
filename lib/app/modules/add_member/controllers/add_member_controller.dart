import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../core/utils/helpers.dart';
import '../../../data/models/member_model.dart';

class AddMemberController extends GetxController {
  final isLoading = false.obs;

  final nameCtrl = TextEditingController();
  final phoneNumberCtrl = TextEditingController();
  final rtCtrl = TextEditingController();
  final rwCtrl = TextEditingController();
  final addressCtrl = TextEditingController();

  final isValidForm = false.obs;

  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  final Rxn<List<Member>> members = Rxn<List<Member>>();
  Member? selectedMember;

  @override
  void onInit() {
    user = auth.currentUser;

    super.onInit();
  }

  checkIsValidForm() {
    isValidForm.value = nameCtrl.text.isNotEmpty &&
        phoneNumberCtrl.text.isNotEmpty &&
        rtCtrl.text.isNotEmpty &&
        rwCtrl.text.isNotEmpty &&
        addressCtrl.text.isNotEmpty;
  }

  void saveMember() {
    isLoading.value = true;

    final memberRef = FirebaseFirestore.instance.collection('members');

    final memberId = memberRef.doc().id;

    final memberData = {
      'id': memberId,
      'name': nameCtrl.text,
      'photo_url': Helpers.generatePhotoUrl(nameCtrl.text),
      'phone_number': phoneNumberCtrl.text,
      'address': addressCtrl.text,
      'rt': int.parse(rtCtrl.text).toString(),
      'rw': int.parse(rwCtrl.text).toString(),
      'total_stamp': 0,
      'created_at': DateTime.now().toIso8601String(),
    };

    memberRef.doc(memberId).set(memberData).then((_) {
      Fluttertoast.showToast(msg: 'Data berhasil disimpan');
      Get.back(result: true);
    }).catchError((e) {
      Fluttertoast.showToast(msg: 'Gagal menyimpan data!');
    });

    isLoading.value = false;
  }
}
