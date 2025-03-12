import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FlashController extends GetxController {
  //TODO: Implement FlashController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getSetting();
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

  //get setting data from firebase
  RxBool isPaid = true.obs;
  getSetting()async{
    //get setting data from firebase
     try{
       FirebaseFirestore.instance.collection("project_setting").doc("setting").get().then((value) {
         isPaid.value = value.data()!["paid"];
       });
     }catch(e){
        print(e);
     }
  }

}
