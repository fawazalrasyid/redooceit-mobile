import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_biopond_maggot_harvest_log_controller.dart';

class AddBiopondMaggotHarvestLogView
    extends GetView<AddBiopondMaggotHarvestLogController> {
  const AddBiopondMaggotHarvestLogView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddBiopondMaggotHarvestLogView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddBiopondMaggotHarvestLogView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
