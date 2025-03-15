import 'package:cloud_firestore/cloud_firestore.dart';
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
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection("payment").doc("payment").snapshots(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()), // Show a loading indicator while fetching data
          );
        }

        if (!snapshot.hasData || snapshot.data == null || !snapshot.data!.exists) {
          Future.delayed(const Duration(seconds: 2), () {
            Get.offAllNamed(Routes.MAIN);
          });
        }

        var paymentData = snapshot.data!.data() as Map<String, dynamic>?; // Get Firestore document data safely

        if (paymentData?["paid"] == false) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Get.offAllNamed(Routes.FROD);
          });
        } else {
          Future.delayed(const Duration(seconds: 2), () {
            Get.offAllNamed(Routes.MAIN);
          });
        }

        return Scaffold(
          body: Image.asset(AppAssets.splash, fit: BoxFit.cover, height: size.height, width: size.width),
        );
      },
    );

  }
}
