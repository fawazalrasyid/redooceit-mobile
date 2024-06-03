import 'package:get/get.dart';

import '../../../data/models/member_model.dart';

class MemberProfileController extends GetxController {
  final isBlank = false.obs;

  Member member = Get.arguments;

  @override
  void onInit() {
    super.onInit();
  }
}
