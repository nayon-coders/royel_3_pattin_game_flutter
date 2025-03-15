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


  // Define RxLists for each slider's random images
  RxList<String> finalImageListSlider1 = <String>[].obs;
  RxList<String> finalImageListSlider2 = <String>[].obs;
  RxList<String> finalImageListSlider3 = <String>[].obs;

  List<String> generateRandomImageLists() {
    // Define the lists of images
    List<String> allImages = [
      AppCardsC.c1, AppCardsC.c2, AppCardsC.c3, AppCardsC.c4, AppCardsC.c5, AppCardsC.c6, AppCardsC.c7,
      AppCardsC.c8, AppCardsC.c9, AppCardsC.c10, AppCardsC.c11, AppCardsC.c12, AppCardsC.c13,
      AppCardF.f1, AppCardF.f2, AppCardF.f3, AppCardF.f4, AppCardF.f5, AppCardF.f6, AppCardF.f7,
      AppCardF.f8, AppCardF.f9, AppCardF.f10, AppCardF.f11, AppCardF.f12, AppCardF.f13,
      AppCardK.k1, AppCardK.k2, AppCardK.k3, AppCardK.k4, AppCardK.k5, AppCardK.k6, AppCardK.k7,
      AppCardK.k8, AppCardK.k9, AppCardK.k10, AppCardK.k11, AppCardK.k12, AppCardK.k13,
      AppCardI.i1, AppCardI.i2, AppCardI.i3, AppCardI.i4, AppCardI.i5, AppCardI.i6, AppCardI.i7,
      AppCardI.i8, AppCardI.i9, AppCardI.i10, AppCardI.i11, AppCardI.i12, AppCardI.i13,
    ];

    Random random = Random();

    // Create final lists to hold the result for each slider
    List<String> finalListSlider1 = [];
    List<String> finalListSlider2 = [];
    List<String> finalListSlider3 = [];

    int totalSets = 8; // Number of sets (3 images per set)

    // Generate 3 random images per set for each slider
    for (int i = 0; i < totalSets; i++) {
      // Shuffle the list of all images
      allImages.shuffle();

      // Pick 3 random images from the shuffled list
      String image1 = allImages[0];  // Pick 1st image
      String image2 = allImages[1];  // Pick 2nd image
      String image3 = allImages[2];  // Pick 3rd image

      // Add these images to the respective slider's list
      finalListSlider1.add(image1);
      finalListSlider2.add(image2);
      finalListSlider3.add(image3);
    }

    // Assign the generated lists to the respective RxLists
    finalImageListSlider1.value = finalListSlider1;
    finalImageListSlider2.value = finalListSlider2;
    finalImageListSlider3.value = finalListSlider3;

    // Debug print to verify the images being added
    print("finalListSlider1----${finalListSlider1}");
    print("finalListSlider2----${finalListSlider2}");
    print("finalListSlider3----${finalListSlider3}");

    return finalListSlider1;  // You can return any of the lists as needed
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
      Future.delayed(Duration(milliseconds: 100), (){
        isSpin.value = false;
        emptyCards(); // empty card1, card2, card3 from firebase
      });

    });

    update();
  }

  //button click sound controller
  void buttonClickSound(){
    Get.find<AudioController>().playAudio(AppAudio.btn_click);
  }

  //send amount in a variable
  RxString amount = '100'.obs;
  setAmount(String amt){
    buttonClickSound();
    amount.value = (int.parse("${amount.value}") + int.parse("${amt}")).toString();
    print("amount -- ${amount.value}");
    update();
  }

  resetAmount(){
    amount.value = '0';
    print("amount -- ${amount.value}");
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
    nextCards.clear();
    FirebaseFirestore.instance.collection("next_cards").doc("next_card").get().then((value) {
      var cardData = value.data()!; // Assuming this returns Map<String, dynamic>

      print("cardData -- ${cardData}");

// Convert to a list of values only
      List<String> cardList = [];

      cardData.forEach((key, value) {
        if (value is String && value.isNotEmpty) { // Ensure value is a String
          cardList.add(value);
        }
      });

      nextCards.value = cardList; // Updating RxList
      print(cardList);
    });
  }

  //empty card1, card2, card3 from firebase
  void emptyCards(){

    FirebaseFirestore.instance.collection("next_cards").doc("next_card").update({
      "card1": "",
      "card2": "",
      "card3": "",
    });
  }
}
