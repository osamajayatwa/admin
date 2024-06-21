import 'package:admin_fujika_ecommerce/controllers/items/view.dart';
import 'package:admin_fujika_ecommerce/core/class/handilingdataview.dart';
import 'package:admin_fujika_ecommerce/core/constant/routes.dart';
import 'package:admin_fujika_ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({Key? key});

  Future<bool?> _showConfirmationDialog(BuildContext context, String itemName) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Warning"),
          content: Text("Are you sure you want to delete $itemName?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Return false
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Return true
              },
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Items"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.itemsadd);
        },
        child: const Icon(Icons.add_card_rounded),
      ),
      body: GetBuilder<ItemsController>(
        builder: (controller) => HandilingDataView(
          statusrequest: controller.statusrequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(controller.data[index].itemsId!),
                  direction: DismissDirection.endToStart,
                  confirmDismiss: (direction) async {
                    return await _showConfirmationDialog(
                      context,
                      controller.data[index].itemsName!,
                    );
                  },
                  onDismissed: (direction) {
                    controller.delete(
                      controller.data[index].itemsId!,
                      controller.data[index].itemsImage!,
                    );
                  },
                  background: Container(
                    color: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    alignment: AlignmentDirectional.centerEnd,
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      controller.edit(controller.data[index]);
                    },
                    child: Card(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Image.network(
                                width: 100,
                                height: 70,
                                "${AppLink.imagestItems}/${controller.data[index].itemsImage}",
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: ListTile(
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () async {
                                      bool? confirmed =
                                          await _showConfirmationDialog(
                                        context,
                                        controller.data[index].itemsName!,
                                      );
                                      if (confirmed == true) {
                                        controller.delete(
                                          controller.data[index].itemsId!,
                                          controller.data[index].itemsImage!,
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                              subtitle:
                                  Text(controller.data[index].categoriesName!),
                              title: Text(controller.data[index].itemsName!),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
