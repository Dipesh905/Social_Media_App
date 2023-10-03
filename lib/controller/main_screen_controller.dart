import 'package:get/get.dart';

class Controller extends GetxController {
  var index = 0.obs;

  updateIndex(var currentIndex) {
    index.value = currentIndex;
  }
}
