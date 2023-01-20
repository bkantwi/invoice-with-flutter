import 'package:invoice_with_flutter/controllers/invoices_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AllInvoiceController(), permanent: true);
  }
}
