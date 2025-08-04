// import 'dart:ui';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:zalada_app/core/constant/color_app.dart';
// import 'package:zalada_app/core/constant/image_app.dart';
// import 'package:zalada_app/core/widgets/custom_button_app.dart';

// import 'login_screen.dart';

// class OtpScreen extends StatelessWidget {


//   const OtpScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Container(
//               height: 44.h,
//               width: 44.h,
//               padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(34.r),
//                     bottomRight: Radius.circular(34.r),
//                     topLeft: Radius.circular(34.r),
//                     topRight: Radius.circular(34.r),
//                   ),
//                   border: Border.all(color: Color(0xffEAEAEA), width: 1.w)),
//               child: Icon(Icons.arrow_back)),
//         ),
//         title: CustomButtonApp(
//         text: "OTP",
           

//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.only(left: 20.w, right: 20.w,),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 44.h,
//               ),
//               SvgPicture.asset(
//                 ImageApp.bcaSV,
//                 height: 243.h,
//                 width: 243.w,
//               ),
//               Text(
//                 "Verification code",
//                 style: GoogleFonts.plusJakartaSans(
//                   fontWeight: FontWeight.w600,
//                   fontSize: 24.sp,
//                   color: AppColor.fontColor,
//                 ),
//               ),
//               SizedBox(
//                 height: 12.h,
//               ),
//               CustomButtonApp(
//                 text: "We have sent the code verification to you ",
               
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CustomButtonApp(
//                     text: "WhatsApp Number",
                   
//                   ),
//                   CustomButtonApp(
//                     text: "+62812 788 6XXXX",
                    
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 32,
//               ),
//               CustomPinPut(),
//               SizedBox(
//                 height: 24.h,
//               ),
//               CustomButtonApp(
//                   text: "Recent code in 32s",
                 
//               SizedBox(
//                 height: 71.h,
//               ),
//               CustomButtonApp(
//                 text: "Continue",

//                 onPressed: () {
//                   showModalBottomSheet(
//                     context: context,
//                     builder: (context) {
//                       return  BackdropFilter(filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//                           child: CustomSuccessOtp());
//                     },
//                   );
//                 },
//               ),

              
//             ],

        
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CustomSuccessOtp extends StatelessWidget {
//   const CustomSuccessOtp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 20.w),
//       height: 517.h,
//       width: 375.w,
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(24.r),
//             topRight: Radius.circular(24.r),
//           )
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SizedBox(
//             height: 10.h,
//           ),
//           Container(
//             width: 66.66666.w,
//             height: 4.h,
//             decoration: BoxDecoration(
//               color: ColorApp.green40,
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(11.r),
//                 topLeft: Radius.circular(11.r),
//                 bottomRight: Radius.circular(11.r),
//                 topRight: Radius.circular(11.r),
//               ),
//             ),
//           ),
//           SizedBox(height:14 .h,),
//           SvgPicture.asset(ImageApp.bankOfAmericaSV,width: 243.h,height: 243.h,),
//           SizedBox(height: 24.h,),
//           const CustomButtonApp(text: "Congratulations!",
//             ),
//           SizedBox(height: 12.h,),
//           CustomButtonApp(text: "Your account is ready to use. You will be redirected \n                    to the Homepage in a few seconds.",
//               ),
//           SizedBox(height: 24.h,),
//           const CustomButtonApp(text: "Continue",),

//         ],
//       ),
//     );
//   }
// }


