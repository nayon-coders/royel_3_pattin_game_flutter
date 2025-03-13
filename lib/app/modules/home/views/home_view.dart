import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teen_patti/app/modules/home/home_json.dart';
import 'package:teen_patti/utily/app_colors.dart';
import 'package:teen_patti/utily/assets.dart';

import '../controllers/audio_play_controller.dart';
import '../controllers/home_controller.dart';
import '../widegets/center_widgets.dart';
import '../widegets/left_side.dart';
import '../widegets/right_side_icons_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.bg),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Container(
            width: size.width,
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                    child: Center(child: Image.asset(AppAssets.logo, height: 100, width: 300,))),
                //Row for buttons
                Expanded(
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          //left side
                          LeftSide(),
                          //center with column
                          CenterWidgets(size: size,),

                          //right side
                          RightSideIcons()
                        ],
                      ),

                   //   BottomButtonsViews(size: size),


                      Positioned(
                        bottom: 30, right: 55,
                        child:  InkWell(
                          onTap: (){
                            if(controller.isSpin.value == false){
                              controller.getRandomImages();
                              controller.generateFinalImageList();
                              controller.startSpin();
                            }

                          },
                          child: Container(
                              transform: Matrix4.translationValues(0.0, 30.0, 0.0),
                              child: Image.asset(AppAssets.spin, height: 100, width: 100, fit: BoxFit.contain,)),
                        ),
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ),

    );
  }
}

class BottomButtonsViews extends GetView<HomeController> {
  const BottomButtonsViews({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      child:  Align(
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.center,
          //margin: EdgeInsets.only(left: size.width*0.22, right: 10),
          transform: Matrix4.translationValues(15.0, 8.0, 0.0),
          height: 70,
         // width: size.width,
          padding: const EdgeInsets.only(left: 10.0, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //button 1
              Container(
                  width: 220,
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
                width: 170,
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
                            margin: EdgeInsets.only(bottom: 7, top: 2),
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
                  width: 170,
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
                            margin: EdgeInsets.only(bottom: 7, top: 2),
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
    );
  }
}

