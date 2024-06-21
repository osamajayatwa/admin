import 'package:admin_fujika_ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class Custom extends StatelessWidget {
  final String textbottun;
  final void Function()? onPressed;
  const Custom({super.key, required this.textbottun, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
        color: AppColor.primaryColor,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(
          textbottun,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
