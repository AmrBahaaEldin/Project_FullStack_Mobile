import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zalada_app/core/constant/color_app.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [TextButton(onPressed: () {}, child: const Text("Skip"))],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 38.h),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 299.w,
                height: 299.h,
                // child: SvgPicture.asset(
                //   introductionBoarding[T.read<IntroCubit>().index].image,
                // ),
              ),
            ),
            SizedBox(height: 40.h),
            const Text("ggggggggggggggggggggggggggggggggg"),

            SizedBox(height: 16.h),
            const Text("rrrrr"),

            Padding(
              padding: EdgeInsets.only(top: 32.h),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 94.w,
                    height: 94.h,
                    child: Text("gkgkkkgkgkgkkgkkgkgkgg"),
                  ),
                  Container(
                    height: 62.h,
                    width: 62.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(84.r),
                      color: ColorApp.blue100,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      iconSize: 24.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// void checkCache(BuildContext context) {
//   CacheHelper.getData(key: 'token') != null
//       ? Navigator.pushAndRemoveUntil(
//           context,
//           MaterialPageRoute(builder: (context) => LayoutScreen()),
//           (route) => false,
//         )
//       : Navigator.pushAndRemoveUntil(
//           context,
//           MaterialPageRoute(builder: (context) => LoginView()),
//           (route) => false,
//         );
// }
