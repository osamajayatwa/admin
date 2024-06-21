import 'package:admin_fujika_ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomBottunAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomBottunAuth({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(vertical: 15),
        onPressed: onPressed,
        color: AppColor.primaryColor,
        textColor: Colors.white,
        child: Text(text),
      ),
    );
  }
}
