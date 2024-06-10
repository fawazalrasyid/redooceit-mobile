import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';
import 'package:redooceit/app/modules/activity_log/views/activity_log_view.dart';
import 'package:redooceit/app/modules/coming_soon/views/coming_soon_view.dart';
import 'package:redooceit/app/modules/profile/views/profile_view.dart';
import 'package:redooceit/app/modules/report/views/report_view.dart';

import '../../../core/values/app_colors.dart';
import '../../home/views/home_view.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  MainView({super.key});
  @override
  final MainController controller = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) {
        return Scaffold(
          body: IndexedStack(
            index: controller.tabIndex.value,
            children: [
              HomeView(),
              const ReportView(),
              ActivityLogView(),
              ProfileView()
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppColors.white,
            currentIndex: controller.tabIndex.value,
            onTap: controller.changeTabIndex,
            selectedItemColor: AppColors.selectedNavbarIcon,
            unselectedItemColor: AppColors.navbarIcon,
            type: BottomNavigationBarType.fixed,
            iconSize: 24,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(IconlyLight.home),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.clipboard_text),
                label: 'Laporan',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.calendar_tick),
                label: 'Riwayat',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.profile_circle),
                label: 'Profil',
              ),
            ],
          ),
        );
      },
    );
  }
}
