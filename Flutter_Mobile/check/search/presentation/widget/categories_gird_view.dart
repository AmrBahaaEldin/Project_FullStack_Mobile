import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/constants/app_color.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:e_commerce_app/features/home/data/home_model.dart';
import 'package:e_commerce_app/features/home/logic/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesGridView extends StatelessWidget {
final  List<HomeModel> products;
const  CategoriesGridView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 20.w,top: 10.h),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio:   159.h /215.w,
            crossAxisCount: 2,
            crossAxisSpacing: 16.h,
            mainAxisSpacing: 20.h
        ), itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(
                horizontal: 12.w, vertical: 12.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                // width: 131.w,
                // height: 123.h,
                // NetworkImage(HomeCubit.get(context)
                //     .homeModel[index]
                //     .image),
                Expanded(
                  child: CachedNetworkImage(
                    imageUrl: products[index].image!,
                    placeholder: (context, url) =>
                        CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        Icon(Icons.error),
                    height: 123.h,
                    width: 131.w,
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                CustomText(
                  text:products[index].title!,
                  fontSize: 14.sp,
                  color: AppColor.fontColor,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: 4.h,
                ),
                CustomText(
                  text:
                  "\$${products[index].price!}",
                  fontSize: 16.sp,
                  color: AppColor.importFontColor,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          );
        },),
    );
  }
}


