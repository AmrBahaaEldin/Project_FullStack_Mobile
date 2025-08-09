import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zalada_app/core/constant/color_app.dart';
import 'package:zalada_app/core/constant/style_app.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Gender",
          style: StylesTextApp.textStyle12.copyWith(color: ColorApp.dark25),
        ),
        SizedBox(height: 8.h),
        DropdownMenu(
          width: double.infinity,
          inputDecorationTheme: InputDecorationTheme(
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(color: ColorApp.blue60),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorApp.blue60),
              borderRadius: BorderRadius.circular(12.r),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorApp.blue60),
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),

          controller: TextEditingController(),
          hintText: "Type",
          closeBehavior: DropdownMenuCloseBehavior.all,
          dropdownMenuEntries: [
            const DropdownMenuEntry(value: "Male", label: "Male"),
            const DropdownMenuEntry(value: "Female", label: "Female"),
          ],
        ),
      ],
    );
  }
}
