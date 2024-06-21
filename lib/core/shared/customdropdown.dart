import 'package:admin_fujika_ecommerce/core/constant/color.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class CustomDropDownSearch extends StatefulWidget {
  final String? title;
  final List<SelectedListItem> listdata;
  final TextEditingController dropdownselectedname;
  final TextEditingController dropdownselectedid;

  const CustomDropDownSearch(
      {super.key,
      required this.listdata,
      required this.dropdownselectedname,
      required this.dropdownselectedid,
      this.title});

  @override
  State<CustomDropDownSearch> createState() => _CustomDropDownSearchState();
}

class _CustomDropDownSearchState extends State<CustomDropDownSearch> {
  void showDropDown() {
    DropDownState(
      DropDown(
        bottomSheetTitle: Text(
          widget.title!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: widget.listdata,
        selectedItems: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem = selectedList[0];
          widget.dropdownselectedid.text = selectedListItem.value!;
          widget.dropdownselectedname.text = selectedListItem.name;
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.dropdownselectedname,
        cursorColor: Colors.black,
        onTap: () {
          FocusScope.of(context).unfocus();
          showDropDown();
        },
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: const Text("Choose Category"),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 35),
          hintText: widget.dropdownselectedname.text == ""
              ? widget.title
              : widget.dropdownselectedname.text,
          hintStyle: const TextStyle(fontSize: 12),
          suffixIcon: InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
              showDropDown();
            },
            child: const Icon(Icons.arrow_drop_down_rounded),
          ),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.black, width: 3.5),
              borderRadius: BorderRadius.circular(30)),
        ));
  }
}
      
      /* InputDecoration(
        filled: true,
        fillColor: AppColor.primaryColor,
        contentPadding:
            const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
        hintText: widget.dropdownselectedname.text == ""
            ? widget.title
            : widget.dropdownselectedname.text,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
      ),
    );
  }
}*/
