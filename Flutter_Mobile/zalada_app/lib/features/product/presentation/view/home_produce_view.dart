import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:readmore/readmore.dart';
import 'package:zalada_app/core/constant/color_app.dart';
import 'package:zalada_app/core/constant/router_app.dart';
import 'package:zalada_app/core/constant/style_app.dart';
import 'package:zalada_app/core/utils/cache_db_app.dart';
import 'package:zalada_app/core/widgets/custom_button_app.dart';
import 'package:zalada_app/core/widgets/toast_message_app.dart';
import 'package:zalada_app/features/cart/presentation/view/widget/counter_item_product.dart';
import 'package:zalada_app/features/product/data/model/cart_add_input_model.dart';
import 'package:zalada_app/features/product/data/model/products_data.dart';
import 'package:zalada_app/features/product/manager/logic/cart_add_cubit.dart';
import 'package:zalada_app/features/product/manager/logic/cart_add_state.dart';
import 'package:zalada_app/features/product/presentation/view/widget/item_produce.dart';
import 'package:zalada_app/features/product/presentation/view/widget/related_produce.dart';

class HomeProduceView extends StatelessWidget {
  const HomeProduceView({required this.produceData, super.key});

  final ProduceData produceData;

  @override
  Widget build(BuildContext context) {
    final double afterdiscount =
        produceData.dataItemProduce.price! -
            produceData.dataItemProduce.discountPercentage!;
    return BlocListener<CartAddCubit, CartAddState>(
      listener: (context, state) {
        if (state is CartAddLoaded && state.cartAddModel.products!.isNotEmpty) {
          ToastMessage.showToast(
            backGroundColor: ColorApp.green60,
            message: '${state.cartAddModel.totalQuantity!}',
          );
        }
        if (state is CartAddFailure) {
          ToastMessage.showToast(
            backGroundColor: ColorApp.red60,
            message: state.failure.errorMessage,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              GoRouter.of(context).go(RouterApp.mainNavigation);
            },
            icon: const Icon(Icons.arrow_back, color: ColorApp.dark100),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(left: 10.w, bottom: 5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ItemProduce(
                    data: produceData.dataItemProduce,
                    afterdiscount: afterdiscount,
                  ),
                ),
                SizedBox(height: 25.h),
                const Text(
                  "Product Description",
                  style: StylesTextApp.textStyle18,
                ),
                SizedBox(height: 12.h),
                ReadMoreText(
                  style: StylesTextApp.textStyle14.copyWith(
                    color: ColorApp.dark25,
                  ),
                  produceData.dataItemProduce.description!,
                  trimLines: 2,
                  // عدد السطور قبل إظهار more
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Read More',
                  trimExpandedText: 'Less',
                  moreStyle: StylesTextApp.textStyle14.copyWith(
                    color: ColorApp.blue100,
                  ),
                  lessStyle: StylesTextApp.textStyle14.copyWith(
                    color: ColorApp.red100,
                  ),
                ),
                SizedBox(height: 30.h),
                BlocBuilder<CartAddCubit, CartAddState>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                         CounterItemProduct(icon: Icons.remove,
                         onPressed: () {
                           context.read<CartAddCubit>().quantityProduct('minus');
                         },),
                        SizedBox(width: 15.w),
                         Text("${context.watch<CartAddCubit>().quantity}", style: StylesTextApp.textStyle14),
                        SizedBox(width: 15.w),
                         CounterItemProduct(icon: Icons.add,onPressed: () {
                           context.read<CartAddCubit>().quantityProduct("plus");

                    },),
                      ],
                    );
                  },
                ),
                SizedBox(height: 10.h),
                const Text("Product Related", style: StylesTextApp.textStyle18),
                SizedBox(height: 16.h),
                SizedBox(
                  height: 200.h,
                  child: RelatedProduce(products: produceData.dataProducts),
                ),
                SizedBox(height: 20.h),
                Center(
                  child: CustomButtonApp(
                    width: 300.w,

                    text: "Add to Cart",
                    onPressed: () {
                      context.read<CartAddCubit>().addProductToCart(
                        CartAddInputModel(
                          userId: CacheApp.getData(key: "UserId"),
                          products: [
                            ProductsAddModel(
                              idProduct: produceData.dataItemProduce.id!,
                              quantityProduct:context.read<CartAddCubit>().quantity,
                            ),
                          ],
                        ),
                      );
                    },
                    boxColor: ColorApp.blue100,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
