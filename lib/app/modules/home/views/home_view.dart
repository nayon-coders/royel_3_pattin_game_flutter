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
                Center(child: Image.asset(AppAssets.logo, height: 90, width: 300,)),
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
                        bottom: 30, right: 25,
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
      bottom: 20,
      child:  Align(
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.center,
          //margin: EdgeInsets.only(left: size.width*0.22, right: 10),
          transform: Matrix4.translationValues(15.0, 10.0, 0.0),
          height: 60,
          width: 560,
          padding: const EdgeInsets.only(left: 10.0, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //button 1
              Container(
                  width: 200,
                  margin: EdgeInsets.only(left: 5, right: 5),
                  decoration: BoxDecoration(
                    color: AppColors.buttonBg,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
                  child: Row(
                    children: [
                      Container(
                        width: 110,
                        margin: EdgeInsets.only(top: 7, bottom: 7,),
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
                                  fontSize: 17,
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
                        ),
                      )
                    ],
                  )
              ),

              Expanded(
                child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: AppColors.buttonBg,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.only(left: 10, top: 2),
                    child: Column(
                      children: [
                        Text("Balance",
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        //SizedBox(height: 3,),
                        Row(
                          children: [
                            Image.asset(AppAssets.dollarMore, height: 15, width: 20,),
                            SizedBox(width: 5,),
                            Container(
                              width: 70,
                              height: 20,
                              margin: EdgeInsets.only(top: 7, bottom: 7,),
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
              ),

              Expanded(
                child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: AppColors.buttonBg,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.only(left: 10, top: 2),
                    child: Column(
                      children: [
                        Text("Last Win",
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        //SizedBox(height: 3,),
                        Row(
                          children: [
                            Image.asset(AppAssets.dollarMore, height: 15, width: 20,),
                            SizedBox(width: 5,),
                            Container(
                              width: 70,
                              height: 20,
                              margin: EdgeInsets.only(top: 7, bottom: 7,),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

