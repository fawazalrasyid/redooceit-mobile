import 'package:get/get.dart';

import '../controllers/biopond_maggot_controller.dart';

class BiopondMaggotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BiopondMaggotController>(
      () => BiopondMaggotController(),
    );
  }
}
