import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teen_patti/app/modules/home/controllers/home_controller.dart';
import 'package:teen_patti/utily/assets.dart';

import '../home_json.dart';

class RightSideIcons extends GetView<HomeController> {
  const RightSideIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      transform: Matrix4.translationValues(0.0, -20.0, 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){},
            child: SizedBox(
              width: 50,
              height: 50,
              child: Image.asset(AppAssets.help),
            ),
          ),
         // SizedBox(height: 7,),
          InkWell(
            onTap: (){},
            child: SizedBox(
              width: 50,
              height: 50,
              child: Image.asset(AppAssets.share),
            ),
          ),
          //SizedBox(height: 7,),
          InkWell(
            onTap: (){
              controller.soundController();
            },
            child: SizedBox(
              width: 50,
              height: 50,
              child: Obx((){
                return Image.asset(controller.isSound.value ? AppAssets.sound : AppAssets.sound_off);
              }),
            ),
          ),
         // SizedBox(height: 7,),
          InkWell(
            onTap: (){},
            child: SizedBox(
              width: 50,
              height: 50,
              child: Image.asset(AppAssets.bonus),
            ),
          ),
        ],
      ),
    );
  }
}
