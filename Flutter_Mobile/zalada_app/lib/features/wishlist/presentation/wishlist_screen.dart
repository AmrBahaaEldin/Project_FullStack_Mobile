import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce_app/core/constants/app_color.dart';
import 'package:e_commerce_app/core/constants/app_image.dart';
import 'package:e_commerce_app/core/db/db_local/db_local_helper.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:e_commerce_app/features/cart/logic/cart_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/detail_product_screen.dart';
import 'package:e_commerce_app/features/layout/presentation/layout_screen.dart';
import 'package:e_commerce_app/features/wishlist/logic/wishlist_cubit.dart';
import 'package:e_commerce_app/features/wishlist/logic/wishlist_state.dart';
import 'package:e_commerce_app/features/wishlist/presentation/widget/favourite_Item.dart';
import 'package:e_commerce_app/features/wishlist/presentation/widget/favourite_Item_empty.dart';
import 'package:e_commerce_app/features/wishlist/presentation/widget/loading_favourite_item.dart';
import 'package:e_commerce_app/features/wishlist/presentation/wishlist_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
        FavouriteCubit()..getFavouriteData(),
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LayoutScreen(),
                          ),
                              (route) => false);
                    },
                    child: Container(
                        height: 44.h,
                        width: 44.h,
                        padding:
                        EdgeInsets.symmetric(
                            vertical: 12.h, horizontal: 12.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(34.r),
                              bottomRight: Radius.circular(34.r),
                              topLeft: Radius.circular(34.r),
                              topRight: Radius.circular(34.r),
                            ),
                            border: Border.all(
                                color: AppColor.fontLabelColor, width: 1.w)),
                        child: Icon(
                          Icons.arrow_back_outlined,
                          size: 20.sp,
                        )),
                  ),
                  CustomText(
                    text: "WishList",
                    color: AppColor.fontColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                ],
              ),
            ),
            body:BlocBuilder<FavouriteCubit, FavouriteState>(
                builder: (context, state) {
                  if (state is FavouriteLoading ) {
                    return const LoadingFavouriteItem();
                  } else if (FavouriteCubit.get(context).favouriteProduct.isNotEmpty ||state is FavouriteProductDeleted) {
                    return FavouriteItem();
                  } else if (FavouriteCubit.get(context).favouriteProduct.isEmpty ) { {
                    return FavouriteItemEmpty();
                  }
                  }
                  return FavouriteItemEmpty();
                }

            )


        )
    );
  }
}



