import 'package:gamify/pages/DetailPage/detail_page_controller.dart';
import 'package:get/get.dart';

class DetailPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailPageController());
  }

}