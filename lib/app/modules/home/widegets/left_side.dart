import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teen_patti/app/modules/home/controllers/home_controller.dart';

import '../../../../utily/app_colors.dart';
import '../home_json.dart';

class LeftSide extends GetView<HomeController> {
  const LeftSide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> list = ["100", "1000", "10000"];
    return Container(
      padding: EdgeInsets.only(left: 20),
      transform: Matrix4.translationValues(0.0, 0.0, 0.0),
      //height: size.height * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: list.map((e) =>  InkWell(
          onTap: (){
            //make condition for each icon
            controller.setAmount(e);
          },
          child: Container(
            width: 150,
            height: 50,
            margin: EdgeInsets.only(bottom: 25),
            decoration: BoxDecoration(
              color: AppColors.buttonBg,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                '+$e',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        )).toList(),
      ),
      );
  }
}
