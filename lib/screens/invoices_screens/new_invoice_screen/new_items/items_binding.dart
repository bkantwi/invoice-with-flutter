import 'package:invoice_with_flutter/controllers/items_controller.dart';
import 'package:get/get.dart';

class ItemsBidning extends Bindings {
  @override
  void dependencies() {
    Get.put(ItemsController(), permanent: true);
  }
}
