import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/constants/app_color.dart';
import 'package:e_commerce_app/core/constants/app_image.dart';
import 'package:e_commerce_app/core/db/db_local/db_local_helper.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:e_commerce_app/core/widgets/custom_text_button.dart';
import 'package:e_commerce_app/features/cart/presentation/cart_screen.dart';
import 'package:e_commerce_app/features/home/logic/detail_product_cubit.dart';
import 'package:e_commerce_app/features/home/logic/detail_product_state.dart';
import 'package:e_commerce_app/features/layout/presentation/layout_screen.dart';
import 'package:e_commerce_app/features/order/presentation/confirm_order_screen.dart';
import 'package:e_commerce_app/features/wishlist/presentation/wishlist_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailProductScreen extends StatelessWidget {
  final String id;

  const DetailProductScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DetailProductCubit()..getAllDetailProductAndProducts(id: id),
      child: Scaffold(
        backgroundColor: Color(0xffF8F9F9),
        appBar: AppBar(
          backgroundColor: Color(0xffF8F9F9),
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
                    padding:
                        EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(34.r),
                          bottomRight: Radius.circular(34.r),
                          topLeft: Radius.circular(34.r),
                          topRight: Radius.circular(34.r),
                        ),
                        border: Border.all(
                            color: Colors.grey.shade300, width: 1.w)),
                    child: Icon(
                      Icons.arrow_back_outlined,
                      size: 18.sp,
                    )),
              ),
              Spacer(),
              BlocBuilder<DetailProductCubit, DetailProductState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      try {
                        var data =
                            DetailProductCubit.get(context).detailProductModel;
                        SQLHelper.add1(data!.id.toString(), data.title!,
                            data.image!, data.rating!.count!, data.price!);
                        Navigator.push(context, MaterialPageRoute(
                          builder: (contextc) {
                            return WishListScreen();
                          },
                        ));
                      } catch (e) {
                        print(
                            "_______________${e.toString()}___________________________");
                      }
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
                                color: Colors.grey.shade300, width: 1.w)),
                        child: Icon(
                          CupertinoIcons.heart,
                          size: 18.sp,
                        )),
                  );
                },
              ),
            ],
          ),
          automaticallyImplyLeading: false,
        ),
        body: BlocBuilder<DetailProductCubit, DetailProductState>(
          builder: (context, state) {
            if (state is DetailProductLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (DetailProductCubit.get(context).detailProductModel !=
                null) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(left: 9.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: SizedBox(
                          height: 65.h,
                          width: 253.w,
                          child: CustomText(
                              text: DetailProductCubit.get(context)
                                  .detailProductModel!
                                  .title!,
                              fontSize: 24.sp,
                              color: AppColor.fontColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Center(
                        child: CustomText(
                            text:
                                "\$${DetailProductCubit.get(context).detailProductModel!.price!.toString()}",
                            fontSize: 20.sp,
                            color: AppColor.importFontColor,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image(
                            image: AssetImage(
                                "assets/png/detail_product_back.png"),
                            width: 366.w,
                            height: 123.h,
                          ),
                          CachedNetworkImage(
                            imageUrl: DetailProductCubit.get(context)
                                .detailProductModel!
                                .image!,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            height: 285.h,
                            width: 303.w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Center(
                        child: CustomText(
                            text: "Space Grey",
                            fontSize: 12.sp,
                            color: AppColor.fontColor,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              DetailProductCubit.get(context).geryColor();
                            },
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor:
                                  DetailProductCubit.get(context).colorG,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          GestureDetector(
                            onTap: () {
                              DetailProductCubit.get(context).lowGeryColor();
                            },
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor:
                                  DetailProductCubit.get(context).colorL,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.grey[200],
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          GestureDetector(
                            onTap: () {
                              DetailProductCubit.get(context).brownColor();
                            },
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor:
                                  DetailProductCubit.get(context).colorB,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.brown[100],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 22.h,
                      ),
                      SvgPicture.asset(
                        AppImage.bigLine,
                        height: 4.h,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      CustomText(
                          text: "Product Description",
                          fontSize: 18.sp,
                          color: AppColor.fontColor,
                          fontWeight: FontWeight.w600),
                      Text.rich(
                        TextSpan(
                          text:
                              "New variant MacBook Pro 15\" 2018 Intel Core i7 gen 11 with Touch Bar ID is various versions have evolved over the years.. ",
                          style: TextStyle(
                              color: AppColor.subFontColor, fontSize: 14.sp),
                          children: [
                            TextSpan(
                              text: "Read More",
                              style: TextStyle(
                                  color: AppColor.importFontColor,
                                  fontSize: 14.sp),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 52.h,
                      ),
                      CustomText(
                          text: "Product Related",
                          fontSize: 18.sp,
                          color: AppColor.fontColor,
                          fontWeight: FontWeight.w600),
                      SizedBox(
                        height: 16.h,
                      ),
                      ///////////////////////

                      ///////////////////////
                      Container(
                        height: 200.h,
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: DetailProductCubit.get(context)
                              .viewProducts
                              .length,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 16.w),
                          itemBuilder: (context, index) {
                            return Container(
                              width: 159.w,
                              height: 215.h,
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                color: Colors.white,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: DetailProductCubit.get(context)
                                        .viewProducts[index]
                                        .image!,
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                    height: 100.h,
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  CustomText(
                                    text: DetailProductCubit.get(context)
                                        .viewProducts[index]
                                        .title!,
                                    fontSize: 14.sp,
                                    color: AppColor.fontColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  CustomText(
                                    text:
                                        "\$ ${DetailProductCubit.get(context).viewProducts[index].price!}",
                                    fontSize: 16.sp,
                                    color: AppColor.importFontColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 13.h,
                      ),
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
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  try {
                                    var data = DetailProductCubit.get(context)
                                        .detailProductModel;
                                    SQLHelper.add(
                                        data!.id.toString(),
                                        data.title!,
                                        data.image!,
                                        data.rating!.count!,
                                        data.price!);
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return CartScreen();
                                      },
                                    ));
                                  } catch (e) {
                                    print(
                                        "_______________${e.toString()}___________________________");
                                  }
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
                                            color: AppColor.backgroundColor,
                                            width: 1.w)),
                                    child: Icon(
                                      CupertinoIcons.shopping_cart,
                                      size: 18.sp,
                                    )),
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Expanded(
                                  child: CustomTextButton(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return ConfirmOrderScreen();
                                          },
                                        ));
                                      },
                                      label: "Checkout")),
                            ],
                          )),
                    ],
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
