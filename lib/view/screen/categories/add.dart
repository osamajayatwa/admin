import 'package:admin_fujika_ecommerce/controllers/categories/add.dart';
import 'package:admin_fujika_ecommerce/core/class/handilingdataview.dart';
import 'package:admin_fujika_ecommerce/core/constant/color.dart';
import 'package:admin_fujika_ecommerce/core/functions/validinput.dart';
import 'package:admin_fujika_ecommerce/core/shared/custombutton.dart';
import 'package:admin_fujika_ecommerce/core/shared/customtextform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesAdd extends StatelessWidget {
  const CategoriesAdd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesAddController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Category"),
        ),
        body: GetBuilder<CategoriesAddController>(
            builder: (controller) => HandilingDataView(
                  statusrequest: controller.statusrequest!,
                  widget: Container(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: CostumTextFormGlobal(
                                hinttext: "Enter Category Name In English",
                                labeltext: "Category Name",
                                icondata: Icons.category_outlined,
                                mycontroller: controller.name,
                                valid: (val) {
                                  return validInput(val!, 1, 30, "");
                                },
                                isNumber: false),
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: CostumTextFormGlobal(
                                hinttext: "Enter Category Name In Arabic",
                                labeltext: "Category Name",
                                icondata: Icons.category_outlined,
                                mycontroller: controller.namear,
                                valid: (val) {
                                  return validInput(val!, 1, 30, "");
                                },
                                isNumber: false),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: MaterialButton(
                                color: AppColor.thirdColor,
                                textColor: AppColor.primaryColor,
                                onPressed: () {
                                  controller.chooseImage();
                                },
                                child: const Text("Choose Category Image")),
                          ),
                          if (controller.file != null)
                            Image.file(controller.file!),
                          CustomButton(
                            text: "Add Image",
                            onPressed: () {
                              controller.addData();
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
