import 'package:e_commerce_app/core/constants/app_color.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FavouriteItemEmpty extends StatelessWidget {
  const FavouriteItemEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(left: 55.w, right: 55.w, top: 44.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            SvgPicture.asset('assets/svg/onboarding_2.svg'),
            SizedBox(
              height: 24.h,
            ),
            CustomText(
                text: "Your WishList is an empty!",
                fontSize: 20.sp,
                color: AppColor.fontColor,
                fontWeight: FontWeight.w600),
            SizedBox(
              height: 12.h,
            ),
            CustomText(
                text: "Looks like you haven't added anything\n                              to your cart yet",
                fontSize: 14.sp,
                color: AppColor.subFontColor,
                fontWeight: FontWeight.w400),
          ],
        ),
      ),
    );
  }
}