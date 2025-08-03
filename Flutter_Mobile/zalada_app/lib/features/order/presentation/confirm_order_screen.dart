import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/constants/app_color.dart';
import 'package:e_commerce_app/core/constants/app_image.dart';
import 'package:e_commerce_app/core/db/db_local/db_local_helper.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:e_commerce_app/core/widgets/custom_text_button.dart';
import 'package:e_commerce_app/features/cart/logic/cart_cubit.dart';
import 'package:e_commerce_app/features/cart/model/card%20_model.dart';
import 'package:e_commerce_app/features/cart/presentation/cart_screen.dart';
import 'package:e_commerce_app/features/home/logic/detail_product_cubit.dart';
import 'package:e_commerce_app/features/order/logic/order_cubit.dart';
import 'package:e_commerce_app/features/order/presentation/order_success.dart';
import 'package:e_commerce_app/features/order/presentation/select_address_screen.dart';
import 'package:e_commerce_app/features/order/presentation/widget/custom_order_item.dart';
import 'package:e_commerce_app/features/order/presentation/widget/custom_shipping_item.dart';
import 'package:e_commerce_app/features/order/presentation/widget/payment_method.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConfirmOrderScreen extends StatelessWidget {
  const ConfirmOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getCartData(),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          List<CartModel> products = context.read<CartCubit>().products;
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        height: 44.h,
                        width: 44.h,
                        padding: EdgeInsets.symmetric(
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
                    text: "Order",
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
            body: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding:
                        EdgeInsets.only(left: 20.w, right: 20.w, top: 16.h),
                    children: [
                      Row(
                        children: [
                          CustomText(
                              text: "Address",
                              fontSize: 18.sp,
                              color: AppColor.fontColor,
                              fontWeight: FontWeight.w600),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SelectAddressScreen(),
                                  ));
                            },
                            child: CustomText(
                                text: "Edit",
                                fontSize: 14.sp,
                                color: AppColor.importFontColor,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      CustomText(
                          text: "🏠  Home",
                          fontSize: 14.sp,
                          color: AppColor.fontColor,
                          fontWeight: FontWeight.w600),
                      SizedBox(
                        height: 8.h,
                      ),
                      CustomText(
                          text: "10th of ramadan City",
                          fontSize: 12.sp,
                          color: AppColor.subFontColor,
                          fontWeight: FontWeight.w400),
                      CustomText(
                          text: "Items",
                          fontSize: 18.sp,
                          color: AppColor.fontColor,
                          fontWeight: FontWeight.w600),
                      SvgPicture.asset(
                        height: 4.h,
                        width: 375.w,
                        AppImage.bigLine,
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      ////item///
                      ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Row(
                                children: [
                                  Container(
                                    width: 93.51.w,
                                    height: 94.5.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.r),
                                      color: AppColor.backgroundColor,
                                    ),
                                    // 131.w,
                                    // height: 123.h,
                                    child: CachedNetworkImage(
                                        height: 123.h,
                                        width: 131.w,
                                        imageUrl: products[index].image!),
                                  ),
                                  SizedBox(
                                    width: 18,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                            text: products[index].title!,
                                            fontSize: 14.sp,
                                            color: AppColor.fontColor,
                                            fontWeight: FontWeight.w600),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        CustomText(
                                            text: "\$${products[index].price!}",
                                            fontSize: 14.sp,
                                            color: AppColor.importFontColor,
                                            fontWeight: FontWeight.w700),
                                        SizedBox(
                                          height: 8.5.h,
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                context
                                                    .read<CartCubit>()
                                                    .decrementProductQuantity(
                                                        products[index].id!,
                                                        index);
                                              },
                                              child: Container(
                                                width: 28.w,
                                                height: 28.h,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20.r)),
                                                    border: Border.all(
                                                      width: 1,
                                                      color: AppColor
                                                          .backgroundColor,
                                                    )),
                                                padding: EdgeInsets.all(6),
                                                child: Icon(
                                                  CupertinoIcons.minus,
                                                  size: 20,
                                                  color: Color(0xffCACACA),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 8.w),
                                            CustomText(
                                                text: context
                                                    .watch<CartCubit>()
                                                    .products[index]
                                                    .quantity
                                                    .toString(),
                                                fontSize: 14.sp,
                                                color: AppColor.fontColor,
                                                fontWeight: FontWeight.w500),
                                            SizedBox(width: 8.w),
                                            GestureDetector(
                                              onTap: () {
                                                context
                                                    .read<CartCubit>()
                                                    .incrementProductQuantity(
                                                        products[index].id!,
                                                        index);
                                              },
                                              child: Container(
                                                width: 28.w,
                                                height: 28.h,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20.r)),
                                                    border: Border.all(
                                                        width: 1,
                                                        color: AppColor
                                                            .backgroundColor)),
                                                padding: EdgeInsets.all(6),
                                                child: Icon(
                                                  CupertinoIcons.add,
                                                  size: 16,
                                                  color: AppColor.fontColor,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 28.w,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                context
                                                    .read<CartCubit>()
                                                    .deleteProduct(
                                                        products[index].id!);
                                              },
                                              child: Container(
                                                width: 28.w,
                                                height: 28.h,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color:
                                                      AppColor.backgroundColor,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(20.r),
                                                  ),
                                                ),
                                                padding: EdgeInsets.all(6),
                                                child: Icon(
                                                  Icons.delete_outline,
                                                  size: 16,
                                                  color:
                                                      AppColor.fontSelectColor,
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            CustomText(
                                                text:'x${products[index]
                                                    .quantity!
                                                    .toString()}',
                                                fontSize: 14.sp,
                                                color: AppColor.fontColor,
                                                fontWeight: FontWeight.w400),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                          itemCount: products.length,
                          separatorBuilder: (context, index) => SizedBox(
                                height: 18.h,
                              )),
                      SizedBox(height: 14.h),
                      Divider(
                        height: 1,
                        color: AppColor.backgroundColor,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      SvgPicture.asset(
                        height: 4.h,
                        width: 375.w,
                        AppImage.bigLine,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      CustomText(
                          text: "Shipping",
                          fontSize: 18.sp,
                          color: AppColor.fontColor,
                          fontWeight: FontWeight.w600),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomShippingItem(),
                      SizedBox(
                        height: 24.h,
                      ),
                      SvgPicture.asset(
                        height: 4.h,
                        width: 375.w,
                        AppImage.bigLine,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      CustomText(
                          text: "Payment Summary",
                          fontSize: 18.sp,
                          color: AppColor.fontColor,
                          fontWeight: FontWeight.w600),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        children: [
                          CustomText(
                              text: "Price",
                              fontSize: 14.sp,
                              color: AppColor.subFontColor,
                              fontWeight: FontWeight.w400),
                          Spacer(),
                          CustomText(
                              text: '\$${context.read<CartCubit>().totalPrice}',
                              fontSize: 14.sp,
                              color: AppColor.fontColor,
                              fontWeight: FontWeight.w600),
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Row(
                        children: [
                          CustomText(
                              text: "Delivery Fee",
                              fontSize: 14.sp,
                              color: AppColor.subFontColor,
                              fontWeight: FontWeight.w400),
                          Spacer(),
                          CustomText(
                              text: "\$ 4.53",
                              fontSize: 14.sp,
                              color: AppColor.fontColor,
                              fontWeight: FontWeight.w600),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Divider(
                        height: 2,
                        color: AppColor.backgroundColor,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        children: [
                          CustomText(
                              text: "Total Payment",
                              fontSize: 14.sp,
                              color: AppColor.subFontColor,
                              fontWeight: FontWeight.w400),
                          Spacer(),
                          CustomText(
                              text:
                                  '\$ ${context.read<CartCubit>().totalPriceWithShipping}',
                              fontSize: 14.sp,
                              color: AppColor.fontColor,
                              fontWeight: FontWeight.w600),
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      SvgPicture.asset(
                        height: 4.h,
                        width: 375.w,
                        AppImage.bigLine,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      CustomText(
                          text: "Payment Summary",
                          fontSize: 18.sp,
                          color: AppColor.fontColor,
                          fontWeight: FontWeight.w600),
                      SizedBox(
                        height: 16.h,
                      ),
                      PaymentMethod(),
                      SizedBox(
                        height: 24.h,
                      ),
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(
                        left: 20.w, right: 20.w, top: 16.h, bottom: 27.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.r),
                        topRight: Radius.circular(24.r),
                      ),
                    ),
                    child: CustomTextButton(
                        onTap: () => showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                    child:OrderSuccessScreen());
                              },
                            ),
                        label:
                            'Pay \$ ${context.read<CartCubit>().totalPriceWithShipping}')),
              ],
            ),
          );
        },
      ),
    );
  }
}
