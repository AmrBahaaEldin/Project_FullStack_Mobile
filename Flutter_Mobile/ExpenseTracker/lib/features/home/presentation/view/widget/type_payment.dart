import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constant/color_app.dart';
import '../../../../../core/constant/image_app.dart';
import '../../../../../core/constant/style_app.dart';

class TypePayment extends StatelessWidget {
  const TypePayment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        height: 80.h,
        decoration: BoxDecoration(
            color: ColorApp.green100,
            borderRadius: BorderRadius.circular(
              28.r,
            )),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(ImageApp.incomeSv),
            SizedBox(width: 10.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "income",
                  style: AppTextStyles.textStyle18.copyWith(
                    color: ColorApp.light80,
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  "\$5000",
                  style: AppTextStyles.textStyle18.copyWith(
                    color: ColorApp.light80,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}