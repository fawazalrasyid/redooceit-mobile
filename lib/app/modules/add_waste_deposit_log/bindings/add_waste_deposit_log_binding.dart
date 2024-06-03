import 'package:get/get.dart';

import '../controllers/add_waste_deposit_log_controller.dart';

class AddWasteDepositLogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddWasteDepositLogController>(
      () => AddWasteDepositLogController(),
    );
  }
}
