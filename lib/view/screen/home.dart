import 'package:admin_fujika_ecommerce/controllers/home_controller.dart';
import 'package:admin_fujika_ecommerce/core/constant/imageassests.dart';
import 'package:admin_fujika_ecommerce/core/constant/routes.dart';
import 'package:admin_fujika_ecommerce/view/widget/home/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: ListView(
        children: [
          GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: getValueForScreenType(
                      context: context, mobile: 2, tablet: 3, desktop: 4),
                  mainAxisExtent: 150),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                CardHome(
                  onTap: () {
                    Get.toNamed(AppRoute.users);
                  },
                  url: ImageAssest.users,
                  title: "Users",
                ),
                CardHome(
                  onTap: () {
                    Get.toNamed(AppRoute.itemsview);
                  },
                  url: ImageAssest.product,
                  title: "Product",
                ),
                CardHome(
                  url: ImageAssest.category,
                  title: "Categories",
                  onTap: () {
                    Get.toNamed(AppRoute.categoryview);
                  },
                ),
                CardHome(
                  onTap: () {
                    Get.toNamed(AppRoute.orderhome);
                  },
                  url: ImageAssest.orders,
                  title: "Orders",
                ),
                CardHome(
                  onTap: () {},
                  url: ImageAssest.report,
                  title: "Report",
                ),
                CardHome(
                  onTap: () {
                    controller.logout();
                  },
                  url: ImageAssest.logout,
                  title: "Logout",
                ),
              ])
        ],
      ),
    );
  }
}
