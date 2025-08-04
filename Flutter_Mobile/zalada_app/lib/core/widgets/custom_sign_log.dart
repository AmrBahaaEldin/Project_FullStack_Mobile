import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zalada_app/core/constant/color_app.dart';


class CustomSignLog extends StatelessWidget {
  final String imageLogo  ;
  final String textLogo;
  const CustomSignLog({

    required this.imageLogo, required this.textLogo, super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(34.r),
        border: Border.all(
          width: 1.w,
          color: ColorApp.dark75,
        ),
      ),
      child: Row(
        children: [
          Image(
            image: AssetImage(imageLogo),
            width: 24.w,
            height: 24.h,
          ),
          SizedBox(
            width: 12.w,
          ),
          Container(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 24.w,
            ),
            child: Text(
              textLogo,
              style: GoogleFonts.plusJakartaSans(
                color: ColorApp.blue40,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}