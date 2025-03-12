import 'package:get/get.dart';

import '../controllers/audio_play_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<AudioController>(
      () => AudioController(),
    );
  }
}
