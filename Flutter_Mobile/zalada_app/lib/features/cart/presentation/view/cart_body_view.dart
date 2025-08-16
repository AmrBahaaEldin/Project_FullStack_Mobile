import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zalada_app/features/cart/presentation/view/widget/cart_empty.dart';
import 'package:zalada_app/features/cart/presentation/view/widget/cart_list_product.dart';
import 'package:zalada_app/features/cart/presentation/view/widget/product_list.dart';
import 'package:zalada_app/features/product/manager/logic/cart_add_cubit.dart';
import 'package:zalada_app/features/product/manager/logic/cart_add_state.dart';

import '../../../../core/constant/color_app.dart';
import '../../../../core/constant/style_app.dart';
import '../../../../core/widgets/custom_button_app.dart';
import '../../../../core/widgets/custom_loading_widget.dart';
import '../../../../core/widgets/toast_message_app.dart';
import '../../manager/logic/showProducts/products_show_cubit.dart';
import '../../manager/logic/showProducts/products_show_state.dart';

import '../../manager/logic/showcart/cart_cubit.dart';
import '../../manager/logic/showcart/cart_state.dart';

class CartBodyView extends StatelessWidget {
  const CartBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: CustomScrollView(
        slivers: [
          BlocConsumer<CartCubit, CartState>(
            listener: (context, state) {
              if (state is CartAddLoaded) {
                ToastMessage.showToast(
                  backGroundColor: ColorApp.green100,
                  message: "Fetched Cart",
                );
              }
              if (state is CartFailure) {
                ToastMessage.showToast(
                  backGroundColor: ColorApp.red100,
                  message: state.failure.errorMessage,
                );
              }
            },
            builder: (context, state) {
              if (state is CartLoaded &&
                  state.userCartModel.carts!.isNotEmpty) {
                return CartListProduct(
                  itemCount: state.userCartModel.carts![0].products!.length,
                  cart: state.userCartModel.carts![0].products!,
                );
              } else if (state is CartLoading) {
                return const SliverToBoxAdapter(
                  child: Center(child: CustomLoadingWidget()),
                );
              } else {
                return const SliverToBoxAdapter(child: CartEmpty());
              }
            },
          ),
          SliverToBoxAdapter(child: SizedBox(height: 30.h)),
          const SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Products May You Like",
                style: StylesTextApp.textStyle18,
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16.h)),
          BlocBuilder<ProductsShowCubit, ProductsShowState>(
            builder: (context, state) {
              if (state is ProductsShowLoaded) {
                return SliverToBoxAdapter(
                  child: SizedBox(
                    height: 200.h,
                    child: ProductList(products: state.userCartModel.products!),
                  ),
                );
              } else {
                return const SliverToBoxAdapter(
                  child: Center(child: CustomLoadingWidget()),
                );
              }
            },
          ),

          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              if (state is CartLoaded &&
                  state.userCartModel.carts!.isNotEmpty) {
                return SliverToBoxAdapter(
                  child: CustomButtonApp(
                    isTwins: true,
                    widget: Container(
                      padding: const EdgeInsetsDirectional.all(10),
                      decoration: BoxDecoration(
                        color: ColorApp.light100,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Text(
                        state.userCartModel.carts![0].totalProducts.toString(),
                        style: StylesTextApp.textStyle14.copyWith(
                          color: ColorApp.dark100,
                        ),
                      ),
                    ),
                    text: "Checkout",
                    boxColor: ColorApp.blue60,
                  ),
                );
              } else {
                return const SliverToBoxAdapter();
              }
            },
          ),
        ],
      ),
    );
  }
}
