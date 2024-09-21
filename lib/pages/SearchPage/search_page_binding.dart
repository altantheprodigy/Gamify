import 'package:gamify/pages/SearchPage/search_page_controller.dart';
import 'package:get/get.dart';

class SeacrhPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SeacrhPageController());
  }

}