import 'package:get/get.dart';

import '../controllers/frod_controller.dart';

class FrodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FrodController>(
      () => FrodController(),
    );
  }
}
