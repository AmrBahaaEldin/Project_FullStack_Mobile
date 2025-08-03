// import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// import 'onboarding.dart';
//
// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return FlutterSplashScreen.fadeIn(
//       animationCurve: Curves.easeInCirc,
//       duration: Duration(milliseconds: 8000),
//
//       backgroundColor: Colors.white,
//       onInit: () {
//         debugPrint("On Init");
//       },
//       onEnd: () {
//         debugPrint("On End");
//       },
//       childWidget: SizedBox(
//      child:  Stack(
//           children: [
//             Positioned(
//               top: 304.h,
//               left: 152.w,
//                 right: 151.w,
//                 bottom: 436.h,
//                 child: Image.assets("assets/png/log.png")),
//
//             Positioned(
//                 top: 410.h,
//                 left: 126.w,
//                 right: 125.w,
//                 bottom: 373.h,
//                 child: SvgPicture.assets("assets/svg/text.svg")),
//
//           ],
//         ),
//       ),
//
//       onAnimationEnd: () => debugPrint("On Fade In End"),
//       nextScreen: Onboarding(),
//
//        );
//   }
// }
