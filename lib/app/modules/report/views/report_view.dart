import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/report_controller.dart';

class ReportView extends GetView<ReportController> {
  const ReportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: SingleChildScrollView(
            child: Image.asset('assets/images/report.png'),
          ),
        ),
      ),
    );
  }
}
