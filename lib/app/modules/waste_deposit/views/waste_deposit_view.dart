import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:redooceit/app/core/widgets/member_item.dart';
import 'package:redooceit/app/data/models/waste_deposit_model.dart';

import '../../../core/utils/helpers.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../../core/widgets/custom_clip.dart';
import '../../../core/widgets/custom_refresh_header.dart';
import '../../../core/widgets/empty_data.dart';
import '../../../core/widgets/waste_deposit_item.dart';
import '../../../data/models/member_model.dart';
import '../controllers/waste_deposit_controller.dart';

class WasteDepositView extends GetView<WasteDepositController> {
  const WasteDepositView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DefaultTabController(
        length: 2,
        child: Scaffold(
          body: NestedScrollView(
            controller: controller.scrollController,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                Obx(
                  () => SliverAppBar(
                    leadingWidth: Get.width,
                    leading: SafeArea(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: AppValues.padding,
                        ),
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
                            const SizedBox(width: 16),
                            const Expanded(
                              child: Text(
                                'Setoran Warga',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            const SizedBox(
                              width: 40,
                              height: 40,
                            )
                          ],
                        ),
                      ),
                    ),
                    backgroundColor: controller.isSliverAppBarExpanded.value
                        ? AppColors.pageBackground
                        : AppColors.appBarColor,
                    pinned: true,
                    expandedHeight: 410,
                    flexibleSpace: FlexibleSpaceBar(
                      background: ClipPath(
                        clipper: CustomClip(),
                        child: Container(
                          color: const Color(0xFF001C35),
                          child: SafeArea(
                            child: Column(
                              children: [
                                const SizedBox(height: 24 + kToolbarHeight),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: AppValues.margin,
                                  ),
                                  child: Image.asset(
                                    'assets/images/list_user.png',
                                    width: Get.width * 0.6,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: AppValues.margin,
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        '${controller.totalMembers.value}',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Color(0xFF34D2C5),
                                          fontSize: 64,
                                          fontFamily: 'DM Sans',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const Text(
                                        'Masyarakat giat pilah & setor',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontFamily: 'DM Sans',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: AppValues.margin,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () =>
                                              controller.addMember(),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xFFFBA536),
                                            elevation: 0,
                                            padding: const EdgeInsets.all(16),
                                            shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                width: 2,
                                                strokeAlign: BorderSide
                                                    .strokeAlignOutside,
                                                color: Color(0xFFE18D20),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                          child: const Text(
                                            "Anggota Baru",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily: 'DM Sans',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () =>
                                              controller.addDataWasteDeposit(),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                AppColors.colorPrimary,
                                            elevation: 0,
                                            padding: const EdgeInsets.all(16),
                                            shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                width: 2,
                                                strokeAlign: BorderSide
                                                    .strokeAlignOutside,
                                                color: Color(0xFF0AB2A4),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                          child: const Text(
                                            "Setor Sampah",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily: 'DM Sans',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
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
                ),
                SliverPersistentHeader(
                  delegate: _SliverAppBarDelegate(
                    const TabBar(
                      labelColor: AppColors.selectedTabBar,
                      unselectedLabelColor: AppColors.tabBar,
                      indicatorColor: AppColors.selectedTabBar,
                      dividerColor: Color(0xFFE4E9EC),
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      tabs: [
                        Tab(text: "Riwayat Setor"),
                        Tab(text: "Semua Anggota"),
                      ],
                    ),
                  ),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              children: [
                tab1(),
                tab2(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget tab1() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppValues.margin,
      ),
      child: controller.isLoading.value
          ? Container(
              padding: const EdgeInsets.all(42),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
          : controller.wasteDeposits.value!.isEmpty
              ? const EmptyData(
                  text: 'Belum ada Data\nyang ditampilkan',
                  imageSize: 140,
                  fontSize: 18,
                )
              : RefreshIndicator(
                  onRefresh: controller.onRefresh,
                  child: SingleChildScrollView(
                    child: GroupedListView<WasteDeposit, String>(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      elements: controller.wasteDeposits.value!,
                      groupBy: (element) =>
                          DateFormat('yyyy-MM-dd').format(element.date),
                      groupComparator: (value1, value2) =>
                          value2.compareTo(value1),
                      groupSeparatorBuilder: (String value) => Padding(
                        padding: const EdgeInsets.only(
                          top: 24,
                          bottom: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              IconlyBold.calendar,
                              size: 20,
                              color: Color(0xffA2B5C5),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                Helpers.formatDateFromString(value),
                                style: const TextStyle(
                                  color: Color(0xFF777777),
                                  fontSize: 14,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Helpers.formatDate(DateTime.now()) ==
                                    Helpers.formatDateFromString(value)
                                ? const Text(
                                    'Hari Ini',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xFFFBA536),
                                      fontSize: 14,
                                      fontFamily: 'DM Sans',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ),
                      itemBuilder: (context, element) {
                        return WasteDepositItem(
                          data: element,
                        );
                      },
                    ),
                  ),
                ),
    );
  }

  Widget tab2() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppValues.margin,
      ),
      child: controller.isLoading.value
          ? Container(
              padding: const EdgeInsets.all(42),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
          : controller.members.value!.isEmpty
              ? const EmptyData(
                  text: 'Belum ada Data\nyang ditampilkan',
                  imageSize: 140,
                  fontSize: 18,
                )
              : RefreshIndicator(
                  onRefresh: controller.onRefresh,
                  child: SingleChildScrollView(
                    child: GroupedListView<Member, String>(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      elements: controller.members.value!,
                      order: GroupedListOrder.DESC,
                      groupBy: (element) => element.name[0].toUpperCase(),
                      groupComparator: (value1, value2) =>
                          value2.compareTo(value1),
                      groupSeparatorBuilder: (String value) => Padding(
                        padding: const EdgeInsets.only(
                          top: 24,
                          bottom: 16,
                        ),
                        child: Text(
                          value,
                          style: const TextStyle(
                            color: Color(0xFF777777),
                            fontSize: 14,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      itemBuilder: (context, element) {
                        return MemberItem(
                          data: element,
                        );
                      },
                    ),
                  ),
                ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _SliverAppBarDelegate(this.tabBar);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: AppColors.pageBackground,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
