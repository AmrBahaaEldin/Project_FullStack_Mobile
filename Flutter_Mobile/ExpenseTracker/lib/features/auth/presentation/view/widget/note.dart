import 'package:flutter/material.dart';

List<DropdownMenuItem> items = [
  const DropdownMenuItem(value: "USD", child: Text("*")),
  const DropdownMenuItem(value: "EUR", child: Text("!")),
  const DropdownMenuItem(value: "GBP", child: Text("GBP")),
  const DropdownMenuItem(value: "JPY", child: Text("JPY")),
];

  // DropdownButton(
  //             underline: Text(
  //               addons,
  //               style: AppTextStyles.textStyle12
  //                   .copyWith(color: ColorApp.light100),
  //             ),
  //             enableFeedback: true,
  //             iconDisabledColor: ColorApp.yellow60,
  //             iconEnabledColor: ColorApp.red100,
  //             focusColor: ColorApp.green100,
  //             items: items,
  //             onChanged: (value) {
  //               setState(() {});
  //               addons = value;
  //               debugPrint("Selected value: $addons");
  //             },
  //           )

  ////////////////////////////////////DropdownButton///////////////////////////////
  