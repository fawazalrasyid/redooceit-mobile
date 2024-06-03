import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../../core/widgets/custom_clip.dart';
import '../../../core/widgets/form_item.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipPath(
                clipper: CustomClip(),
                child: Container(
                  color: const Color(0xFF001C35),
                  width: Get.width,
                  padding: const EdgeInsets.only(top: 48, bottom: 64),
                  child: SafeArea(
                    child: Image.asset(
                      'assets/images/redooceit_logo.png',
                      height: 40,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppValues.padding,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    const Text(
                      "Selamat datang!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF080814),
                        fontSize: 24,
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Silahkan masuk untuk dengan data yang terdaftar.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF52525B),
                        fontSize: 14,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 40),
                    FormItem(
                      controller: controller.nameCtrl,
                      validator: controller.checkIsValidForm,
                      label: "Nama Lengkap",
                      hintLabel: "Masukkan nama lengkap",
                      inputType: TextInputType.name,
                      isRequired: true,
                    ),
                    const SizedBox(height: 20),
                    FormItem(
                      controller: controller.emailCtrl,
                      validator: controller.checkIsValidForm,
                      label: "Email",
                      hintLabel: "Masukkan email",
                      inputType: TextInputType.emailAddress,
                      isRequired: true,
                    ),
                    const SizedBox(height: 20),
                    FormItem(
                      controller: controller.passwordCtrl,
                      validator: controller.checkIsValidForm,
                      label: "Kata sandi",
                      hintLabel: "Masukkan kata sandi",
                      inputType: TextInputType.visiblePassword,
                      isRequired: true,
                    ),
                    const SizedBox(height: 20),
                    FormItem(
                      controller: controller.confirmPasswordCtrl,
                      validator: controller.checkIsValidForm,
                      label: "Ulangi Kata sandi",
                      hintLabel: "Masukkan ulang kata sandi",
                      inputType: TextInputType.visiblePassword,
                      isRequired: true,
                    ),
                    const SizedBox(height: 42),
                    SizedBox(
                      width: Get.width,
                      child: ElevatedButton(
                        onPressed: controller.isValidForm.value
                            ? () => controller.register()
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.colorPrimary,
                          elevation: 0,
                          padding: const EdgeInsets.fromLTRB(64, 16, 64, 16),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 2,
                              strokeAlign: BorderSide.strokeAlignOutside,
                              color: controller.isValidForm.value
                                  ? const Color(0xFF0AB2A4)
                                  : const Color(0xFFACC3CD),
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: controller.isLoading.value
                            ? const SizedBox(
                                height: 18,
                                width: 18,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : const Text(
                                "Daftar",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sudah punya akun? ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF64748B),
                              fontSize: 14,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "Login",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF06335B),
                              fontSize: 13,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}
