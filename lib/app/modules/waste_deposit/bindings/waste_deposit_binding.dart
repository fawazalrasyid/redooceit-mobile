import 'package:get/get.dart';

import '../controllers/waste_deposit_controller.dart';

class WasteDepositBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WasteDepositController>(
      () => WasteDepositController(),
    );
  }
}
