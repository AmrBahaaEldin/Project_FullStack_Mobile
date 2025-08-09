import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zalada_app/core/constant/color_app.dart';
import 'package:zalada_app/core/constant/style_app.dart';

class CustomPhoneNumberField extends StatelessWidget {
  const CustomPhoneNumberField({
    super.key,
    this.borderRadius,
    this.border,
    this.cursorColor,
    this.hint,
  });
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;
  final Color? cursorColor;
  final Widget? hint;
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
            hintText: "code",
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
              controller: TextEditingController(),
              cursorColor: cursorColor ?? ColorApp.blue60,
              decoration: InputDecoration(
                border: const UnderlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide.none,
                ),
                hint:
                    hint ??
                    Text(
                      "123456789",
                      style: StylesTextApp.textStyle16.copyWith(
                        color: ColorApp.dark25,
                      ),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
