import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:teen_patti/app/modules/home/controllers/audio_play_controller.dart';

import '../../../../utily/assets.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getRandomImages();

    //check sound is one or off
    Get.find<AudioController>().playAudio(AppAudio.bg,  loop: true);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;


  RxList randomImages = [].obs;
  List<String> getRandomImages() {
    List<String> allImages = [
      // Add all images from different classes
      AppCardsC.c1, AppCardsC.c2, AppCardsC.c3, AppCardsC.c4, AppCardsC.c5, AppCardsC.c6, AppCardsC.c7,
      AppCardsC.c8, AppCardsC.c9, AppCardsC.c10, AppCardsC.c11, AppCardsC.c12, AppCardsC.c13,

      AppCardF.f1, AppCardF.f2, AppCardF.f3, AppCardF.f4, AppCardF.f5, AppCardF.f6, AppCardF.f7,
      AppCardF.f8, AppCardF.f9, AppCardF.f10, AppCardF.f11, AppCardF.f12, AppCardF.f13,

      AppCardK.k1, AppCardK.k2, AppCardK.k3, AppCardK.k4, AppCardK.k5, AppCardK.k6, AppCardK.k7,
      AppCardK.k8, AppCardK.k9, AppCardK.k10, AppCardK.k11, AppCardK.k12, AppCardK.k13,

      AppCardI.i1, AppCardI.i2, AppCardI.i3, AppCardI.i4, AppCardI.i5, AppCardI.i6, AppCardI.i7,
      AppCardI.i8, AppCardI.i9, AppCardI.i10, AppCardI.i11, AppCardI.i12, AppCardI.i13,
    ];

    // Shuffle the list
    allImages.shuffle(Random());


    // Return the first three images
    randomImages.value = allImages.take(3).toList();
    return allImages.take(3).toList();
  }

  List<String> getRandomImagesFromEach(List<String> images, int count) {
    images.shuffle(Random());
    return images.take(count).toList();
  }


  RxList<String> finalImageList = <String>[].obs;
  List<String> generateFinalImageList() {
    List<String> allC = [
      AppCardsC.c1, AppCardsC.c2, AppCardsC.c3, AppCardsC.c4, AppCardsC.c5, AppCardsC.c6, AppCardsC.c7,
      AppCardsC.c8, AppCardsC.c9, AppCardsC.c10, AppCardsC.c11, AppCardsC.c12, AppCardsC.c13,
    ];

    List<String> allF = [
      AppCardF.f1, AppCardF.f2, AppCardF.f3, AppCardF.f4, AppCardF.f5, AppCardF.f6, AppCardF.f7,
      AppCardF.f8, AppCardF.f9, AppCardF.f10, AppCardF.f11, AppCardF.f12, AppCardF.f13,
    ];

    List<String> allK = [
      AppCardK.k1, AppCardK.k2, AppCardK.k3, AppCardK.k4, AppCardK.k5, AppCardK.k6, AppCardK.k7,
      AppCardK.k8, AppCardK.k9, AppCardK.k10, AppCardK.k11, AppCardK.k12, AppCardK.k13,
    ];

    List<String> allI = [
      AppCardI.i1, AppCardI.i2, AppCardI.i3, AppCardI.i4, AppCardI.i5, AppCardI.i6, AppCardI.i7,
      AppCardI.i8, AppCardI.i9, AppCardI.i10, AppCardI.i11, AppCardI.i12, AppCardI.i13,
    ];

    // Get random images from each list 0-99
    List<String> selectedC = getRandomImagesFromEach(allC, 7 + Random().nextInt(2)); // 7 or 8
    List<String> selectedF = getRandomImagesFromEach(allF, 7 + Random().nextInt(2));
    List<String> selectedK = getRandomImagesFromEach(allK, 7 + Random().nextInt(2));
    List<String> selectedI = getRandomImagesFromEach(allI, 7 + Random().nextInt(2));

    // Combine all selected images
    List<String> finalList = [...selectedC, ...selectedF, ...selectedK, ...selectedI];

    finalImageList.value = finalList;
    print(finalList);
    return finalList;
  }


  //start sping and stop spin
  RxBool isSpin = false.obs;
  RxBool isSpin1st = false.obs;
  RxBool isSpin2nd = false.obs;
  RxBool isSpin3tr = false.obs;
  void startSpin(){
    //getting data from firebase
    getCards();
    isSpin.value = true;
    isSpin1st.value = true;
    isSpin2nd.value = true;
    isSpin3tr.value = true;


    //sound configuration
    if(isSound.value == false){
      Get.find<AudioController>().stopAudio(AppAudio.spin);
    }else{
      Get.find<AudioController>().playAudio(AppAudio.spin);
    }

    //now stop spining
    Future.delayed(Duration(seconds: 4), (){
      isSpin1st.value = false;
    });

    Future.delayed(Duration(seconds: 5), (){
      isSpin2nd.value = false;
    });

    Future.delayed(Duration(seconds: 6), (){
      isSpin3tr.value = false;
      Get.find<AudioController>().stopAudio(AppAudio.spin);

      //check is sound is off or not
      if(isSound.value){
        Get.find<AudioController>().playAudio(AppAudio.bg,  loop: true);
      }
      Future.delayed(Duration(milliseconds: 200), (){
        isSpin.value = false;
      });

    });

    update();
  }

  //button click sound controller
  void buttonClickSound(){
    if(isSound.value == true){
      Get.find<AudioController>().stopAudio(AppAudio.btn_click);
    }
  }

  //send amount in a variable
  RxString amount = '100'.obs;
  setAmount(String amt){
    buttonClickSound();
    amount.value = amt;
    update();
  }


  //sound controller
  RxBool isSound = true.obs;
  void soundController(){
   // Get.find<AudioController>().stopAudio();
    isSound.value = !isSound.value;
    if(isSound.value){ //if sound is on
      Get.find<AudioController>().playAudio(AppAudio.bg,  loop: true);
    }else{ //if sound is off
      Get.find<AudioController>().stopAllAudio();
    }

    print("isSound -- ${isSound}");

    update();
  }


  //get card from firebase
  RxList<String> nextCards = <String>[].obs;
  void getCards(){
    FirebaseFirestore.instance.collection("next_cards").doc("next_card").get().then((value) {
      var cardData = value.data()!; // Assuming this returns Map<String, dynamic>

// Convert to a list of values only
      List<String> cardList = [];

      cardData.forEach((key, value) {
        if (value is String) { // Ensure value is a String
          cardList.add(value);
        }
      });

      nextCards.value = cardList; // Updating RxList
      print(cardList);
    });
  }
}
