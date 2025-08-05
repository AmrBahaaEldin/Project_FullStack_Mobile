import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zalada_app/core/constant/color_app.dart';

class CustomLineContinous extends StatelessWidget {
  const CustomLineContinous({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: SvgPicture.asset("assets/svg/line.svg")),
        SizedBox(width: 9.w, height: 0.h),
        Text(
          "or continue with",
          style: GoogleFonts.plusJakartaSans(
            color: ColorApp.green100,
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(width: 9.w, height: 0.h),
        Expanded(child: SvgPicture.asset("assets/svg/line.svg")),
      ],
    );
  }
}
