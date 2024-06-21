import 'package:admin_fujika_ecommerce/controllers/orders/screen_controller.dart';
import 'package:admin_fujika_ecommerce/view/widget/home/custombuttonappbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderScreenControllerImp>(
        builder: (controller) => BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: Row(
              children: [
                ...List.generate(controller.listPage.length, ((index) {
                  return Expanded(
                    child: CustomButtonAppBar(
                        textbutton: controller.bottomappbar[index]['title'],
                        icondata: controller.bottomappbar[index]['icon'],
                        onPressed: () {
                          controller.changePage(index);
                        },
                        active: controller.currentpage == index ? true : false),
                  );
                }))
              ],
            )));
  }
}
