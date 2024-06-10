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
}
