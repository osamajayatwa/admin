import 'package:admin_fujika_ecommerce/controllers/items/edit.dart';
import 'package:admin_fujika_ecommerce/core/class/handilingdataview.dart';
import 'package:admin_fujika_ecommerce/core/constant/color.dart';
import 'package:admin_fujika_ecommerce/core/functions/validinput.dart';
import 'package:admin_fujika_ecommerce/core/shared/custombutton.dart';
import 'package:admin_fujika_ecommerce/core/shared/customdropdown.dart';
import 'package:admin_fujika_ecommerce/core/shared/customtextform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsEdit extends StatelessWidget {
  const ItemsEdit({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GlobalKey<FormState>());

    Get.put(ItemsEditController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit Item"),
        ),
        body: GetBuilder<ItemsEditController>(
            builder: (controller) => HandilingDataView(
                  statusrequest: controller.statusrequest!,
                  widget: Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(10),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: CostumTextFormGlobal(
                                hinttext: "Item Name In English",
                                labeltext: "Item Name",
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
                                hinttext: "Item Name In Arabic",
                                labeltext: "Item Name",
                                icondata: Icons.category_outlined,
                                mycontroller: controller.namear,
                                valid: (val) {
                                  return validInput(val!, 1, 30, "");
                                },
                                isNumber: false),
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: CostumTextFormGlobal(
                                hinttext: "Item description In English",
                                labeltext: "Item description",
                                icondata: Icons.category_outlined,
                                mycontroller: controller.desc,
                                valid: (val) {
                                  return validInput(val!, 1, 200, "");
                                },
                                isNumber: false),
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: CostumTextFormGlobal(
                                hinttext: "Item description In Arabic",
                                labeltext: "Item description",
                                icondata: Icons.category_outlined,
                                mycontroller: controller.descar,
                                valid: (val) {
                                  return validInput(val!, 1, 200, "");
                                },
                                isNumber: false),
                          ),
                          CustomDropDownSearch(
                              title: "Choose Category",
                              listdata: controller.dropdownlist,
                              dropdownselectedname: controller.catname!,
                              dropdownselectedid: controller.catid!),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: CostumTextFormGlobal(
                                hinttext: "price",
                                labeltext: "price",
                                icondata: Icons.attach_money_outlined,
                                mycontroller: controller.price,
                                valid: (val) {
                                  return validInput(val!, 1, 30, "");
                                },
                                isNumber: false),
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: CostumTextFormGlobal(
                                hinttext: "count",
                                labeltext: "count",
                                icondata: Icons.numbers,
                                mycontroller: controller.count,
                                valid: (val) {
                                  return validInput(val!, 1, 30, "");
                                },
                                isNumber: false),
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: CostumTextFormGlobal(
                                hinttext: "discount",
                                labeltext: "discount",
                                icondata: Icons.discount,
                                mycontroller: controller.discount,
                                valid: (val) {
                                  return validInput(val!, 1, 30, "");
                                },
                                isNumber: false),
                          ),
                          const SizedBox(height: 20),
                          RadioListTile(
                              title: const Text("hide"),
                              value: "0",
                              groupValue: controller.active,
                              onChanged: (val) {
                                controller.changestatusactive(val);
                              }),
                          RadioListTile(
                              title: const Text("active"),
                              value: "1",
                              groupValue: controller.active,
                              onChanged: (val) {
                                controller.changestatusactive(val);
                              }),
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: MaterialButton(
                                color: AppColor.thirdColor,
                                textColor: AppColor.primaryColor,
                                onPressed: () {
                                  controller.showOptionImage();
                                },
                                child: const Text("Choose Item Image")),
                          ),
                          if (controller.file != null)
                            Image.file(
                              controller.file!,
                              width: 200,
                              height: 200,
                            ),
                          CustomButton(
                            text: "Edit",
                            onPressed: () {
                              controller.editData();
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
