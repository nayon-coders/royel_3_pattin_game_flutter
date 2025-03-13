import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teen_patti/app/modules/home/controllers/home_controller.dart';

import '../../../../utily/app_colors.dart';
import '../../../../utily/assets.dart';
import '../../main/views/main_view.dart';
import '../views/home_view.dart';

class CenterWidgets extends GetView<HomeController> {
  const CenterWidgets({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          SizedBox(
            height: 320,
            width: size.width,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: BottomButtonsViews( size: size,),
                ),
                Container(
                  transform: Matrix4.translationValues(0.0, -40.0, 0.0),
                  width: size.width,
                  //margin: EdgeInsets.only(left: 5, right: 5),
                  decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(5),
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: AssetImage(AppAssets.centerBG),
                      fit: BoxFit.fill,
                    ),
                    //border: Border.all(color:Color(0xffD32215), width: 10),
                  ),
                  child: Container(
                    decoration: BoxDecoration(

                    ),
                    width: size.width,
                    height: 288,
                    margin: EdgeInsets.only(left: 8),
                   child: Row(
                     children: [
                       Obx(() {
                         if(controller.isSpin1st.value == true){
                            return AnimationSlider(controller: controller,  );
                         }else{
                            return Container(
                              height: 280,
                              width: 200,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Obx(() {
                                  return Image.asset("${controller.nextCards.value.isEmpty ? controller.randomImages.value[0] : "assets/cards/${controller.nextCards.value[0]}"}",
                                    height: 280,
                                    width: 200,
                                    fit: BoxFit.contain,
                                  );
                                }
                                ),
                              ),
                            );
                         }
                         }
                       ),
                       SizedBox(width: 12,),
                        Obx(() {
                          if(controller.isSpin2nd.value == true){
                            return AnimationSlider(controller: controller);
                          }else{
                            return Container( 
                              height: 280,
                              width: 200,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Obx(() {
                                  return Image.asset("${controller.nextCards.value.isEmpty ? controller.randomImages.value[1] : "assets/cards/${controller.nextCards.value[1]}"}",
                                    height: 280,
                                    width: 200,
                                    fit: BoxFit.contain,
                                  );
                                }
                                ),
                              ),
                            );
                          }
                          }
                        ),
                       SizedBox(width: 12,),
                        Obx(() {
                          if(controller.isSpin3tr.value == true){
                            return AnimationSlider(controller: controller,  );
                          }else{
                            return Container(
                              height: 280,
                              width: 200,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Obx(() {
                                  return Image.asset("${controller.nextCards.value.isEmpty ? controller.randomImages.value[2] : "assets/cards/${controller.nextCards.value[2]}"}",
                                    height: 280,
                                    width: 200,
                                    fit: BoxFit.contain,
                                  );
                                }
                                ),
                              ),
                            );
                          }
                          }
                        ),
                     ],
                   ),
                  ),
                ),
                Obx(() {
                  return Visibility(
                    visible: controller.isSpin.value == false,
                    child: Positioned(
                      top: 0,
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child: Container(
                        transform: Matrix4.translationValues(0.0, -40.0, 0.0),
                        height: 280,
                        width: size.width,
                        //margin: EdgeInsets.only(left: 15, right: 15),
                        color: Colors.black.withOpacity(0.6),
                        child: Center(
                          child: Stack(
                            children: [
                              // Border Text (Shadow Effect)
                              Text(
                                "SPIN for test your LUCK",
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w400,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 1
                                    ..color = AppColors.textColor, // Border color
                                ),
                              ),
                              // Main Text (Filling the Inside)
                              Text(
                                "SPIN for test your LUCK",
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black, // w text color
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}
