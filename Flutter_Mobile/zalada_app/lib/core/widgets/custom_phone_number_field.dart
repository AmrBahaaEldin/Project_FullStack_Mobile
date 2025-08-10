import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zalada_app/core/constant/color_app.dart';

class CustomPhoneNumberField extends StatelessWidget {
  const CustomPhoneNumberField({
    super.key,
    this.borderRadius,
    this.border,
    this.cursorColor,
    this.controllerNumber,
    this.hintNumber,
    this.controllerCode,
    this.hintCode,
  });
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;
  final Color? cursorColor;
  final String? hintNumber;
  final String? hintCode;
  final TextEditingController? controllerNumber;
  final TextEditingController? controllerCode;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(16.r)),
        border: border ?? Border.all(width: 1.w, color: ColorApp.blue60),
      ),

      child: Row(
        children: [
          DropdownMenu(
            inputDecorationTheme: InputDecorationTheme(
              hintStyle: const TextStyle(color: ColorApp.dark25),
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

            controller: controllerCode,

            hintText: hintCode,
            textStyle: const TextStyle(color: ColorApp.dark100),
            closeBehavior: DropdownMenuCloseBehavior.all,
            dropdownMenuEntries: [
              const DropdownMenuEntry(value: "+20", label: "+20"),
              const DropdownMenuEntry(value: "+966", label: "+966"),
            ],
          ),
          SizedBox(width: 8.h),

          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: controllerNumber,
              cursorColor: cursorColor ?? ColorApp.blue60,
              decoration: InputDecoration(
                border: const UnderlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide.none,
                ),
                hintStyle: const TextStyle(color: ColorApp.dark25),
                hintText: hintNumber,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
