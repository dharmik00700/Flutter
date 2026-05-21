import 'package:get/get.dart';

class countercontroller extends GetxController {
  final count = 1.obs;

  increament() {
    count.value++;
  }
  Deincreament() {
    count.value--;
  }
}
