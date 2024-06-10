import 'package:get/get.dart';

import '../controllers/waste_processing_controller.dart';

class WasteProcessingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WasteProcessingController>(
      () => WasteProcessingController(),
    );
  }
}
