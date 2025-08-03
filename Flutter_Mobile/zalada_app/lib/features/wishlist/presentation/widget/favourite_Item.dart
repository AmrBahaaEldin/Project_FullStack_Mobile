import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/constants/app_color.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:e_commerce_app/features/home/presentation/detail_product_screen.dart';
import 'package:e_commerce_app/features/wishlist/logic/wishlist_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteItem extends StatelessWidget {
  const FavouriteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 20.w,top: 10.h),
      child: GridView.builder(itemCount: FavouriteCubit.get(context).favouriteProduct.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
            crossAxisSpacing: 16.h,
            mainAxisSpacing: 20.h
        ), itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (c) {
                return DetailProductScreen(id: FavouriteCubit.get(context).favouriteProduct[index].id.toString());
              },));
            },
            child: Container(
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
                      imageUrl:  FavouriteCubit.get(context).favouriteProduct[index].image!,
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
                    text:FavouriteCubit.get(context).favouriteProduct[index].title!.toLowerCase(),
                    fontSize: 14.sp,
                    color: AppColor.fontColor,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text:
                        "\$${FavouriteCubit.get(context).favouriteProduct[index].price!}",
                        fontSize: 16.sp,
                        color: AppColor.importFontColor,
                        fontWeight: FontWeight.w700,
                      ),
                      IconButton(onPressed: () {
                        FavouriteCubit.get(context).deleteFavouriteProduct(FavouriteCubit.get(context).favouriteProduct[index].id!);

                      }, icon:Icon(CupertinoIcons.delete_solid),color:AppColor.fontSelectColor, )
                    ],
                  ),
                ],
              ),
            ),
          );
        },),
    );
  }
}