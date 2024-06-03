import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class ProfileController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  final isLoading = false.obs;

  @override
  Future<void> onInit() async {
    user = auth.currentUser;
    super.onInit();
  }

  void logout() {
    FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
