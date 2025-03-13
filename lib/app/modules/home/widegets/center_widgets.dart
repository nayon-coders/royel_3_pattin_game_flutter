import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teen_patti/app/modules/home/controllers/home_controller.dart';

import '../../../../utily/app_colors.dart';
import '../../../../utily/assets.dart';
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
            child: Stack(
              children: [
                Container(
                  transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                  height: 280,
                  width: size.width ,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    // image: DecorationImage(
                    //   image: AssetImage(AppAssets.centerBG),
                    //   fit: BoxFit.fitWidth,
                    // ),
                  ),
                  child: Stack(
                    children: [
                      //center frame
                      Center(
                        child: Image.asset(AppAssets.centerFrame, height: 280, width: size.width, fit: BoxFit.contain,),
                      ),
                      //center text
                      Positioned(
                        top: 7,
                        child: Container(
                          width: size.width,
                          height: 280,
                          margin: EdgeInsets.only(left: 15, right: 15),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             //this is for 1st spin
                             Column(
                               children: [
                                 Obx(() {
                                   return Visibility(
                                     visible: controller.isSpin1st == false,
                                     child: Container(
                                       height: 250,
                                       width: 170,
                                       //padding: EdgeInsets.only(left: 1, top: 10),
                                       padding: EdgeInsets.all(5),
                                       child: Center(
                                         child: Obx(() {
                                             return Image.asset("${controller.nextCards.value.isEmpty ? controller.randomImages.value[0] : "assets/cards/${controller.nextCards.value[0]}"}",
                                               height: 250,
                                               width:170,
                                               fit: BoxFit.contain,
                                             );
                                           }
                                         ),
                                       ),
                                     ),
                                   );
                                 }
                                 ),
                                 Obx(() {
                                   return Visibility(
                                       visible: controller.isSpin1st.value,
                                       child: AnimationSlider(controller: controller, size: size)
                                   );
                                 }
                                 )
                               ],
                             ),

                             SizedBox(width: 15,),
                             //this is for 2nd spin
                             Column(
                               children: [
                                 Obx(() {
                                   return Visibility(
                                     visible: controller.isSpin2nd == false,
                                     child: Container(
                                       height: 250,
                                       width: 170,
                                       //padding: EdgeInsets.only(left: 1, top: 10),
                                       padding: EdgeInsets.all(5),
                                       child: Center(
                                         child: Obx(() {
                                           return Image.asset("${controller.nextCards.value.isEmpty ? controller.randomImages.value[1] : "assets/cards/${controller.nextCards.value[1]}"}",
                                             height: 250,
                                             width:170,
                                             fit: BoxFit.contain,
                                           );
                                         }
                                         ),
                                       ),
                                     ),
                                   );
                                 }
                                 ),
                                 Obx(() {
                                   return Visibility(
                                       visible: controller.isSpin2nd.value,
                                       child: AnimationSlider(controller: controller, size: size)
                                   );
                                 }
                                 )
                               ],
                             ),

                             SizedBox(width: 15,),
                             //this is for 3rd spin
                             Column(
                               children: [
                                 Obx(() {
                                   return Visibility(
                                     visible: controller.isSpin3tr == false,
                                     child: Container(
                                       height: 250,
                                       width: 170,
                                       //padding: EdgeInsets.only(left: 1, top: 10),
                                       padding: EdgeInsets.all(5),
                                       child: Center(
                                         child: Obx(() {
                                           return Image.asset("${controller.nextCards.value.isEmpty ? controller.randomImages.value[2] : "assets/cards/${controller.nextCards.value[2]}"}",
                                             height: 250,
                                             width:170,
                                             fit: BoxFit.contain,
                                           );
                                         }
                                         ),
                                       ),
                                     ),
                                   );
                                 }
                                 ),
                                 Obx(() {
                                   return Visibility(
                                       visible: controller.isSpin3tr.value,
                                       child: AnimationSlider(controller: controller, size: size)
                                   );
                                 }
                                 )
                               ],
                             )

                           ],
                         ),
                        ),
                      ),

                    ],
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
                        transform: Matrix4.translationValues(0.0, -8.0, 0.0),
                        height: size.height,
                        width: size.width,
                        margin: EdgeInsets.only(left: 15, right: 15),
                        color: Colors.black.withOpacity(0.5),
                        child: Center(
                          child: Stack(
                            children: [
                              // Border Text (Shadow Effect)
                              Text(
                                "Spin for test your luck",
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 4
                                    ..color = AppColors.textColor, // Border color
                                ),
                              ),
                              // Main Text (Filling the Inside)
                              Text(
                                "Spin for test your luck",
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black, // Inner text color
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
                Positioned(
                  bottom: 0,
                  child: BottomButtonsViews(size: size,),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}

class AnimationSlider extends StatelessWidget {
  const AnimationSlider({
    super.key,
    required this.controller,
    required this.size,
  });

  final HomeController controller;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 170,
      child: CarouselSlider(
        items: controller.finalImageList.value.map((e) {
          return Container(
            //padding: EdgeInsets.only(left: 1, top: 10),
            padding: EdgeInsets.all(5),
            child: Center(
              child: Image.asset(e,
                height: 250,
                width: 170,
                fit: BoxFit.contain,
              ),
            ),
          );
        }).toList(),
        options: CarouselOptions(
          height: size.width*.27,
          autoPlay: true,
          enlargeCenterPage: false,
          viewportFraction: 1,
          autoPlayAnimationDuration: const Duration(milliseconds: 150),
          autoPlayInterval: const Duration(milliseconds: 100),
          scrollDirection: Axis.vertical, // Keep it vertical
        ),
      ),
    );
  }
}