import 'package:get/get.dart';

class CartController extends GetxController {
  var totalCount = 0.obs;
  void increment() {
    totalCount.value++;
  }

  void decrement() {
    totalCount.value--;
  }
}
