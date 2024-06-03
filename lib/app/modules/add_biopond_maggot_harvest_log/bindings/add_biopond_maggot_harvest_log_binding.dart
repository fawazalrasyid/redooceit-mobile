import 'package:get/get.dart';

import '../controllers/add_biopond_maggot_harvest_log_controller.dart';

class AddBiopondMaggotHarvestLogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddBiopondMaggotHarvestLogController>(
      () => AddBiopondMaggotHarvestLogController(),
    );
  }
}
