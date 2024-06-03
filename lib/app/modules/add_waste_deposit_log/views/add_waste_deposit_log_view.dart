import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:redooceit/app/core/widgets/custom_app_bar.dart';
import 'package:redooceit/app/core/widgets/form_item.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../../core/widgets/custom_clip.dart';
import '../../../data/models/member_model.dart';
import '../controllers/add_waste_deposit_log_controller.dart';

class AddWasteDepositLogView extends GetView<AddWasteDepositLogController> {
  const AddWasteDepositLogView({Key? key}) : super(key: key);
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
                        'Setor Sampah',
                        style: TextStyle(
                          color: Color(0xFF2A2D35),
                          fontSize: 24,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Isi detail setoran sampah makanan dari masyarakat.',
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
                    const Text(
                      'Penyetor',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF0E132E),
                        fontSize: 14,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    controller.isLoading.value
                        ? Container()
                        : controller.members.value == null
                            ? Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: AppValues.margin,
                                ),
                                child: const Center(
                                  child: Text(
                                    'Belum ada data anggota',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF090A0A),
                                      fontSize: 14,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              )
                            : DropdownSearch<Member>(
                                items: controller.members.value!,
                                onChanged: (Member? value) {
                                  controller.selectedMember = value!;
                                  controller.weightCtrl.clear();
                                  controller.stampCtrl.clear();
                                },
                                selectedItem: controller.selectedMember,
                                filterFn: (item, query) {
                                  return item.name
                                          .toLowerCase()
                                          .contains(query.toLowerCase()) ||
                                      item.phoneNumber
                                          .toLowerCase()
                                          .contains(query.toLowerCase()) ||
                                      item.address
                                          .toLowerCase()
                                          .contains(query.toLowerCase());
                                },
                                popupProps: PopupProps.menu(
                                  showSearchBox: true,
                                  menuProps: MenuProps(
                                    backgroundColor: AppColors.pageBackground,
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  searchFieldProps: TextFieldProps(
                                    decoration: InputDecoration(
                                      enabled: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                          color: AppColors.textFieldBorder,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                          color:
                                              AppColors.focusedTextFieldBorder,
                                        ),
                                      ),
                                      border: InputBorder.none,
                                      hintText: 'Cari anggota',
                                      hintStyle: const TextStyle(
                                        color: AppColors.textFieldHint,
                                        fontSize: 14,
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w400,
                                      ),
                                      contentPadding: const EdgeInsets.all(14),
                                    ),
                                  ),
                                  itemBuilder: (context, item, isSelected) {
                                    return ListTile(
                                      title: Text(
                                        item.name,
                                        style: const TextStyle(
                                          color: Color(0xFF090A0A),
                                          fontSize: 16,
                                          fontFamily: 'DM Sans',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      subtitle: Row(
                                        children: [
                                          Text(
                                            item.phoneNumber,
                                            style: const TextStyle(
                                              color: Color(0xFF777777),
                                              fontSize: 12,
                                              fontFamily: 'DM Sans',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 4),
                                            width: 1,
                                            height: 14,
                                            color: const Color(0xFFEEF3F8),
                                          ),
                                          Expanded(
                                            child: Text(
                                              item.address,
                                              style: const TextStyle(
                                                color: Color(0xFF777777),
                                                fontSize: 12,
                                                fontFamily: 'DM Sans',
                                                fontWeight: FontWeight.w400,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      leading: SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                            item.photoUrl,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                dropdownButtonProps: DropdownButtonProps(
                                  icon: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    decoration: ShapeDecoration(
                                      color: const Color(0x2304D1BF),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: const Text(
                                      'Ganti',
                                      style: TextStyle(
                                        color: Color(0xFF005DAF),
                                        fontSize: 16,
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                                dropdownDecoratorProps:
                                    const DropDownDecoratorProps(
                                  dropdownSearchDecoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusColor: Colors.transparent,
                                  ),
                                ),
                                dropdownBuilder: (context, selectedItem) {
                                  return selectedItem == null
                                      ? Container(
                                          padding: const EdgeInsets.all(12),
                                          child: const Text(
                                            'Pilih anggota',
                                            style: TextStyle(
                                              color: Color(0xFF0E132E),
                                              fontSize: 16,
                                              fontFamily: 'DM Sans',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        )
                                      : Row(
                                          children: [
                                            SizedBox(
                                              height: 50,
                                              width: 50,
                                              child: CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                  selectedItem.photoUrl,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 16),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    selectedItem.name,
                                                    style: const TextStyle(
                                                      color: Color(0xFF090A0A),
                                                      fontSize: 16,
                                                      fontFamily: 'DM Sans',
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        selectedItem
                                                            .phoneNumber,
                                                        style: const TextStyle(
                                                          color:
                                                              Color(0xFF777777),
                                                          fontSize: 12,
                                                          fontFamily: 'DM Sans',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .symmetric(
                                                            horizontal: 4),
                                                        width: 1,
                                                        height: 14,
                                                        color: const Color(
                                                            0xFFEEF3F8),
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          selectedItem.address,
                                                          style:
                                                              const TextStyle(
                                                            color: Color(
                                                                0xFF777777),
                                                            fontSize: 12,
                                                            fontFamily:
                                                                'DM Sans',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 16),
                                          ],
                                        );
                                },
                              ),
                    const SizedBox(height: 24),
                    FormItem(
                      controller: controller.weightCtrl,
                      validator: controller.checkIsValidForm,
                      label: 'Berat Sampah',
                      hintLabel: '0',
                      inputType:
                          const TextInputType.numberWithOptions(decimal: true),
                      isRequired: false,
                      suffixIcon: Container(
                        height: 50,
                        width: 70,
                        margin: const EdgeInsets.all(2),
                        padding: const EdgeInsets.all(6),
                        alignment: Alignment.center,
                        decoration: const ShapeDecoration(
                          color: Color(0xFF011D36),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(6),
                              bottomRight: Radius.circular(6),
                            ),
                          ),
                        ),
                        child: const Text(
                          'KG',
                          style: TextStyle(
                            color: Color(0xFFABC3CD),
                            fontSize: 14,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    FormItem(
                      controller: controller.stampCtrl,
                      validator: controller.checkIsValidForm,
                      label: 'Kalkulasi Stamps',
                      hintLabel: '0',
                      inputType:
                          const TextInputType.numberWithOptions(decimal: true),
                      isRequired: false,
                      suffixIcon: Container(
                        height: 50,
                        width: 70,
                        margin: const EdgeInsets.all(2),
                        padding: const EdgeInsets.all(6),
                        alignment: Alignment.center,
                        decoration: const ShapeDecoration(
                          color: Color(0xFF011D36),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(6),
                              bottomRight: Radius.circular(6),
                            ),
                          ),
                        ),
                        child: const Text(
                          'Stamps',
                          style: TextStyle(
                            color: Color(0xFFABC3CD),
                            fontSize: 14,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
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
                      ? () => controller.saveWasteDepositLog()
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
