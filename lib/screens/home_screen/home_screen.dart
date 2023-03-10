import 'package:invoice_with_flutter/constants/colors.dart';
import 'package:invoice_with_flutter/constants/strings.dart';
import 'package:invoice_with_flutter/controllers/invoices_controller.dart';
import 'package:invoice_with_flutter/env/dimensions.dart';
import 'package:invoice_with_flutter/screens/home_screen/widgets/invoice_english_view.dart';
import 'package:invoice_with_flutter/screens/shared_widgets/appbar_eng_view.dart';
import 'package:invoice_with_flutter/screens/shared_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<AllInvoiceController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kSecondaryColor,
        appBar: AppBar_eng(
          title: AppStrings.HOME_TITLE,
          actions: [
            InkWell(
              onTap: () {
                Get.toNamed("/new");
              },
              splashColor: AppColors.kSecondaryColor,
              customBorder: const CircleBorder(),
              child: SvgPicture.asset(
                "assets/icons/new_invoice.svg",
                height: Dimensions.calcH(25),
                color: AppColors.kPrimaryDark,
              ),
            ),
            SizedBox(
              width: Dimensions.calcW(15),
            ),
            // InkWell(
            //   onTap: () {},
            //   splashColor: AppColors.kSecondaryColor,
            //   customBorder: const CircleBorder(),
            //   child: SvgPicture.asset(
            //     "assets/icons/settings.svg",
            //     height: Dimensions.calcH(30),
            //     color: AppColors.kPrimaryDark,
            //   ),
            // ),
            // SizedBox(
            //   width: Dimensions.calcW(8),
            // ),
          ],
        ),
        body: Obx(() {
          if (controller.invoicesList.isEmpty) {
            return Center(
              child: CustomText(
                text: AppStrings.HOME_NO_INVOICES,
                color: Colors.black,
                fontSize: Dimensions.calcH(20),
                weight: FontWeight.w600,
              ),
            );
          } else {
            return Column(
              children: [
                ...controller.invoicesList
                    .map((invoice) => InvoiceView_eng(
                          invoice: invoice,
                        ))
                    .toList()
              ],
            );
          }
        }));
  }
}
