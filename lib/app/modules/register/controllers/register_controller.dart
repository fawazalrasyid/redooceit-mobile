import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:redooceit/app/core/utils/helpers.dart';

class RegisterController extends GetxController {
  final isLoading = false.obs;

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController confirmPasswordCtrl = TextEditingController();

  final obscurePassword = true.obs;
  final obscureConfirmPassword = true.obs;
  final chechkbox = false.obs;
  final isValidForm = false.obs;

  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  checkIsValidForm() {
    isValidForm.value = nameCtrl.text.isNotEmpty &&
        emailCtrl.text.isEmail &&
        passwordCtrl.text.isNotEmpty &&
        confirmPasswordCtrl.text.isNotEmpty &&
        passwordCtrl.text == confirmPasswordCtrl.text;
  }

  void register() async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: emailCtrl.text,
        password: passwordCtrl.text,
      );

      user = userCredential.user;

      if (user != null) {
        await user!.updateDisplayName(nameCtrl.text);
        await user!.updatePhotoURL(Helpers.generatePhotoUrl(nameCtrl.text));
        await user!.sendEmailVerification();

        saveUserDataToFirestore();
      }

      Fluttertoast.showToast(msg: 'Registrasi berhasil');

      Get.back();
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
      if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(msg: 'Alamat email sudah digunakan!');
      } else {
        Fluttertoast.showToast(msg: 'Terjadi kesalahan! coba lagi nanti.');
      }
    }
  }

  void saveUserDataToFirestore() {
    final usersRef = FirebaseFirestore.instance.collection('users');
    usersRef.doc(user?.uid).set({
      'id': user?.uid,
      'name': nameCtrl.text,
      'email': user?.email,
      'tps_id': '9XudJQLlvtZm8pgQEJnG',
      'photo_url': Helpers.generatePhotoUrl(nameCtrl.text),
      'created_at': user?.metadata.creationTime!.toIso8601String(),
    });
  }
}
