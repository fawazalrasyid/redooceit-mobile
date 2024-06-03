import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/utils/helpers.dart';
import '../../../core/values/app_values.dart';
import '../../../core/widgets/empty_data.dart';
import '../../../core/widgets/waste_deposit_item.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RefreshIndicator(
        onRefresh: controller.onRefresh,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/home_page_bg.png'),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(AppValues.margin),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Halo ${controller.user!.displayName}!',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/pin_location.png',
                                height: 16,
                              ),
                              const SizedBox(width: 8),
                              const SizedBox(
                                width: 97,
                                height: 20,
                                child: Text(
                                  'TPS 3R Bagja',
                                  style: TextStyle(
                                    color: Color(0xFFF3F8FA),
                                    fontSize: 12,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(AppValues.margin),
                      padding: const EdgeInsets.all(16),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0xFFF2F6F7)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x07151A47),
                            blurRadius: 16,
                            offset: Offset(0, 8),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Pengolahan Sampah Makanan',
                            style: TextStyle(
                              color: Color(0xFF010005),
                              fontSize: 16,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                IconlyBold.calendar,
                                color: Color(0xFFFBA535),
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                Helpers.formatDate(DateTime.now()),
                                style: const TextStyle(
                                  color: Color(0xFF010005),
                                  fontSize: 12,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: ShapeDecoration(
                              color: const Color(0xFF001C35),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 32,
                                        height: 32,
                                        padding: const EdgeInsets.all(6.40),
                                        decoration: ShapeDecoration(
                                          gradient: const LinearGradient(
                                            begin: Alignment(-0.00, -1.00),
                                            end: Alignment(0, 1),
                                            colors: [
                                              Color(0xFF1F6ECB),
                                              Color(0xFF003667)
                                            ],
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6.40),
                                          ),
                                        ),
                                        child: const Icon(
                                          IconlyBold.download,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Terkumpul',
                                            style: TextStyle(
                                              color: Color(0xFFF3F8FA),
                                              fontSize: 12,
                                              fontFamily: 'DM Sans',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            Helpers.formatGramToKg(
                                              controller.todayTotalWasteReceived
                                                  .value,
                                            ),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily: 'DM Sans',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  width: 1,
                                  height: 32,
                                  color:
                                      const Color(0xFFFFFFFF).withOpacity(0.5),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 32,
                                        height: 32,
                                        padding: const EdgeInsets.all(6.40),
                                        decoration: ShapeDecoration(
                                          gradient: const LinearGradient(
                                            begin: Alignment(0.00, -1.00),
                                            end: Alignment(0, 1),
                                            colors: [
                                              Color(0xFF12CABA),
                                              Color(0xFF058076)
                                            ],
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6.40),
                                          ),
                                        ),
                                        child: const Icon(
                                          IconlyBold.setting,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Terolah',
                                            style: TextStyle(
                                              color: Color(0xFFF3F8FA),
                                              fontSize: 12,
                                              fontFamily: 'DM Sans',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            Helpers.formatGramToKg(
                                              controller
                                                  .todayTotalWasteProcessed
                                                  .value,
                                            ),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily: 'DM Sans',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: AppValues.margin,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => Get.toNamed(Routes.WASTE_PROCESSING),
                              child: Column(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    padding: const EdgeInsets.all(12),
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFF012F59),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(38),
                                      ),
                                    ),
                                    child: Image.asset(
                                      'assets/images/chat.png',
                                      height: 36,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Catat Sampah',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF2A2D35),
                                      fontSize: 12,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => Get.toNamed(Routes.BIOPOND_MAGGOT),
                              child: Column(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    padding: const EdgeInsets.all(12),
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFF012F59),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(38),
                                      ),
                                    ),
                                    child: Image.asset(
                                      'assets/images/cart.png',
                                      height: 36,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Biopond Maggot',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF2A2D35),
                                      fontSize: 12,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => Get.toNamed(Routes.WASTE_DEPOSIT),
                              child: Column(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    padding: const EdgeInsets.all(12),
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFF012F59),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(38),
                                      ),
                                    ),
                                    child: Image.asset(
                                      'assets/images/user_info.png',
                                      height: 36,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Setoran Warga',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF2A2D35),
                                      fontSize: 12,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.BIOPOND_MAGGOT),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: AppValues.margin,
                        ),
                        padding: const EdgeInsets.all(12),
                        decoration: ShapeDecoration(
                          color: const Color(0xFF20D3C4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x07151A47),
                              blurRadius: 16,
                              offset: Offset(0, 8),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: const Border(
                              top: BorderSide(
                                width: 4,
                                color: Color(0xFF00A496),
                              ),
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x07151A47),
                                blurRadius: 16,
                                offset: Offset(0, 8),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: const Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Pantau & Panen Biopond',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Icon(
                                    Iconsax.arrow_right_3,
                                    color: Colors.black,
                                    size: 16,
                                  )
                                ],
                              ),
                              Text(
                                'Lihat perkembangan maggot secara otomatis dan catat hasilnya.',
                                style: TextStyle(
                                  color: Color(0xFF898D9B),
                                  fontSize: 12,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: AppValues.margin,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Setoran Warga',
                                style: TextStyle(
                                  color: Color(0xFF090A0A),
                                  fontSize: 16,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Get.toNamed(Routes.WASTE_DEPOSIT),
                                child: const Text(
                                  '+ Lihat Lainnya',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Color(0xFF20D3C4),
                                    fontSize: 14,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 16),
                          controller.isLoading.value
                              ? Container(
                                  padding: const EdgeInsets.all(42),
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              : controller.wasteDeposits.value!.isEmpty
                                  ? const EmptyData(
                                      text: 'Belum ada Data\nyang ditampilkan',
                                      imageSize: 90,
                                      fontSize: 12,
                                    )
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: controller
                                                  .wasteDeposits.value!.length >
                                              3
                                          ? 3
                                          : controller
                                              .wasteDeposits.value!.length,
                                      itemBuilder: (context, index) {
                                        return WasteDepositItem(
                                          isLastItem: index == 2,
                                          data: controller
                                              .wasteDeposits.value![index],
                                        );
                                      },
                                    )
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
