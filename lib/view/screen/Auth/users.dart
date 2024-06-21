import 'package:admin_fujika_ecommerce/view/widget/home/customtitlehome.dart';
import 'package:flutter/material.dart';

class Users extends StatelessWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context) {
    // UsersControllerImp controller = UsersControllerImp();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Users'),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: ListView(children: const [
            CustomTitleHome(
              title: 'id',
            ),
            CustomTitleHome(
              title: 'osama',
            ),
            CustomTitleHome(
              title: 'osamahesham101@gmail.com',
            ),
            CustomTitleHome(
              title: '0795671384',
            ),
            CustomTitleHome(
              title: 'datetime',
            ),
            // CustomTitleHome(
            //   title: '${controller.email}',
            // ),
          ]),
        ));
  }
}
