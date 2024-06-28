import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isDark = true.obs;

  RxInt count = 0.obs;

  void updateCount() {
    count++;
  }

  void getFinalVal() {
    update();
  }
}
