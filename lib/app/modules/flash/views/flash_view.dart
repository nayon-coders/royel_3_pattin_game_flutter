import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teen_patti/app/routes/app_pages.dart';
import 'package:teen_patti/utily/assets.dart';

import '../controllers/flash_controller.dart';

class FlashView extends GetView<FlashController> {
  const FlashView({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return StreamBuilder(
      stream: null,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(controller.isPaid.value == false){
          Get.offAllNamed(Routes.FROD);
        }else{
          Future.delayed(const Duration(seconds: 2), () {
            Get.offAllNamed(Routes.HOME); //
          });
        }

        return Scaffold(
          body: Image.asset(AppAssets.splash, fit: BoxFit.cover, height: size.height, width: size.width, ),
        );
      },
    );
  }
}
