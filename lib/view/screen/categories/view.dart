import 'package:admin_fujika_ecommerce/controllers/categories/view.dart';
import 'package:admin_fujika_ecommerce/core/class/handilingdataview.dart';
import 'package:admin_fujika_ecommerce/core/constant/routes.dart';
import 'package:admin_fujika_ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  Future<bool?> _showConfirmationDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Warning"),
          content: const Text("Are you sure you want to delete this category?"),
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
    Get.put(CategoriesController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.categoryadd);
        },
        child: const Icon(Icons.add_card_rounded),
      ),
      body: GetBuilder<CategoriesController>(
        builder: (controller) => HandilingDataView(
          statusrequest: controller.statusrequest,
          widget: WillPopScope(
            onWillPop: () {
              return controller.onback();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(controller.data[index].categoriesId!),
                    direction: DismissDirection.endToStart,
                    confirmDismiss: (direction) async {
                      return await _showConfirmationDialog(context);
                    },
                    onDismissed: (direction) {
                      controller.delete(
                        controller.data[index].categoriesId!,
                        controller.data[index].categoriesImage!,
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
                                  height: 70,
                                  "${AppLink.imagestCategories}/${controller.data[index].categoriesImage}",
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
                                                context);
                                        if (confirmed == true) {
                                          controller.delete(
                                            controller
                                                .data[index].categoriesId!,
                                            controller
                                                .data[index].categoriesImage!,
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                subtitle: Text(
                                    controller.data[index].categoriesDatetime!),
                                title: Text(
                                    controller.data[index].categoriesName!),
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
      ),
    );
  }
}
