import 'package:get/get.dart';

import '../modules/activity_log/bindings/activity_log_binding.dart';
import '../modules/activity_log/views/activity_log_view.dart';
import '../modules/add_biopond_maggot_harvest_log/bindings/add_biopond_maggot_harvest_log_binding.dart';
import '../modules/add_biopond_maggot_harvest_log/views/add_biopond_maggot_harvest_log_view.dart';
import '../modules/add_member/bindings/add_member_binding.dart';
import '../modules/add_member/views/add_member_view.dart';
import '../modules/add_waste_deposit_log/bindings/add_waste_deposit_log_binding.dart';
import '../modules/add_waste_deposit_log/views/add_waste_deposit_log_view.dart';
import '../modules/add_waste_processing_log/bindings/add_waste_processing_log_binding.dart';
import '../modules/add_waste_processing_log/views/add_waste_processing_log_view.dart';
import '../modules/biopond_maggot/bindings/biopond_maggot_binding.dart';
import '../modules/biopond_maggot/views/biopond_maggot_view.dart';
import '../modules/coming_soon/bindings/coming_soon_binding.dart';
import '../modules/coming_soon/views/coming_soon_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/member_profile/bindings/member_profile_binding.dart';
import '../modules/member_profile/views/member_profile_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/waste_deposit/bindings/waste_deposit_binding.dart';
import '../modules/waste_deposit/views/waste_deposit_view.dart';
import '../modules/waste_processing/bindings/waste_processing_binding.dart';
import '../modules/waste_processing/views/waste_processing_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.COMING_SOON,
      page: () => const ComingSoonView(),
      binding: ComingSoonBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.WASTE_DEPOSIT,
      page: () => const WasteDepositView(),
      binding: WasteDepositBinding(),
    ),
    GetPage(
      name: _Paths.BIOPOND_MAGGOT,
      page: () => const BiopondMaggotView(),
      binding: BiopondMaggotBinding(),
    ),
    GetPage(
      name: _Paths.WASTE_PROCESSING,
      page: () => const WasteProcessingView(),
      binding: WasteProcessingBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.ADD_WASTE_PROCESSING_LOG,
      page: () => const AddWasteProcessingLogView(),
      binding: AddWasteProcessingLogBinding(),
    ),
    GetPage(
      name: _Paths.ACTIVITY_LOG,
      page: () => ActivityLogView(),
      binding: ActivityLogBinding(),
    ),
    GetPage(
      name: _Paths.ADD_WASTE_DEPOSIT_LOG,
      page: () => const AddWasteDepositLogView(),
      binding: AddWasteDepositLogBinding(),
    ),
    GetPage(
      name: _Paths.MEMBER_PROFILE,
      page: () => const MemberProfileView(),
      binding: MemberProfileBinding(),
    ),
    GetPage(
      name: _Paths.ADD_MEMBER,
      page: () => const AddMemberView(),
      binding: AddMemberBinding(),
    ),
    GetPage(
      name: _Paths.ADD_BIOPOND_MAGGOT_HARVEST_LOG,
      page: () => const AddBiopondMaggotHarvestLogView(),
      binding: AddBiopondMaggotHarvestLogBinding(),
    ),
  ];
}
