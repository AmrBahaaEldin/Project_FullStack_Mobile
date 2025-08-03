import 'package:e_commerce_app/core/constants/app_color.dart';
import 'package:e_commerce_app/core/constants/app_image.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:e_commerce_app/features/profile/data/profileModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                  height: 44.h,
                  width: 44.h,
                  padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(34.r),
                        bottomRight: Radius.circular(34.r),
                        topLeft: Radius.circular(34.r),
                        topRight: Radius.circular(34.r),
                      ),
                      border:
                      Border.all(color: AppColor.fontLabelColor, width: 1.w)),
                  child: Icon(
                    Icons.arrow_back_outlined,
                    size: 20.sp,
                  )),
            ),
          ),


        ),
      body: CustomScrollView(
        slivers:[
          SliverToBoxAdapter(child: Padding(
            padding:  EdgeInsets.only(left: 20.0.w),
            child: CustomText(text:"Your Notification" , fontSize: 24, color: AppColor.fontColor, fontWeight: FontWeight.w600,),
          )),
          SliverToBoxAdapter(child: SizedBox(height: 24.h,)),
          SliverToBoxAdapter(child: Padding(
            padding:  EdgeInsets.only(left: 20.w),
            child: CustomText(text: "Today", fontSize: 14.sp, color: AppColor.subFontColor, fontWeight: FontWeight.w600,),
          )),
          SliverToBoxAdapter(child: SizedBox(height: 16.h,)),
          SliverList.separated(itemBuilder: (context, index) =>CustomNotificationItem() , separatorBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: const Divider(
              thickness: 1,
              height: 1,
              color: Color(0xffEAEAEA),
            ),
          ),itemCount: 2,),
          SliverToBoxAdapter(child: SizedBox(height: 24.h,)),
          SliverToBoxAdapter(child:   SvgPicture.asset(AppImage.bigLine),),
          SliverToBoxAdapter(child: SizedBox(height: 28.h,)),
          SliverToBoxAdapter(child: Padding(
            padding:  EdgeInsets.only(left: 20.w),
            child: CustomText(text: "Today", fontSize: 14.sp, color: AppColor.subFontColor, fontWeight: FontWeight.w600,),
          )),
          SliverToBoxAdapter(child: SizedBox(height: 16.h,)),
          SliverList.separated(itemBuilder: (context, index) =>CustomNotificationItem() , separatorBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: const Divider(
              thickness: 1,
              height: 1,
              color: Color(0xffEAEAEA),
            ),
          ),itemCount: 4,),
        ]
      ),

    );
  }
}
class CustomNotificationItem extends StatelessWidget {


  const CustomNotificationItem({

    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              Container(
                height: 44.h,
                width: 44.w,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: ShapeDecoration(
                    color: AppColor.backgroundColor, shape: CircleBorder()),
                child: Image.asset(AppImage.discount),
              ),

              SizedBox(
                width: 16.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "30% Special Discount!",
                    color: AppColor.fontColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                  CustomText(
                    text: "Special promotion only valid today",
                    color: AppColor.subFontColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
                ],
              ),


            ],
          ),

        ],
      ),

    );
  }
}