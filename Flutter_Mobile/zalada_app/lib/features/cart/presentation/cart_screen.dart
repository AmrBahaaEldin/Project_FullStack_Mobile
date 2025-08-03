import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce_app/core/constants/app_color.dart';
import 'package:e_commerce_app/core/constants/app_image.dart';
import 'package:e_commerce_app/core/db/db_local/db_local_helper.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:e_commerce_app/core/widgets/custom_text_button.dart';
import 'package:e_commerce_app/features/cart/logic/cart_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/detail_product_screen.dart';
import 'package:e_commerce_app/features/layout/presentation/layout_screen.dart';
import 'package:e_commerce_app/features/order/presentation/confirm_order_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      CartCubit()
        ..getCartData(),
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
                  text: "Cart",
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
          body:BlocBuilder<CartCubit, CartState>(
  builder: (context, state) {
    if (state is CartLoading ) {
      return const LoadingItem();
    } else if (CartCubit.get(context).products.isNotEmpty ||state is CartProductDeleted) {
      return Column(
        children: [
          Expanded(child: CartItem()),
          Container(
              height: 112.h,
              padding: EdgeInsets.only(
                  left: 20.w, right: 20.w, top: 16.h, bottom: 40.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.r),
                  topRight: Radius.circular(24.r),
                ),
              ),
              child: Expanded(
                  child: CustomTextButton(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ConfirmOrderScreen();
                              },
                            )).then((value){
                           if (value==true){
                             context.read<CartCubit>().getCartData();
                           }
                        });
                      },
                      label: "Checkout"))),
        ],
      );
    } else if (CartCubit.get(context).products.isEmpty ) { {
      return CartEmpty();
    }
    }
    return CartEmpty();
  }

)


      )
    );
  }
}
class LoadingItem extends StatelessWidget {
  const LoadingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColor.importFontColor,
      ),
    );
  }
}
class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 20.w,top: 10.h),

      child: GridView.builder(itemCount: CartCubit.get(context).products.length,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio:   159.h /215.w,
            crossAxisCount: 2,
          crossAxisSpacing: 16.h,
          mainAxisSpacing: 20.h
        ), itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (c) {
              return DetailProductScreen(id: CartCubit.get(context).products[index].id.toString());
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
                    imageUrl: CartCubit.get(context).products[index].image!,
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
                  text:CartCubit.get(context).products[index].title!.toLowerCase(),
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
                      "\$${CartCubit.get(context).products[index].price!.toString()}",
                      fontSize: 16.sp,
                      color: AppColor.importFontColor,
                      fontWeight: FontWeight.w700,
                    ),
                    IconButton(onPressed: () {
                     CartCubit.get(context).deleteProduct(CartCubit.get(context).products[index].id!);
    
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
class CartEmpty extends StatelessWidget {
  const CartEmpty({
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
            SvgPicture.asset(AppImage.card),
            SizedBox(
              height: 24.h,
            ),
            CustomText(
                text: "Your cart is an empty!",
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
