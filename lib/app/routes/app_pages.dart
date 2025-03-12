import 'package:get/get.dart';

import '../modules/flash/bindings/flash_binding.dart';
import '../modules/flash/views/flash_view.dart';
import '../modules/frod/bindings/frod_binding.dart';
import '../modules/frod/views/frod_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.FLASH,
      page: () => const FlashView(),
      binding: FlashBinding(),
    ),
    GetPage(
      name: _Paths.FROD,
      page: () => const FrodView(),
      binding: FrodBinding(),
    ),
  ];
}
