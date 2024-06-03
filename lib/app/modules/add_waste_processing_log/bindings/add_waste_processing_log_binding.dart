import 'package:get/get.dart';

import '../controllers/add_waste_processing_log_controller.dart';

class AddWasteProcessingLogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddWasteProcessingLogController>(
      () => AddWasteProcessingLogController(),
    );
  }
}
