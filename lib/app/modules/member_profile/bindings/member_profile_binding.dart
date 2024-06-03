import 'package:get/get.dart';

import '../controllers/member_profile_controller.dart';

class MemberProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MemberProfileController>(
      () => MemberProfileController(),
    );
  }
}
