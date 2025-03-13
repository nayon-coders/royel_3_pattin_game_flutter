import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
                    Container(
                      width: 100,
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
                              color: AppColors.buttonBg,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                '+$e',
                                style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )).toList(),
                      ),
                    ),
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
                                  onTap: (){},
                                  child: SizedBox(
                                    width: 50,
                                    height:50,
                                    child: Image.asset(AppAssets.help),
                                  ),
                                ),
                                // SizedBox(height: 7,),
                                InkWell(
                                  onTap: (){},
                                  child: SizedBox(
                                    width: 50,
                                    height:50,
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
                                    height:50,
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
                                    height:50,
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
                                child: Image.asset(AppAssets.spin, height: 90, width: 100, fit: BoxFit.contain,)),
                          )

                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //button 1
                        Container(
                            width: 210,
                            height: 70,
                            // margin: EdgeInsets.only(left: 5, right: 5),
                            decoration: BoxDecoration(
                              color: AppColors.buttonBg,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color:Color(0xffC91016), width: 7),
                              // image: DecorationImage(
                              //   image: AssetImage(AppAssets.button_red),
                              //   fit: BoxFit.cover,
                              // ),
                            ),
                            padding: EdgeInsets.all(3),
                            child: Row(
                              children: [
                                Container(
                                  width: 110,
                                  height: 80,
                                  // margin: EdgeInsets.only(top: 7, bottom: 7,),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(AppAssets.button),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Center(
                                    child: Obx(() {
                                      return Text("Bed: ${controller.amount.value}",
                                        style: TextStyle(
                                          color: AppColors.textColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
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
                                      height: 60,
                                      // margin: EdgeInsets.only(top: 7, bottom: 7,),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(AppAssets.button),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text("Reset",
                                          style: TextStyle(
                                            color: AppColors.textColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                        ),

                        SizedBox(width: 20,),
                        Container(
                            width: 150,
                            height: 70,
                            //margin: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              color: AppColors.buttonBg,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color:Color(0xffC91016), width: 7),
                              // image: DecorationImage(
                              //   image: AssetImage(AppAssets.button_red),
                              //   fit: BoxFit.cover,
                              // ),
                            ),
                            padding: EdgeInsets.only(left: 10,),
                            child: Column(
                              children: [
                                Text("Balance",
                                  style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                //SizedBox(height: 3,),
                                Row(
                                  children: [
                                    Image.asset(AppAssets.dollarMore, height: 25, width: 20,),
                                    SizedBox(width: 5,),
                                    Container(
                                      width: 90,
                                      height: 25,
                                      margin: EdgeInsets.only(bottom: 7),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(AppAssets.button),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text("10000",
                                          style: TextStyle(
                                            color: AppColors.textColor,
                                            fontSize: 14,
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

                        SizedBox(width: 20,),
                        Container(
                            width: 150,
                            height: 70,
                            //margin: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              color: AppColors.buttonBg,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color:Color(0xffC91016), width: 7),
                              // image: DecorationImage(
                              //   image: AssetImage(AppAssets.button_red),
                              //   fit: BoxFit.cover,
                              // ),
                            ),
                            padding: EdgeInsets.only(left: 10,),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Last Win",
                                  style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                //SizedBox(height: 3,),
                                Row(
                                  children: [
                                    Image.asset(AppAssets.dollarMore, height: 25, width: 20,),
                                    SizedBox(width: 5,),
                                    Container(
                                      width: 90,
                                      height: 25,
                                      margin: EdgeInsets.only(bottom: 7,),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(AppAssets.button),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text("10000",
                                          style: TextStyle(
                                            color: AppColors.textColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child:  Container(
                                    margin: EdgeInsets.only(top: 7, bottom: 7,),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(AppAssets.button),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text("Reset",
                                        style: TextStyle(
                                          color: AppColors.textColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                        ),
                      ],
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.center,
                  child: Container(
                    transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                    height: 250,
                    width: 600,
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
                        transform: Matrix4.translationValues(0.0, 20.0, 0.0),
                        height: 270,
                        width: 600,
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
      height: 250,
      width: 180,
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
      height: 250,
      width: 180,
      child: CarouselSlider(
        items: controller.finalImageList.value.map((e) {
          return Container(
            height: 250,
            width: 180,
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Image.asset("$e",
                height: 250,
                width: 180,
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
