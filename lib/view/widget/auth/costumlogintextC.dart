import 'package:admin_fujika_ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CostumTextForm extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData icondata;
  final TextEditingController? mycontroller;
  final String? Function(String?) valid;
  final bool isNumber;
  final bool? obscure;
  final void Function()? onTapIcon;
  const CostumTextForm({
    super.key,
    required this.hinttext,
    required this.labeltext,
    required this.icondata,
    required this.mycontroller,
    required this.valid,
    required this.isNumber,
    this.obscure,
    this.onTapIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valid,
        controller: mycontroller,
        obscureText: obscure == null || obscure == false ? false : true,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 35),
          label: Text(labeltext),
          hintText: hinttext,
          hintStyle: const TextStyle(fontSize: 14),
          suffixIcon: InkWell(
            onTap: onTapIcon,
            child: Icon(icondata),
          ),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.black, width: 3.5),
              borderRadius: BorderRadius.circular(30)),
        ));
  }
}
