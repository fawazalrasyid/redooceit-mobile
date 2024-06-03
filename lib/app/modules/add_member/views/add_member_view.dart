import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:redooceit/app/core/widgets/custom_app_bar.dart';
import 'package:redooceit/app/core/widgets/form_item.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../../core/widgets/custom_clip.dart';
import '../controllers/add_member_controller.dart';

class AddMemberView extends GetView<AddMemberController> {
  const AddMemberView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: CustomAppBar(
          height: 60,
          backgroundColor: const Color(0xFFF3F8FA),
          child: SafeArea(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: AppValues.padding),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Icon(
                        IconlyLight.arrow_left_2,
                        size: 18,
                        color: Color(0xFF030319),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipPath(
                clipper: CustomClip(),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppValues.padding,
                  ),
                  color: const Color(0xFFF3F8FA),
                  child: const Column(
                    children: [
                      SizedBox(height: 24),
                      Text(
                        'Daftarkan Anggota',
                        style: TextStyle(
                          color: Color(0xFF2A2D35),
                          fontSize: 24,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Isi detail formulir untuk anggota baru setor sampah makanan.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF82838A),
                          fontSize: 16,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 64),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppValues.padding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FormItem(
                      controller: controller.nameCtrl,
                      validator: controller.checkIsValidForm,
                      label: 'Nama',
                      hintLabel: 'Masukkan nama member',
                      inputType: TextInputType.name,
                      isRequired: true,
                    ),
                    const SizedBox(height: 24),
                    FormItem(
                      controller: controller.phoneNumberCtrl,
                      validator: controller.checkIsValidForm,
                      label: 'No. Whatsapp',
                      hintLabel: 'Masukkan nama member',
                      inputType: TextInputType.phone,
                      isRequired: true,
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: FormItem(
                            controller: controller.rtCtrl,
                            validator: controller.checkIsValidForm,
                            label: 'RT',
                            hintLabel: '00',
                            inputType: TextInputType.number,
                            isRequired: true,
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: FormItem(
                            controller: controller.rwCtrl,
                            validator: controller.checkIsValidForm,
                            label: 'RW',
                            hintLabel: '00',
                            inputType: TextInputType.number,
                            isRequired: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    FormItem(
                      controller: controller.addressCtrl,
                      validator: controller.checkIsValidForm,
                      label: 'Alamat Lengkap',
                      hintLabel: 'Masukkan alamat lengkap',
                      inputType: TextInputType.streetAddress,
                      isRequired: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: AppValues.margin,
                ),
                width: Get.width,
                child: ElevatedButton(
                  onPressed: controller.isValidForm.value
                      ? () => controller.saveMember()
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
                          "Simpan",
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
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}
