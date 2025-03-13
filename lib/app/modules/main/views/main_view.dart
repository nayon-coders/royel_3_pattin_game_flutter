import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:teen_patti/app/modules/home/controllers/home_controller.dart';
import 'package:teen_patti/utily/assets.dart';

import '../../../../utily/app_colors.dart';
import '../../home/widegets/center_widgets.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<HomeController> {
  const MainView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.bg),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            //top logo
            Container(
                transform: Matrix4.translationValues(0.0, 00.0, 0.0),
                child: Center(child: Image.asset(AppAssets.logo, height: 100, width: 300,))),

            //left and right icons
            //left icons
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //left side
                    Container(
                      width: 12.w,
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: ["100", "1000", "10000"].map((e) =>  InkWell(
                          onTap: (){
                            //make condition for each icon
                            controller.setAmount(e);
                          },
                          child: Container(
                            width: 150,
                            height: 50,
                            margin: EdgeInsets.only(bottom: 25),
                            decoration: BoxDecoration(
                              color: Color(0xff9f0801),
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff670600),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ]
                            ),
                            child: Center(
                              child: Text(
                                '+$e',
                                style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        )).toList(),
                      ),
                    ),

                    //right side
                    Container(
                      width: 120,
                      child: Column(
                        children: [
                          Container(
                            transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: (){
                                    controller.buttonClickSound();
                                  },
                                  child: SizedBox(
                                    width: 10.w,
                                    height:10.h,
                                    child: Image.asset(AppAssets.help),
                                  ),
                                ),
                                 SizedBox(height: 7,),
                                InkWell(
                                  onTap: (){
                                    controller.buttonClickSound();
                                  },
                                  child: SizedBox(
                                    width: 10.w,
                                    height:10.h,
                                    child: Image.asset(AppAssets.share),
                                  ),
                                ),
                                SizedBox(height: 7,),
                                InkWell(
                                  onTap: (){
                                    controller.buttonClickSound();
                                    controller.soundController();
                                  },
                                  child: SizedBox(
                                    width: 10.w,
                                    height:10.h,
                                    child: Obx((){
                                      return Image.asset(controller.isSound.value ? AppAssets.sound : AppAssets.sound_off);
                                    }),
                                  ),
                                ),
                                SizedBox(height: 7,),
                                InkWell(
                                  onTap: (){},
                                  child: SizedBox(
                                    width: 10.w,
                                    height:10.h,
                                    child: Image.asset(AppAssets.bonus),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        //  SizedBox(height: 20,),
                          InkWell(
                            onTap: (){
                              if(controller.isSpin.value == false){
                                controller.getRandomImages();
                                controller.generateFinalImageList();
                                controller.startSpin();
                              }

                            },
                            child: Container(
                                child: Image.asset(AppAssets.spin, height: 20.h, width: 20.w, fit: BoxFit.contain,)),
                          )

                        ],
                      ),
                    ),
                  ],
                ),


                //buttom button
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      transform: Matrix4.translationValues(0.0, 30.0, 0.0),
                      alignment: Alignment.center,
                      width: 65.w,
                      height: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //button 1
                          Container(
                              width: 23.w,
                              height: 60,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Color(0xff8a2523),
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color:Color(0xff6d1b18), width: 7),
                                // image: DecorationImage(
                                //   image: AssetImage(AppAssets.button_red),
                                //   fit: BoxFit.cover,
                                // ),
                              ),

                              child: Row(
                                children: [
                                  Container(
                                    width: 11.w,
                                    height: 40,
                                    // margin: EdgeInsets.only(top: 7, bottom: 7,),
                                    decoration: BoxDecoration(
                                      color: Color(0xff5d2223)
                                    ),
                                    child: Center(
                                      child: Obx(() {
                                        return Text("Bet: ${controller.amount.value}",
                                          style: TextStyle(
                                            color: AppColors.textColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        );
                                      }
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child:  InkWell(
                                      onTap: (){
                                        controller.setAmount("0.00");
                                      },
                                      child: Container(
                                        // width: 8.w,
                                        // margin: EdgeInsets.only(top: 7, bottom: 7,),
                                        decoration: BoxDecoration(
                                            color: Color(0xff511b1b)
                                        ),
                                        child: Center(
                                          child: Text("Reset",
                                            style: TextStyle(
                                              color: AppColors.textColor,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                          ),

                          SizedBox(width: 10,),
                          Container(
                              width: 16.w,
                              height: 60,
                              //margin: EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                color: Color(0xff8a2523),
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color:Color(0xff6d1b18), width: 7),
                              ),
                              padding: EdgeInsets.only(left: 10,),
                              child: Column(
                                children: [
                                  Text("Balance",
                                    style: TextStyle(
                                      color: AppColors.textColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  //SizedBox(height: 3,),
                                  Row(
                                    children: [
                                      Image.asset(AppAssets.dollarMore, height: 15, width: 15,),
                                      SizedBox(width: 5,),
                                      Container(
                                        width: 9.w,
                                        height: 20,
                                        margin: EdgeInsets.only(top: 3),
                                        decoration: BoxDecoration(
                                         color: Color(0xff5d2223)
                                        ),
                                        child: Center(
                                          child: Text("10000",
                                            style: TextStyle(
                                              color: AppColors.textColor,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                          ),

                          SizedBox(width: 10,),
                          Container(
                              width: 16.w,
                              height: 60,
                              //margin: EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                color: Color(0xff8a2523),
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color:Color(0xff6d1b18), width: 7),
                              ),
                              padding: EdgeInsets.only(left: 10,),
                              child: Column(
                                children: [
                                  Text("Last Win",
                                    style: TextStyle(
                                      color: AppColors.textColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  //SizedBox(height: 3,),
                                  Row(
                                    children: [
                                      Image.asset(AppAssets.dollarMore, height: 15, width: 15,),
                                      SizedBox(width: 5,),
                                      Container(
                                        width: 9.w,
                                        height: 20,
                                        margin: EdgeInsets.only(top: 3),
                                        decoration: BoxDecoration(
                                         color: Color(0xff5d2223)
                                        ),
                                        child: Center(
                                          child: Text("100000",
                                            style: TextStyle(
                                              color: AppColors.textColor,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                ),


                //cards
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                    height: 63.h,
                    width: 65.w,
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.transparent,
                          image: DecorationImage(
                            image: AssetImage(AppAssets.centerBG),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // First Card Slot
                            Obx(() {
                              return controller.isSpin1st.value
                                  ? AnimationSlider(controller: controller)
                                  : buildCardContainer(
                                controller.nextCards.value.isEmpty
                                    ? controller.randomImages.value[0]
                                    : "assets/cards/${controller.nextCards.value[0]}",
                              );
                            }),

                            // Second Card Slot
                            Obx(() {
                              return controller.isSpin2nd.value
                                  ? AnimationSlider(controller: controller)
                                  : buildCardContainer(
                                controller.nextCards.value.isEmpty
                                    ? controller.randomImages.value[1]
                                    : "assets/cards/${controller.nextCards.value[1]}",
                              );
                            }),

                            // Third Card Slot
                            Obx(() {
                              return controller.isSpin3tr.value
                                  ? AnimationSlider(controller: controller)
                                  : buildCardContainer(
                                controller.nextCards.value.isEmpty
                                    ? controller.randomImages.value[2]
                                    : "assets/cards/${controller.nextCards.value[2]}",
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),


                Obx(() {
                  return Visibility(
                    visible: controller.isSpin.value == false,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        transform: Matrix4.translationValues(0.0, 28.0, 0.0),
                        height: 64.h,
                        width: 65.w,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              bottom: 20,
                              left: 0,
                              right: 0,
                              child: Container(
                                transform: Matrix4.translationValues(0.0, -40.0, 0.0),
                                height: 250,
                                width: 600,
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
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
                ),
              ],
            ),
            //bottom button
          ],
        ),
      )
    );
  }


// Helper method to create card container
  Widget buildCardContainer(String imagePath) {
    return Container(
      height: 55.h,
      width: 20.w,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Image.asset(
          imagePath,
          height: 250,
          width: 250,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}


class AnimationSlider extends StatelessWidget {
  const AnimationSlider({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      width: 20.w,
      child: CarouselSlider(
        items: controller.finalImageList.value.map((e) {
          return Container(
            height: 55.h,
            width: 20.w,
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Image.asset("$e",
                height: 55.h,
                width: 20.w,
                fit: BoxFit.contain,
              )
            ),
          );
        }).toList(),
        options: CarouselOptions(
          height: 250,
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
